function CheckLsp(bufnr)
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

function DisableLSP()
  vim.diagnostic.disable()
end

-- function CheckFormatter(bufnr)
  -- local buffer = bufnr or vim.api.nvim_get_current_buf()
  -- local formatters = require("conform").list_formatters({bufnr = buffer})
  --
  -- if #formatters == 0 then
  --   print("No formatter attached to this buffer")
  --   return nil
  -- end
  --
  -- print("Available formatters:", vim.inspect(formatters))
  -- return formatters

  -- second way and still no result
  -- local M = require("conform")
  -- if not bufnr or bufnr == 0 then
  --   bufnr = vim.api.nvim_get_current_buf()
  -- end
  -- local formatters = M.list_formatters_for_buffer(bufnr)
  -- return M.resolve_formatters(formatters, bufnr, false, false)
-- end

function Colort(color)
  local success = pcall(function()
    vim.cmd.colorscheme(color)
  end)

  if success then
    print("Successfully set colorscheme to " .. color)
  else
    print(color .. " is not available or loaded")
    vim.cmd.colorscheme("default")
  end

  -- for transparency within terminal
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
end

-- manually format buffer with available LSP
function FormatLSP()
  vim.lsp.buf.format({
    async = false,
    timeout_ms = 10000,
  })
end

function FormatHOR()
  require("conform").format()
end
