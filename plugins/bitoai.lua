return {
  "zhenyangze/vim-bitoai",
  lazy = false,
  config = function()
    -- local bito_buffer_name_prefix = vim.g.bito_buffer_name_prefix or "bito_history_"
    -- local vim_bito_path = vim.g.vim_bito_path or "bito"
    -- local vim_bito_prompt_append = vim.g.vim_bito_prompt_append or ""
    vim.g.vim_bito_prompt_append = '请使用中文回答'
    -- vim.g.bito_buffer_name_prefix = 
  end,
}
