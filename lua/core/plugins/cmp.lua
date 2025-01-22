-- return {
--   "hrsh7th/nvim-cmp",
--   event = "InsertEnter",
--   dependencies = {
--     "hrsh7th/cmp-nvim-lsp",
--     "hrsh7th/cmp-buffer",                  -- buffer completions
--     "hrsh7th/cmp-path",                    -- path completions
--     "hrsh7th/cmp-nvim-lsp-signature-help", -- function arguments completions
--     "saadparwaiz1/cmp_luasnip",            -- snippet completions
--     "L3MON4D3/LuaSnip",                    --snippet engine
--     "rafamadriz/friendly-snippets",        -- a bunch of snippets to use
--   },
--   opts = function()
--     local cmp = require "cmp"
--
--     local icons = {
--       Text = "",
--       Method = "",
--       Function = "",
--       Constructor = "⌘",
--       Field = "ﰠ",
--       Variable = "",
--       Class = "ﴯ",
--       Interface = "",
--       Module = "",
--       Property = "ﰠ",
--       Unit = "塞",
--       Value = "",
--       Enum = "",
--       Keyword = "廓",
--       Snippet = "",
--       Color = "",
--       File = "",
--       Reference = "",
--       Folder = "",
--       EnumMember = "",
--       Constant = "",
--       Struct = "פּ",
--       Event = "",
--       Operator = "",
--       TypeParameter = "",
--     }
--
--     local has_words_before = function()
--       unpack = unpack or table.unpack
--       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--     end
--
--     local luasnip = require("luasnip")
--
--     local function completion_menu_next()
--       return cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_next_item()
--           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--           -- they way you will only jump inside the snippet region
--         elseif luasnip.expand_or_jumpable() then
--           luasnip.expand_or_jump()
--         elseif has_words_before() then
--           cmp.complete()
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       })
--     end
--
--     local function completion_menu_prev()
--       return cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.select_prev_item()
--         elseif luasnip.jumpable(-1) then
--           luasnip.jump(-1)
--         else
--           fallback()
--         end
--       end, {
--         "i",
--         "s",
--       })
--     end
--
--     local function border(hl_name)
--       return {
--         { "╭", hl_name },
--         { "─", hl_name },
--         { "╮", hl_name },
--         { "│", hl_name },
--         { "╯", hl_name },
--         { "─", hl_name },
--         { "╰", hl_name },
--         { "│", hl_name },
--       }
--     end
--
--     local options = {
--       snippet = {
--         expand = function(args)
--           require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
--         end,
--       },
--       mapping = {
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
--         ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
--         ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
--         ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--         ["<C-e>"] = cmp.mapping {
--           i = cmp.mapping.abort(),
--           c = cmp.mapping.close(),
--         },
--         ["<CR>"] = cmp.mapping.confirm { select = false },
--         ["<Tab>"] = completion_menu_next(),
--         ["<S-Tab>"] = completion_menu_prev(),
--         ["<Down>"] = completion_menu_next(),
--         ["<Up>"] = completion_menu_prev(),
--       },
--       completion = {
--         completeopt = "menu,menuone,noinsert,noselect,preview",
--         keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
--         keyword_length = 1,
--       },
--       formatting = {
--         format = function(entry, vim_item)
--           vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
--           return vim_item
--         end,
--       },
--       sources = {
--         { name = "nvim_lsp" },
--         { name = "luasnip" },
--         { name = "buffer" },
--         { name = "path" },
--         {
--           name = "html-css",
--           option = {
--             max_count = {}, -- not ready yet
--             enable_on = {
--               "html",
--               "vue"
--             },                                   -- set the file types you want the plugin to work on
--             file_extensions = { "css", "sass", "less" }, -- set the local filetypes from which you want to derive classes
--             style_sheets = {
--               -- example of remote styles, only css no js for now
--               "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
--             }
--           },
--         },
--       },
--       confirm_opts = {
--         behavior = cmp.ConfirmBehavior.Replace,
--         select = false,
--       },
--       -- window = {
--       -- 	completion = {
--       -- 		border = border("CmpBorder"),
--       -- 	},
--       -- 	documentation = {
--       -- 		border = border("CmpDocBorder"),
--       -- 	},
--       -- },
--       experimental = {
--         ghost_text = true,
--         native_menu = false,
--       },
--     }
--     return options
--   end,
--   config = function(_, opts)
--     local cmp = require "cmp"
--     require("luasnip/loaders/from_vscode").lazy_load()
--     cmp.setup(opts)
--
--     local cmp_autopairs = require "nvim-autopairs.completion.cmp"
--     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--   end,
-- }
--

local defaultSources = {
  {
    name = "nvim_lsp",
    entry_filter = function(entry, _)
      return require("cmp.types").lsp.CompletionItemKind[entry:get_kind()] ~= "Text"
    end,
  },
  { name = "luasnip" },
  {
    name = "buffer",
    option = {
      -- show completions from all buffers used within the last x minutes
      get_bufnrs = function()
        local usedWithinMins = 10 -- CONFIG
        local allBufs = vim.fn.getbufinfo { buflisted = 1 }
        local recentBufs = vim.tbl_filter(
          function(buf) return os.time() - buf.lastused < usedWithinMins * 60 end,
          allBufs
        )
        local bufnrs = vim.tbl_map(function(buf) return buf.bufnr end, recentBufs)
        return bufnrs
      end,
      max_indexed_line_length = 100, -- no long lines (e.g. base64-encoded things)
    },
    keyword_length = 3,
    max_item_count = 4, -- since searching all buffers results in many results
  },
  { name = "path" },
  { name = "emoji" },
}

