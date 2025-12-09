return {

  {
    "mavantgarderc/prismpunk.nvim",
    dev = true,
    dependencies = { "echasnovski/mini.hipatterns" },
    lazy = false,
    priority = 1000,
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function() vim.cmd.colorscheme("lantern-corps-phantom-corrupted") end,
      })
    end,
    config = function()
      local M = {
        module = "prismpunk",
        colorscheme = "lantern-corps-phantom-corrupted",
        opts = {
          theme = "dc/lantern-corps/phantom-corrupted",

          terminals = {
            enabled = true,
            emulator = { "ghostty" },

            ghostty = {
              enabled = true,
              auto_reload = true,
              config_path = vim.fn.expand("~/.config/ghostty/themes/prismpunk.toml"),
            },
          },
        },
        enabled = true,
      }

      local INDICATOR_CONFIG = {
        glyph = "◼ ",
      }

      local PRISMPUNK_NS = vim.api.nvim_create_namespace("prismpunk_colors")
      local PRISMPUNK_HOVER_NS = vim.api.nvim_create_namespace("prismpunk_hover")

      local function normalize_filepath(path)
        if not path or path == "" then return "" end
        return path:gsub("^oil:///*", "/"):gsub("^oil:", "")
      end

      local function load_prismpunk_theme()
        package.loaded.prismpunk = nil

        local ok, prismpunk = pcall(require, "prismpunk")
        if not ok or not prismpunk or type(prismpunk.setup) ~= "function" then return false end

        prismpunk.setup(M.opts)

        vim.defer_fn(function() pcall(vim.cmd.colorscheme, M.colorscheme) end, 50)

        return true
      end

      local function ensure_hipatterns()
        local ok, hip = pcall(require, "mini.hipatterns")
        if not ok or not hip then
          vim.notify("prismpunk: mini.hipatterns not found. Please install it.", vim.log.levels.ERROR)
          return false
        end
        return true
      end

      local function hex_to_rgb(hex)
        hex = hex:gsub("#", "")
        if #hex == 3 then hex = hex:gsub("(.)", "%1%1") end
        return {
          tonumber(hex:sub(1, 2), 16) / 255,
          tonumber(hex:sub(3, 4), 16) / 255,
          tonumber(hex:sub(5, 6), 16) / 255,
        }
      end

      local function get_contrast_color(hex)
        local r, g, b = unpack(hex_to_rgb(hex))  -- luacheck: ignore
        local luminance = 0.299 * r + 0.587 * g + 0.114 * b
        return luminance > 0.5 and "#000000" or "#FFFFFF"
      end

      local palette_cache = {}
      local color_indicators = {}
      local processed_buffers = {}

      local function extract_palette_module(bufnr)
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
        for _, line in ipairs(lines) do
          local match = line:match('require%("prismpunk%.palettes%.([^"]+)"')
          if match then return "prismpunk.palettes." .. match end
        end
        return nil
      end

      local function load_palette(module_name)
        if palette_cache[module_name] then return palette_cache[module_name] end

        local ok, palette = pcall(require, module_name)
        if ok and type(palette) == "table" then
          palette_cache[module_name] = palette
          return palette
        end

        local module_path = module_name:gsub("%.", "/")
        local search_paths = vim.api.nvim_get_runtime_file("lua/" .. module_path .. ".lua", false)

        for _, path in ipairs(search_paths) do
          local norm = normalize_filepath(path)
          if vim.fn.filereadable(norm) == 1 then
            local content = vim.fn.readfile(norm)
            local chunk, err = load(table.concat(content, "\n"))
            if chunk then
              local success, result = pcall(chunk)
              if success and type(result) == "table" then
                palette_cache[module_name] = result
                return result
              end
            else
              vim.notify("Failed to load palette: " .. err, vim.log.levels.ERROR)
            end
          end
        end

        return nil
      end

      local function resolve_palette_color(bufnr, palette_ref)
        local module_name = extract_palette_module(bufnr)
        if not module_name then return nil end

        local palette = load_palette(module_name)
        if not palette then return nil end

        local key = palette_ref:match("plt%.([%w_]+)")
          or palette_ref:match("palette%.([%w_]+)")
          or palette_ref:match("p%.([%w_]+)")

        local color = key and palette[key]
        if type(color) == "string" then return color end
        if type(color) == "table" and type(color[1]) == "string" then return color[1] end

        return nil
      end

      local function create_color_indicator(bufnr, lnum, hex_color, palette_ref)
        vim.api.nvim_buf_clear_namespace(bufnr, PRISMPUNK_NS, lnum, lnum + 1)

        local swatch = INDICATOR_CONFIG.glyph
        local hl_name = "PrismPunkColor_" .. hex_color:gsub("#", "")

        vim.api.nvim_set_hl(0, hl_name, {
          bg = hex_color,
          fg = hex_color,
          bold = false,
        })

        local line = vim.api.nvim_buf_get_lines(bufnr, lnum, lnum + 1, false)[1]
        if not line then return end

        local text_start = line:match("^%s*()")
        if not text_start then text_start = 1 end

        local indicator_col = math.max(0, text_start - 4)

        vim.api.nvim_buf_set_extmark(bufnr, PRISMPUNK_NS, lnum, indicator_col, {
          virt_text = { { swatch, hl_name } },
          virt_text_pos = "overlay",
          hl_mode = "combine",
          priority = 100,
        })

        color_indicators[bufnr .. ":" .. lnum] = {
          hex = hex_color,
          ref = palette_ref,
        }
      end

      local function clear_indicators(bufnr)
        vim.api.nvim_buf_clear_namespace(bufnr, PRISMPUNK_NS, 0, -1)
        for k in pairs(color_indicators) do
          if k:match("^" .. bufnr .. ":") then color_indicators[k] = nil end
        end
        processed_buffers[bufnr] = nil
      end

      local function show_hover()
        local bufnr = vim.api.nvim_get_current_buf()
        local win = vim.api.nvim_get_current_win()
        local lnum = vim.api.nvim_win_get_cursor(win)[1] - 1

        local key = bufnr .. ":" .. lnum
        local indicator = color_indicators[key]

        if indicator then
          local display_text = indicator.ref .. " = " .. indicator.hex
          local lines = { display_text }
          local buf = vim.api.nvim_create_buf(false, true)
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

          local hl_name = "PrismPunkHover_" .. indicator.hex:gsub("#", "")
          vim.api.nvim_set_hl(0, hl_name, {
            bg = indicator.hex,
            fg = get_contrast_color(indicator.hex),
            bold = true,
          })

          vim.api.nvim_buf_set_extmark(buf, PRISMPUNK_HOVER_NS, 0, 0, {
            end_line = 0,
            hl_group = hl_name,
            end_col = #display_text,
          })

          local win_id = vim.api.nvim_open_win(buf, false, {
            relative = "cursor",
            row = 0,
            col = 0,
            style = "minimal",
            border = "rounded",
            focusable = false,
            width = #display_text,
            height = 1,
          })

          vim.defer_fn(function()
            if vim.api.nvim_win_is_valid(win_id) then vim.api.nvim_win_close(win_id, true) end
            if vim.api.nvim_buf_is_valid(buf) then vim.api.nvim_buf_delete(buf, { force = true }) end
          end, 2000)
        end
      end

      local function process_buffer(bufnr)
        if not ensure_hipatterns() then return end

        local path = normalize_filepath(vim.api.nvim_buf_get_name(bufnr))
        if not path:match("prismpunk") then return end
        if processed_buffers[bufnr] then return end

        processed_buffers[bufnr] = true
        clear_indicators(bufnr)

        local is_palette = path:match("palettes/.*%.lua$")
        local is_theme = path:match("themes/.*%.lua$")
        if not (is_palette or is_theme) then return end

        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

        for lnum, line in ipairs(lines) do
          if is_palette then
            local hex = line:match("#[0-9a-fA-F]+")
            if hex then create_color_indicator(bufnr, lnum - 1, hex, hex) end
          elseif is_theme then
            local ref = line:match("plt%.[%w_]+") or line:match("palette%.[%w_]+") or line:match("p%.[%w_]+")

            if ref then
              local hex = resolve_palette_color(bufnr, ref)
              if hex then create_color_indicator(bufnr, lnum - 1, hex, ref) end
            else
              local hex = line:match("#[0-9a-fA-F]+")
              if hex then create_color_indicator(bufnr, lnum - 1, hex, hex) end
            end
          end
        end
      end

      local function setup_autocmds()
        local group = vim.api.nvim_create_augroup("PrismPunkColorIndicators", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
          group = group,
          pattern = "*prismpunk/*.lua",
          callback = function(args)
            if args.event == "BufWritePost" then processed_buffers[args.buf] = nil end
            vim.defer_fn(function() process_buffer(args.buf) end, 100)
          end,
        })

        vim.api.nvim_create_autocmd("BufLeave", {
          group = group,
          pattern = "*prismpunk/*.lua",
          callback = function(args) clear_indicators(args.buf) end,
        })
      end

      local function toggle_indicators()
        M.enabled = not M.enabled

        if M.enabled then
          setup_autocmds()
          vim.notify("PrismPunk color indicators enabled")

          local bufnr = vim.api.nvim_get_current_buf()
          if vim.api.nvim_buf_get_name(bufnr):match("prismpunk") then process_buffer(bufnr) end
        else
          pcall(vim.api.nvim_del_augroup_by_name, "PrismPunkColorIndicators")

          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if vim.api.nvim_buf_is_loaded(buf) then clear_indicators(buf) end
          end

          vim.notify("PrismPunk color indicators disabled")
        end
      end

      local function setup_keymaps()
        vim.keymap.set("n", "<leader>ch", show_hover, {
          desc = "Show color hover information",
        })
      end

      local theme_loaded = load_prismpunk_theme()

      if theme_loaded and ensure_hipatterns() then
        setup_autocmds()
        setup_keymaps()

        vim.api.nvim_create_user_command("PrismPunkToggleIndicators", toggle_indicators, {
          desc = "Toggle PrismPunk color indicators",
        })

        vim.defer_fn(function()
          local bufnr = vim.api.nvim_get_current_buf()
          local bufname = vim.api.nvim_buf_get_name(bufnr)
          if bufname:match("prismpunk") then process_buffer(bufnr) end
        end, 100)
      end
    end,
  },

  {
    "mavantgarderc/raphael.nvim",
    dev = true,
    lazy = false,
    priority = 999,
    config = function()
      local function scan_prismpunk_colorschemes()
        local themes = {}
        local theme_groups = {}

        local prismpunk_colors_paths = {}

        local rtp_paths = vim.api.nvim_get_runtime_file("colors", true)
        for _, path in ipairs(rtp_paths) do
          if path:match("prismpunk%.nvim") then table.insert(prismpunk_colors_paths, path) end
        end

        if #prismpunk_colors_paths == 0 then
          prismpunk_colors_paths = {
            vim.fn.stdpath("data") .. "/lazy/prismpunk.nvim/colors",
          }
        end

        for _, colors_path in ipairs(prismpunk_colors_paths) do
          local expanded_path = vim.fn.expand(colors_path)
          if vim.fn.isdirectory(expanded_path) == 1 then
            local colorscheme_files = vim.fn.glob(expanded_path .. "/*.lua", false, true)
            local colorscheme_vim_files = vim.fn.glob(expanded_path .. "/*.vim", false, true)

            vim.list_extend(colorscheme_files, colorscheme_vim_files)

            for _, file in ipairs(colorscheme_files) do
              local colorscheme_name = vim.fn.fnamemodify(file, ":t:r")

              if not vim.tbl_contains(themes, colorscheme_name) then
                table.insert(themes, colorscheme_name)

                local category = "other"

                -- LANTERNCORPS
                if colorscheme_name:match("lantern%-corps") then
                  category = "dc/lantern-corps"
                -- CRIME SYNDICATE
                elseif colorscheme_name:match("crime%-syndicate") then
                  category = "dc/crime-syndicate"
                -- BAT FAMILY
                elseif colorscheme_name:match("bat%-family") then
                  category = "dc/bat-family"
                -- INJUSTICE LEAGUE
                elseif colorscheme_name:match("injustice%-league") then
                  category = "dc/injustice-league"
                -- ARKHAM ASYLUM
                elseif colorscheme_name:match("arkham%-aylum") then
                  category = "dc/arkham-asylum"
                -- JUSTICE LEAGUE
                elseif colorscheme_name:match("justice%-league") then
                  category = "dc/justice-league"
                -- EMOTIONAL SPECTRUM
                elseif colorscheme_name:match("emotional%-entities") then
                  category = "dc/emotional-entities"
                -- NEW GENESIS
                elseif colorscheme_name:match("new%-genesis") then
                  category = "dc/new-genesis"
                -- SUPER FAMILY
                elseif colorscheme_name:match("super%-family") then
                  category = "dc/super-family"
                -- WATCHMEN
                elseif colorscheme_name:match("watchmen") then
                  category = "dc/watchmen"
                -- LEAGUE OF ASSASINS
                elseif colorscheme_name:match("league%-of%-assassins") then
                  category = "dc/league-of-assassins"
                -- DC/APOKOLIPS
                elseif colorscheme_name:match("apokolips") then
                  category = "dc/apokolips"
                -- PUNK CULTURES
                elseif colorscheme_name:match("punk$") or colorscheme_name:match("punk%-") then
                  category = "punk-cultures"
                -- DETOX
                elseif colorscheme_name:match("detox") then
                  category = "detox"
                -- KANAGAWA
                elseif colorscheme_name:match("kanagawa") then
                  category = "kanagawa"
                -- TMNT
                elseif colorscheme_name:match("tmnt%-") or colorscheme_name:match("tmnt$") then
                  category = "tmnt"
                -- NVIM BUILT-IN THEMES
                elseif colorscheme_name:match("nvim%-builtins") or colorscheme_name:match("nvim%-builtins%-") then
                  category = "nvim-builtins"
                end

                if not theme_groups[category] then theme_groups[category] = {} end
                table.insert(theme_groups[category], colorscheme_name)
              end
            end

            if #themes > 0 then break end
          end
        end

        return theme_groups, themes
      end

      local function prismpunk_startup_message(msg, level)
        level = level or vim.log.levels.INFO
        local ok, n = pcall(require, "notify")
        if ok and type(n) == "function" then
          n(msg, level, { timeout = false })
        else
          vim.api.nvim_echo({ { msg, "MoreMsg" } }, true, {})
        end
      end

      local theme_groups, all_themes = scan_prismpunk_colorschemes()

      if #all_themes == 0 then
        theme_groups = {
          ["dc/lantern-corps"] = { "lantern-corps-phantom-corrupted" },
        }
        vim.schedule(
          function() prismpunk_startup_message("No prismpunk colorschemes found, using fallback", vim.log.levels.WARN) end
        )
      else
        vim.schedule(
          function()
            prismpunk_startup_message("Found " .. #all_themes .. " prismpunk colorschemes", vim.log.levels.INFO)
          end
        )
      end

      require("raphael").setup({
        leader = "<leader>t",
        mappings = {
          next = ">",
          previous = "<",
          random = "r",
        },
        default_theme = "lantern-corps-phantom-corrupted",
        theme_map = theme_groups,
        filetype_themes = {
          lua = "lantern-corps-phantom-corrupted",
        },
      })

      vim.api.nvim_create_user_command("RaphaelRescanPrismpunk", function()
        local new_groups, new_themes = scan_prismpunk_colorschemes()
        if #new_themes > 0 then
          require("raphael").setup({
            leader = "<leader>t",
            mappings = {
              next = ">",
              previous = "<",
              random = "r",
            },
            default_theme = "lantern-corps-phantom-corrupted",
            theme_map = new_groups,
            filetype_themes = {},
          })
          vim.notify("Rescanned: Found " .. #new_themes .. " colorschemes", vim.log.levels.INFO)
        else
          vim.notify("No colorschemes found during rescan", vim.log.levels.WARN)
        end
      end, {
        desc = "Rescan prismpunk colorschemes and update Raphael",
      })
    end,
  },
}
