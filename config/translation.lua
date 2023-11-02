local M = {}
local utils = require "user.tools.utils"

function M.Lsp(tables)
  utils.Assignment(tables.n, "<leader>la", "代码操作")
  utils.Assignment(tables.n, "<leader>ld", "悬停诊断")
  utils.Assignment(tables.n, "<leader>lD", "搜索诊断")
  utils.Assignment(tables.n, "<leader>lf", "格式缓冲区")
  utils.Assignment(tables.v, "<leader>lf", "格式缓冲区")
  utils.Assignment(tables.n, "<leader>lG", "搜索工作空间关键字(变量..)")
  utils.Assignment(tables.n, "<leader>lh", "签名帮助")
  utils.Assignment(tables.n, "<leader>li", "LSP 信息")
  utils.Assignment(tables.n, "<leader>lI", "Null-ls 信息")
  utils.Assignment(tables.n, "<leader>ll", "LSP CodeLens 刷新")
  utils.Assignment(tables.n, "<leader>lL", "LSP CodeLens 运行")
  utils.Assignment(tables.n, "<leader>lR", "搜索参考")
  utils.Assignment(tables.n, "<leader>lr", "重命名变量")
  utils.Assignment(tables.n, "<leader>ls", "搜索关键字(变量..)")
  utils.Assignment(tables.n, "<leader>lS", "侧栏显示文件关键字(变量..)")
end

