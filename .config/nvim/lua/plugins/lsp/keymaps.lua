local M = {}

function M.on_attach(client, buffer)
  local self = M.new(client, buffer)

  self:map(
    "<leader>ca",
    vim.lsp.buf.code_action,
    { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" }
  )
  self:map("K", vim.lsp.buf.hover, { desc = "Hover" })
  self:map("<leader>cr", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end, { desc = "Rename", has = "rename", expr = true })

  self:map(
    "gK",
    vim.lsp.buf.signature_help,
    { desc = "Signature Help", has = "signatureHelp" }
  )
  self:map(
    "<c-k>",
    vim.lsp.buf.signature_help,
    { mode = "i", desc = "Signature Help", has = "signatureHelp" }
  )
end

function M.new(client, buffer)
  return setmetatable({ client = client, buffer = buffer }, { __index = M })
end

function M:has(cap)
  return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
  opts = opts or {}
  if opts.has and not self:has(opts.has) then
    return
  end
  vim.keymap.set(
    opts.mode or "n",
    lhs,
    type(rhs) == "string" and ("<cmd>%s<cr>"):format(rhs) or rhs,
    ---@diagnostic disable-next-line: no-unknown
    { silent = true, buffer = self.buffer, expr = opts.expr, desc = opts.desc }
  )
end

return M
