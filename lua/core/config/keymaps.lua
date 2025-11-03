local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("i", "jk", "<Esc>")

-- Buffers
map("n", "<TAB>", ":BufferLineCycleNext<cr>")
map("n", "<S-TAB>", ":BufferLineCyclePrev<cr>")

-- Window movement
map("n", "<C-h>", "<C-w>h", { silent = true })
map("n", "<C-j>", "<C-w>j", { silent = true })
map("n", "<C-k>", "<C-w>k", { silent = true })
map("n", "<C-l>", "<C-w>l", { silent = true })

-- Resize window using <ctrl> arrow keys
map("n", "<A-Up>", "<cmd>resize +2<cr>")
map("n", "<A-Down>", "<cmd>resize -2<cr>")
map("n", "<A-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<A-Right>", "<cmd>vertical resize +2<cr>")

map("i", "<C-BS>", "<Esc>cvb")
map("n", "H", "^")
map("n", "L", "$")

-- quit
map("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit" })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keeps the cursor on the same line while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Better indendting
map("n", "<", "<<", { noremap = true, silent = true })
map("n", ">", ">>", { noremap = true, silent = true })
map("v", "<", "<gv", { noremap = true, silent = true })
map("v", ">", ">gv", { noremap = true, silent = true })

-- Save file
map({ "v", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Moving lines up/down
map("v", "<A-j>", ":m '>+1<CR>gv=gv")
map("v", "<A-k>", ":m '<-2<CR>gv=gv")
map("n", "<A-j>", ":m .+1<cr>==")
map("n", "<A-k>", ":m .-2<cr>==")

-- Moving lines up/down for mac (option+j/k)
map("v", "∆", ':m ">+1<cr>gv=gv')
map("v", "˚", ':m "<-2<cr>gv=gv')
map("n", "∆", ":m .+1<cr>==")
map("n", "˚", ":m .-2<cr>==")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Misc
map("n", "Q", "@q")

local function smart_dd()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return '"_dd'
  else
    return "dd"
  end
end

vim.keymap.set("n", "dd", smart_dd, { noremap = true, expr = true })

local function lsp_keymaps(client, bufnr)
  local lsp = vim.lsp.buf
  local methods = vim.lsp.protocol.Methods

  --- @param mode string|string[]
  --- @param lhs string
  --- @param rhs string|function
  --- @param desc string
  local function map(mode, lhs, rhs, desc)
    mode = mode or "n"
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map(
    "n",
    "<leader>cd",
    function() vim.diagnostic.open_float({ border = "solid" }) end,
    "[v]iew [d]iagnostic float"
  )

  map( "n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end, "Next Diagnostic")

  map( "n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end, "Prev Diagnostic")

  if client:supports_method(methods.textDocument_formatting) then
    map( "n", "<leader>cf", function() vim.lsp.buf.format { async = true } end, "Format Document")
  end

  if client:supports_method(methods.textDocument_rangeFormatting) then
    map( "v", "<leader>cf", function() vim.lsp.buf.format() end, "Format Selection")
  end

  if client:supports_method(methods.textDocument_codeAction) then
    map( "n", "<leader>ca", function() vim.lsp.buf.code_action() end, "Code Action")
    map( "n", "<leader>ca", function()
      vim.lsp.buf.code_action {
        context = {
          only = {
            "source",
          },
          diagnostics = {},
        },
      }
    end, "Code Action")
  end

  if client:supports_method(methods.textDocument_rename) then
    map(
      "n",
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
      "Rename"
    )
  end


  if client:supports_method(methods.textDocument_inlayHint) then
    map(
      "n",
      "<leader>th",
      function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end,
      "[t]oggle inlay [h]ints"
    )
  end

  if client:supports_method(methods.textDocument_declaration) then
    map("n", "<leader>de", lsp.declaration, "go to [de]claration")
  end

  if client:supports_method(methods.textDocument_hover) then
    map("n", "K", function() lsp.hover({ border = "rounded" }) end, "LSP hover")
  end

  if client:supports_method(methods.textDocument_signatureHelp) then
    map("i", "<C-k>", lsp.signature_help, "LSP signature help")
  end
end


vim.api.nvim_create_autocmd("LspAttach", {
  desc = "Configure LSP keymaps",
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    lsp_keymaps(client, args.buf)
  end,
})
