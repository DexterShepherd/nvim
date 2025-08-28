return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable("vtsls")
    vim.lsp.enable("eslint")
    vim.lsp.enable("pyright")
    vim.lsp.enable("cssmodules_ls")
    vim.lsp.enable("cssls")
    -- vim.lsp.enable("css_variables")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP: rename" })

        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP: code action" })

        vim.keymap.set("n", "<leader>sa", function()
          vim.lsp.buf.code_action({
            apply = true,
            context = {
              only = { "source" },
              diagnostics = {},
            },
          })
        end, {
          buffer = event.buf,
          desc = "LSP: code action",
        })
      end,
    })
  end,
}
