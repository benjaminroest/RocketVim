local M = {}

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end

M._keys = nil

function M.get()
  local format = function()
    require("lazyvim.plugins.lsp.format").format { force = true }
  end
  return {
    { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
    { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
    { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
    { "K", vim.lsp.buf.hover, desc = "Hover" },
    {
      "gK",
      vim.lsp.buf.signature_help,
      desc = "Signature Help",
      has = "signatureHelp",
    },
    {
      "<c-k>",
      vim.lsp.buf.signature_help,
      mode = "i",
      desc = "Signature Help",
      has = "signatureHelp",
    },
    { "]d", M.diagnostic_goto(true), desc = "Next Diagnostic" },
    { "[d", M.diagnostic_goto(false), desc = "Prev Diagnostic" },
    { "]e", M.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
    { "[e", M.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
    { "]w", M.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
    { "[w", M.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
    {
      "<leader>cf",
      function()
        vim.lsp.buf.format { async = true }
      end,
      desc = "Format Document",
      has = "documentFormatting",
    },
    {
      "<leader>cf",
      function()
        vim.lsp.buf.format()
      end,
      desc = "Format Range",
      mode = "v",
      has = "documentRangeFormatting",
    },
    {
      "<leader>ca",
      vim.lsp.buf.code_action,
      desc = "Code Action",
      mode = { "n", "v" },
      has = "codeAction",
    },
    {
      "<leader>cr",
      function()
        vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
          callback = function()
            local key = vim.api.nvim_replace_termcodes("<C-f>", true, false, true)
            vim.api.nvim_feedkeys(key, "c", false)
            vim.api.nvim_feedkeys("0", "n", false)
            return true
          end,
        })
        vim.lsp.buf.rename()
      end,
      desc = "Rename",
      has = "rename",
    },
    {
      "<leader>cA",
      function()
        vim.lsp.buf.code_action {
          context = {
            only = {
              "source",
            },
            diagnostics = {},
          },
        }
      end,
      desc = "Source Action",
      has = "codeAction",
    },
  }
end

function M.on_attach(client, buffer)
  local Keys = require "lazy.core.handler.keys"
  -- local keymaps = {} ---@type table<string,LazyKeys|{has?:string}>
  --
  -- for _, value in ipairs(M.get()) do
  --   local keys = Keys.parse(value)
  --   if keys[2] == vim.NIL or keys[2] == false then
  --     keymaps[keys.id] = nil
  --   else
  --     keymaps[keys.id] = keys
  --   end
  -- end

  for _, keys in pairs(M.get()) do
    if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
      local opts = Keys.opts(keys)
      ---@diagnostic disable-next-line: no-unknown
      opts.has = nil
      opts.silent = opts.silent ~= false
      opts.buffer = buffer
      vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
    end
  end
end

return M
