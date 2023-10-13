-- 基本用法:
--    选择单词Ctrl-N（如Ctrl-dSublime Text/VS Code 中）
--    Alt + j,k 设置垂直或向上光标
--    一次选择一个字符Shift-Arrows
--    按n/N获取下一个/上一个出现的情况
--    按[/]选择下一个/上一个光标
--    按此键q可跳过当前内容并获取下一个出现的内容
--    按下Q可删除当前光标/选择
--    使用i, a, I,启动插入模式A
--    多光标选择
return {
    "mg979/vim-visual-multi",
    event = "BufEnter",
}