-- default
function M.mian_(tables)
  tables.o['a"'] = [[双引号括起来的字符串]]
  tables.o["a'"] = [[单引号括起来的字符串]]
  tables.o["a("] = [[与ab相同]]
  tables.o["a)"] = [[与ab相同]]
  tables.o["a<lt>"] = [[从'<'到匹配的'>'的<>]]
  tables.o["a>"] = [[与a<相同]]
  tables.o["aB"] = [[从'{'到'}'的块（带有大括号）]]
  tables.o["aW"] = [[带有空格的单词（包括空格）]]
  tables.o["a["] = [[从'['到匹配的']'的]]
  tables.o["a]"] = [[与a[]相同]]
  tables.o["a`"] = [[反引号括起来的字符串]]
  tables.o["ab"] = [[从'('到')'的块（带有括号）]]
  tables.o["ap"] = [[带有空格的段落（包括空格）]]
  tables.o["as"] = [[带有空格的句子（包括空格）]]
  tables.o["at"] = [[带有空格的标签块（包括空格）]]
  tables.o["aw"] = [[带有空格的单词（包括空格）]]
  tables.o["a{"] = [[与aB相同]]
  tables.o["a}"] = [[与aB相同]]
  tables.o['i"'] = [[没有引号的双引号括起来的字符串]]
  tables.o["i'"] = [[没有引号的单引号括起来的字符串]]
  tables.o["i("] = [[与ib相同]]
  tables.o["i)"] = [[与ib相同]]
  tables.o["i<lt>"] = [[从'<'到匹配的'>'的内部<>]]
  tables.o["i>"] = [[与i<相同]]
  tables.o["iB"] = [[从'{'到'}'的内部块]]
  tables.o["iW"] = [[内部单词]]
  tables.o["i["] = [[从'['到匹配的']'的内部]]
  tables.o["i]"] = [[与i[]相同]]
  tables.o["i`"] = [[没有反引号的反引号括起来的字符串]]
  tables.o["ib"] = [[从'('到')'的内部块]]
  tables.o["ip"] = [[内部段落]]
  tables.o["is"] = [[内部句子]]
  tables.o["it"] = [[内部标签块]]
  tables.o["iw"] = [[内部单词]]
  tables.o["i{"] = [[与iB相同]]
  tables.o["i}"] = [[与iB相同]]

  -- default - t
  utils.Assignment(tables.t, "<C-h>", "终端左窗口导航")
  utils.Assignment(tables.t, "<C-'>", "切换终端")
  utils.Assignment(tables.t, "<C-l>", "终端右窗口导航")
  utils.Assignment(tables.t, "<C-j>", "终端向下窗口导航")
  utils.Assignment(tables.t, "<C-k>", "终端向上窗口导航")
  utils.Assignment(tables.t, "<F7>", "切换终端")
  -- -----------
  -- default -v
  utils.Assignment(tables.v, "<leader>dE", "评估输入")
  utils.Assignment(tables.v, "<S-Tab>", "向左缩进")
  utils.Assignment(tables.v, "<leader>/", "注释选中")
  utils.Assignment(tables.v, "<Tab>", "向右缩进")
  -- -----------
  -- default - n
  utils.Assignment(tables.n, "<leader>gp", "预览Git hunk")
  utils.Assignment(tables.n, "<F29>", "重新启动")
  utils.Assignment(tables.n, "<leader>gL", "查看完整的Git blame")
  utils.Assignment(tables.n, "<F21>", "条件断点")
  utils.Assignment(tables.n, "<leader>gl", "查看Git blame")
  utils.Assignment(tables.n, "<F17>", "停止")
  utils.Assignment(tables.n, "[g", "上一个Git hunk")
  utils.Assignment(tables.n, "<F5>", "启动")
  utils.Assignment(tables.n, "]g", "下一个 Git hunk")
  utils.Assignment(tables.n, "<C-q>", "强制退出")
  utils.Assignment(tables.n, "<leader>/", "注释行")
  utils.Assignment(tables.n, "<leader>tv", "ToggleTerm 垂直分隔")
  utils.Assignment(tables.n, "<leader>h", "主界面")
  utils.Assignment(tables.n, "[t", "上一个选项卡")
  utils.Assignment(tables.n, "]t", "下一个选项卡")
  utils.Assignment(tables.n, "<leader>b|", "从tabline垂直拆分缓冲区")
  utils.Assignment(tables.n, "<leader>b\\", "从tabline水平拆分缓冲区")
  utils.Assignment(tables.n, "<leader>bd", "关闭标签页中的缓冲区")
  utils.Assignment(tables.n, "<leader>bb", "从标签页中选择缓冲区")
  utils.Assignment(tables.n, "[b", "前一个缓冲区")
  utils.Assignment(tables.n, "<leader>bsi", "按缓冲区编号")
  utils.Assignment(tables.n, "]b", "下一个缓冲区")
  utils.Assignment(tables.n, "<leader>bsp", "按完整路径")
  utils.Assignment(tables.n, "<leader>bsr", "按相对路径")
  utils.Assignment(tables.n, "<leader>bse", "按扩展名")
  utils.Assignment(tables.n, "<leader>bs", "󰒺 排序缓冲区")
  utils.Assignment(tables.n, "<leader>br", "关闭右侧所有缓冲区")
  utils.Assignment(tables.n, "<leader>bp", "前一个缓冲区")
  utils.Assignment(tables.n, "<leader>bl", "关闭左侧所有缓冲区")
  utils.Assignment(tables.n, "<leader>bC", "关闭所有缓冲区")
  utils.Assignment(tables.n, "<leader>bc", "关闭除当前缓冲区外的所有缓冲区")
  utils.Assignment(tables.n, "<b", "将缓冲区标签向左移动")
  utils.Assignment(tables.n, ">b", "将缓冲区标签向右移动")
  utils.Assignment(tables.n, "<leader>C", "强制关闭缓冲区")
  utils.Assignment(tables.n, "<leader>c", "关闭缓冲区")
  utils.Assignment(tables.n, "k", "向上移动光标")
  utils.Assignment(tables.n, "<leader>pl", "AstroNvim 更改日志")
  utils.Assignment(tables.n, "<leader>pv", "AstroNvim 版本")
  utils.Assignment(tables.n, "<leader>pA", "AstroNvim 更新")
  utils.Assignment(tables.n, "<leader>pa", "更新插件和 Mason 包")
  utils.Assignment(tables.n, "<leader>pU", "插件更新")
  utils.Assignment(tables.n, "<leader>pu", "检查插件更新")
  utils.Assignment(tables.n, "<leader>pS", "插件同步")
  utils.Assignment(tables.n, "<leader>ps", "插件状态")
  utils.Assignment(tables.n, "<leader>pi", "安装插件")
  utils.Assignment(tables.n, "gx", "使用系统应用程序打开光标下的文件")
  utils.Assignment(tables.n, "<C-s>", "强制写入")
  utils.Assignment(tables.n, "<leader>n", "新建文件")
  utils.Assignment(tables.n, "<leader>q", "退出")
  utils.Assignment(tables.n, "<leader>w", "保存")
  utils.Assignment(tables.n, "<leader>uh", "切换折叠列")
  utils.Assignment(tables.n, "<leader>uy", "切换语法高亮（缓冲区）")
  utils.Assignment(tables.n, "<leader>uw", "切换换行")
  utils.Assignment(tables.n, "<leader>uu", "切换 URL 高亮")
  utils.Assignment(tables.n, "<leader>ut", "切换标签栏")
  utils.Assignment(tables.n, "<leader>uS", "切换隐藏")
  utils.Assignment(tables.n, "<leader>ud", "切换诊断")
  utils.Assignment(tables.n, "zp", "查看折叠内容")
  utils.Assignment(tables.n, "<leader>us", "切换拼写检查")
  utils.Assignment(tables.n, "<leader>ub", "切换背景")
  utils.Assignment(tables.n, "<leader>uL", "切换 CodeLens")
  utils.Assignment(tables.n, "<leader>up", "切换粘贴模式")
  utils.Assignment(tables.n, "<leader>ui", "更改缩进设置")
  utils.Assignment(tables.n, "zM", "关闭所有折叠")
  utils.Assignment(tables.n, "<leader>uN", "切换通知")
  utils.Assignment(tables.n, "<leader>du", "切换调试器界面")
  utils.Assignment(tables.n, "<leader>uc", "切换自动完成")
  utils.Assignment(tables.n, "<leader>un", "更改行号显示")
  utils.Assignment(tables.n, "<leader>ff", "查找文件")
  utils.Assignment(tables.n, "<leader>ua", "切换自动配对")
  utils.Assignment(tables.n, "<leader>fC", "查找命令")
  utils.Assignment(tables.n, "<leader>fc", "查找光标下的单词")
  utils.Assignment(tables.n, "<leader>ul", "切换状态栏")
  utils.Assignment(tables.n, "\\", "水平分割")
  utils.Assignment(tables.n, "zm", "折叠更多")
  utils.Assignment(tables.n, "<leader>fa", "查找 AstroNvim 配置文件")
  utils.Assignment(tables.n, "zr", "折叠更少")
  utils.Assignment(tables.n, "<leader>f/", "在当前缓冲区中查找单词")
  utils.Assignment(tables.n, "<leader>ug", "切换标记列")
  utils.Assignment(tables.n, "<leader>f'", "查找书签")
  utils.Assignment(tables.n, "zR", "展开所有折叠")
  utils.Assignment(tables.n, "<leader>f<CR>", "恢复上次搜索")
  utils.Assignment(tables.n, "<leader>dh", "调试器悬停")
  utils.Assignment(tables.n, "<leader>gt", "Git 状态")
  utils.Assignment(tables.n, "<leader>uC", "切换颜色高亮")
  utils.Assignment(tables.n, "<leader>gC", "Git 提交（当前文件）")
  utils.Assignment(tables.n, "<leader>dE", "评估输入")
  utils.Assignment(tables.n, "<leader>gc", "Git 提交（仓库）")
  utils.Assignment(tables.n, "<leader>ds", "运行到光标")
  utils.Assignment(tables.n, "<leader>gb", "Git 分支")
  utils.Assignment(tables.n, "<leader>dR", "切换 REPL")
  utils.Assignment(tables.n, "<leader>lS", "符号大纲")
  utils.Assignment(tables.n, "<leader>th", "ToggleTerm 水平分割")
  utils.Assignment(tables.n, "<leader>dr", "重新启动（C-F5）")
  utils.Assignment(tables.n, "<leader>dp", "暂停（F6）")
  utils.Assignment(tables.n, "<leader>tf", "ToggleTerm 悬浮")
  utils.Assignment(tables.n, "<leader>dQ", "终止会话（S-F5）")
  utils.Assignment(tables.n, "<leader>tp", "ToggleTerm python")
  utils.Assignment(tables.n, "<C-Left>", "调整向左分割")
  utils.Assignment(tables.n, "<C-l>", "移动到右侧分割")
  utils.Assignment(tables.n, "<leader>bsm", "按修改时间")
  utils.Assignment(tables.n, "<C-'>", "切换终端")
  utils.Assignment(tables.n, "<leader>tn", "ToggleTerm node")
  utils.Assignment(tables.n, "<leader>tl", "ToggleTerm lazygit")
  utils.Assignment(tables.n, "<C-j>", "移动到下方分割")
  utils.Assignment(tables.n, "<C-k>", "移动到上方分割")
  utils.Assignment(tables.n, "j", "向下移动光标")
  utils.Assignment(tables.n, "<leader>ls", "搜索符号")
  utils.Assignment(tables.n, "<C-Up>", "向上调整分割窗口大小")
  utils.Assignment(tables.n, "<C-h>", "移动到左侧分割窗口")
  utils.Assignment(tables.n, "<leader>gg", "打开 lazygit")
  utils.Assignment(tables.n, "<leader>fw", "查找单词")
  utils.Assignment(tables.n, "<leader>pM", "Mason 更新")
  utils.Assignment(tables.n, "<leader>ft", "查找主题")
  utils.Assignment(tables.n, "|", "垂直分割")
  utils.Assignment(tables.n, "<leader>fr", "查找寄存器")
  utils.Assignment(tables.n, "<leader>fW", "在所有文件中查找单词")
  utils.Assignment(tables.n, "<leader>fo", "查找历史记录")
  utils.Assignment(tables.n, "<C-Right>", "向右调整分割窗口大小")
  utils.Assignment(tables.n, "<leader>fn", "查找通知")
  utils.Assignment(tables.n, "<leader>fF", "查找所有文件")
  utils.Assignment(tables.n, "<leader>fm", "查找 man")
  utils.Assignment(tables.n, "<leader>pm", "Mason 安装程序")
  utils.Assignment(tables.n, "<leader>fk", "查找键位映射")
  utils.Assignment(tables.n, "<leader>S.", "加载当前目录会话")
  utils.Assignment(tables.n, "<leader>fh", "查找帮助")
  utils.Assignment(tables.n, "<leader>fb", "查找缓冲区")
  utils.Assignment(tables.n, "<leader>Sf", "搜索会话")
  utils.Assignment(tables.n, "<leader>Sl", "加载上次会话")
  utils.Assignment(tables.n, "<leader>dq", "关闭会话")
  utils.Assignment(tables.n, "<leader>Sd", "删除会话")
  utils.Assignment(tables.n, "<leader>dO", "跳出 (S-F11)")
  utils.Assignment(tables.n, "<leader>Ss", "保存此会话")
  utils.Assignment(tables.n, "<leader>do", "跨过 (F10)")
  utils.Assignment(tables.n, "<F7>", "切换终端")
  utils.Assignment(tables.n, "<leader>di", "跳入 (F11)")
  utils.Assignment(tables.n, "<leader>o", "切换资源管理器焦点")
  utils.Assignment(tables.n, "<leader>dC", "条件断点 (S-F9)")
  utils.Assignment(tables.n, "<C-Down>", "向下调整分割窗口大小")
  utils.Assignment(tables.n, "<leader>dc", "开始/继续 (F5)")
  utils.Assignment(tables.n, "<leader>e", "切换资源管理器")
  utils.Assignment(tables.n, "<leader>dB", "清除断点")
  utils.Assignment(tables.n, "<leader>gd", "查看 Git 差异")
  utils.Assignment(tables.n, "<leader>db", "切换断点 (F9)")
  utils.Assignment(tables.n, "<leader>gu", "取消暂存 Git hunk")
  utils.Assignment(tables.n, "<F23>", "调试器: 跳出")
  utils.Assignment(tables.n, "<leader>gS", "暂存 Git 缓冲区")
  utils.Assignment(tables.n, "<F11>", "调试器: 跳入")
  utils.Assignment(tables.n, "<leader>gs", "暂存 Git hunk")
  utils.Assignment(tables.n, "<F10>", "调试器: 跨过")
  utils.Assignment(tables.n, "<leader>gr", "重置 Git 缓冲区")
  utils.Assignment(tables.n, "<F9>", "调试器: 切换断点")
  utils.Assignment(tables.n, "<leader>gh", "重置 Git hunk")
  utils.Assignment(tables.n, "<F6>", "调试器: 暂停")
  -- -----------
  return tables
end

return M

-- local function traverseTable(tbl, indent)
--   indent = indent or 0
--
--   for key, value in pairs(tbl) do
--     if type(value) == "table" then
--       if key == "n" then break end
--       print(string.rep(" ", indent) .. key .. ":")
--       traverseTable(value, indent + 4) -- 递归调用遍历子table，增加4个空格的缩进
--     else
--       print(string.rep(" ", indent) .. key .. ": " .. tostring(value))
--     end
--   end
-- end
