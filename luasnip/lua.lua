--# selene: allow(unused_variable)
---@diagnostic disable: unused-local
local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions.expand")

return {
  -- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
  -- \item as necessary by utilizing a choiceNode.
  s("pcall", {
    t({ 'local ok, _ = pcall(require, "' }),
    i(1),
    t({ '")', "if not ok then", "\t" }),
    i(0),
    t({ "", "end" }),
  }),
  s("esc_pattern", {
    i(1),
    t({ ':gsub("%W", "%%%0")' }),
  }),
}
