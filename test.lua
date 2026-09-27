local stencil = require "src.init"


--  Support definition a placeholder by hand.
--  PASSED:
--
--  Support non-definition a placeholder. Default placeholder is "{{(.-)}}"
--  PASSED:
--
--  A 'replaces' argument is table. For replacing some words. But optional use when non-replacing case.
--  PASSED:
--
--  Formatting a string with new line.
--  PASSED:
--
--  On Runtime
--    - If 'placeholder' get another type that not string. Get a string only.
--    PASSED:
--


-- local formatter = stencil()
local formatter = stencil("<<(.-)>>")

formatter
  .writeln("The <<language>> is simple language and easy to learn.", { language = "Lua" })
  .log()
