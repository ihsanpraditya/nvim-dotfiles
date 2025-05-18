function CheckLspServer(bufnr)
  -- Use current buffer if none provided
  local buffer = bufnr or vim.api.nvim_get_current_buf()

  -- Get LSP clients attached to the buffer
  local clients = vim.lsp.get_active_clients({ bufnr = buffer })

  if #clients == 0 then
    print("No LSP clients attached to this buffer")
    return nil
  end

  -- Print info about all attached clients
  for i, client in ipairs(clients) do
    print(string.format("[%d] %s (id: %d)", i, client.name, client.id))
  end

  -- Return capabilities of the first client (or you could choose a specific one)
  return clients[1].server_capabilities
end

function Colort(color)
  color = color or "default" -- this make 2nd parameter as default if color is empty
  vim.cmd.colorscheme(color)
  -- for transparency within terminal
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