local sourceIcons = {
  buffer = "󰽙",
  cmdline = "󰘳",
  emoji = "󰞅",
  luasnip = "",
  nvim_lsp = "󰒕",
  path = "",
}

--------------------------------------------------------------------------------

local function cmpconfig()
  local cmp = require("cmp")
  -- local compare = require("cmp.config.compare")

  cmp.setup {
    snippet = {
      expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },
    window = {
      completion = { border = vim.g.borderStyle, scrolloff = 2 },
      documentation = { border = vim.g.borderStyle, scrolloff = 2 },
    },
    -- sorting = {
    --   comparators = {
    --     -- Original order: https://github.com/hrsh7th/nvim-cmp/blob/538e37ba87284942c1d76ed38dd497e54e65b891/lua/cmp/config/default.lua#L65-L74
    --     -- Definitions of compare function https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
    --     compare.offset,
    --     compare.recently_used, -- higher
    --     compare.score,
    --     compare.exact,     -- lower
    --     compare.kind,      -- higher (prioritize snippets)
    --     compare.locality,
    --     compare.length,
    --     compare.order,
    --   },
    -- },
    mapping = cmp.mapping.preset.insert {
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<PageUp>"] = cmp.mapping.scroll_docs(-4),
      ["<PageDown>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<C-Space>"] = cmp.mapping.complete(),

      -- Next item, or trigger completion, or insert normal tab
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "s" }),
      -- cmd+j: Jump to next location
      ["<C-l>"] = cmp.mapping(function(_)
        -- DOCS https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#api-2
        if require("luasnip").locally_jumpable(1) then
          require("luasnip").jump(1)
        end
      end, { "i", "s" }),
      -- cmd+shift+j: prev location
      ["<C-h>"] = cmp.mapping(function(_)
        if require("luasnip").locally_jumpable(-1) then
          require("luasnip").jump(-1)
        end
      end, { "i", "s" }),
    },
    formatting = {
      fields = { "abbr", "menu", "kind" }, -- order of the fields
      format = function(entry, item)
        -- abbreviate length https://github.com/hrsh7th/nvim-cmp/discussions/609
        -- (height is controlled via pumheight option)
        local maxLength = 50
        if #item.abbr > maxLength then item.abbr = item.abbr:sub(1, maxLength) .. "…" end

        -- distinguish emmet snippets
        local ft = vim.bo[entry.context.bufnr].filetype
        local isEmmet = entry.source.name == "nvim_lsp"
            and item.kind == "Snippet"
            and ft == "css"

        -- set icons
        -- stylua: ignore
        local kindIcons = { Text = "", Method = "󰆧", Function = "󰊕", Constructor = "", Field = "󰇽", Variable = "", Class =
        "󰠱", Interface = "", Module = "", Property = "󰜢", Unit = "", Value = "󰎠", Enum = "", Keyword = "󰌋", Snippet =
        "󰅱", Color = "󰏘", File = "󰈙", Reference = "", Folder = "󰉋", EnumMember = "", Constant = "󰏿", Struct = "", Event =
        "", Operator = "󰆕", TypeParameter = "󰅲" }
        item.kind = entry.source.name == "nvim_lsp" and kindIcons[item.kind] or ""
        item.menu = sourceIcons[entry.source.name]
        if isEmmet then
          item.menu = ""
          item.kind = ""
        end

        return item
      end,
    },
    sources = cmp.config.sources(defaultSources),
  }

  -----------------------------------------------------------------------------

  -- LUA: disable annoying `--#region` suggestions
  cmp.setup.filetype("lua", {
    enabled = function()
      local line = vim.api.nvim_get_current_line()
      return not (line:find("%s%-%-?$") or line:find("^%-%-?$"))
    end,
  })

  -- SHELL: disable `\[` suggestions at EoL
  cmp.setup.filetype("sh", {
    enabled = function()
      local col = vim.fn.col(".") - 1
      local charBefore = vim.api.nvim_get_current_line():sub(col, col)
      return charBefore ~= "\\"
    end,
  })

  -- COMMANDLINE
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources {
      { name = "path" },
      { name = "cmdline" },
    },
  })

  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer", max_item_count = 3, keyword_length = 2 },
    },
  })

  local cmp_autopairs = require "nvim-autopairs.completion.cmp"
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

--------------------------------------------------------------------------------

return {
  { -- Completion Engine + Sources
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = cmpconfig,
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",  -- LSP input
      "L3MON4D3/LuaSnip",      -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- adapter for snippet engine
      { "Allaman/emoji.nvim", opts = { enable_cmp_integration = true } },
    },
  },
  { -- Snippet Engine
    "L3MON4D3/LuaSnip",
    keys = {
      { "<BS>", mode = "x" },
    },
    init = function()
      -- copy system clipboard to regular register, required for VSCode
      -- snippets with `$CLIPBOARD`
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function() vim.fn.setreg('"', vim.fn.getreg("+")) end,
      })
    end,
    opts = {
      -- live updating of snippets
      update_events = { "TextChanged", "TextChangedI" },
      -- disable auto-reload, since already done by my own plugin
      fs_event_providers = { autocmd = false, libuv = false },
      -- store visual selection, inserted on next snippet with
      -- `$TM_SELECTED_TEXT` (VSCode Syntax) or `LS_SELECT_RAW` (Luasnip Syntax)
      store_selection_keys = "<BS>",
    },
    config = function(_, opts)
      require("luasnip").setup(opts)
      -- DOCS https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#vs-code
      require("luasnip.loaders.from_vscode").lazy_load { paths = "./snippets" }
    end,
  },
}
