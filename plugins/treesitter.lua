local utils = require('user.tools.utils')
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- 这里可以理解为要安装的语言
    opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
      "c",
      "cpp",
      "rust",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "python",
      "html",
      "java",
      "javascript",
      "jsdoc",
      "kotlin",
      "typescript",
      "css",
      "yaml",
      "toml",
      "xml",
      "json",
      "json5",
      "markdown",
      "markdown_inline",
      "bash",
      "regex",
    })
    -- local value = opts.textobjects.select.keymaps
    opts.textobjects.select.keymaps["ad"] = opts.textobjects.select.keymaps["a?"]
    opts.textobjects.select.keymaps["id"] = opts.textobjects.select.keymaps["i?"]

    opts.textobjects.select.keymaps["a?"] = nil
    opts.textobjects.select.keymaps["i?"] = nil
    -- 翻译
    utils.Assignment(opts.textobjects.move.goto_next_start,"]k","下一个区块开始")
    utils.Assignment(opts.textobjects.move.goto_next_start,"]f", "下一个函数开始")
    utils.Assignment(opts.textobjects.move.goto_next_start,"]a", "下一个参数开始")
    utils.Assignment(opts.textobjects.move.goto_next_end,"]K", "下一个块结束")
    utils.Assignment(opts.textobjects.move.goto_next_end,"]F", "下一个函数结束")
    utils.Assignment(opts.textobjects.move.goto_next_end,"]A", "下一个参数结束")
    utils.Assignment(opts.textobjects.move.goto_previous_start,"[k", "上一个块开始")
    utils.Assignment(opts.textobjects.move.goto_previous_start,"[f", "上一个函数开始")
    utils.Assignment(opts.textobjects.move.goto_previous_start,"[a", "上一个参数开始")
    utils.Assignment(opts.textobjects.move.goto_previous_end,"[K", "上一个块结束")
    utils.Assignment(opts.textobjects.move.goto_previous_end,"[F", "上一个函数结束")
    utils.Assignment(opts.textobjects.move.goto_previous_end,"[A", "上一个参数结束")
    -- -----------
    utils.Assignment(opts.textobjects.swap.swap_next,">K", "交换下一个块")
    utils.Assignment(opts.textobjects.swap.swap_next,">F", "交换下一个函数")
    utils.Assignment(opts.textobjects.swap.swap_next,">A", "交换下一个参数")
    utils.Assignment(opts.textobjects.swap.swap_previous,"<K", "交换上一个块")
    utils.Assignment(opts.textobjects.swap.swap_previous,"<F", "交换上一个函数")
    utils.Assignment(opts.textobjects.swap.swap_previous,"<A", "交换前一个参数")
    -- -----------
    utils.Assignment(opts.textobjects.select.keymaps,"ak", "块")
    utils.Assignment(opts.textobjects.select.keymaps,"ik", "块")
    utils.Assignment(opts.textobjects.select.keymaps,"ac", "类")
    utils.Assignment(opts.textobjects.select.keymaps,"ic", "类")
    utils.Assignment(opts.textobjects.select.keymaps,"ad", "条件")
    utils.Assignment(opts.textobjects.select.keymaps,"id", "条件")
    utils.Assignment(opts.textobjects.select.keymaps,"af", "函数")
    utils.Assignment(opts.textobjects.select.keymaps,"if", "函数")
    utils.Assignment(opts.textobjects.select.keymaps,"al", "循环")
    utils.Assignment(opts.textobjects.select.keymaps,"il", "循环")
    utils.Assignment(opts.textobjects.select.keymaps,"aa", "参数")
    utils.Assignment(opts.textobjects.select.keymaps,"ia", "参数")

    -- 使用回车或返回选择范围
    local incremental_selection_keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "<CR>",
      -- scope_incremental = "grc",
      node_decremental = "<BS>",
    }
    opts.incremental_selection.keymaps = incremental_selection_keymaps
  end,
}
