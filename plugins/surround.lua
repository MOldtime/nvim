-- Old text                    Command         New text-
-- ---------------------------------------------------------------------------s
-- urr*ound_words             ysiw)           (surround_words)*
-- make strings               ys$"            "make strings"[
-- delete ar*ound me!]        ds]             delete around me!r
-- emove <b>HTML t*ags</b>    dst             remove HTML tags'
-- change quot*es'            cs'"            "change quotes"<
-- b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>d
-- elete(functi*on calls)     dsf             function calls
-- 可以修改括住的文本，如：加字符'', 修改括号
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  opts = {},
}
