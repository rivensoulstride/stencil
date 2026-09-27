# Stencil (Simple string formatter with Lua)
A Stencil module is a simple library use to format a string in Lua.
Inside this library use a `string.gsub()` and `..` builtin in Lua. For
simple and reduce manual concatnation and replacing words

## APIs 
This designed with Chaining method + Closure.
- stencil(placeholder: string?) -> table
    - write(content: string, replaces: table<string, string|number>?) -> table
    - writeln(content: string, replaces: table<string, string|number>?) -> table
    - get_content() -> string
    - log() -> nil

## How to use
Copying a `src/main.lua` into your project.

``` lua
local stencil = require("stencil")
local formatter = stencil() -- Default placeholder is "{{(.-)}}"

formatter
    .write("{{name}} is a simple formatter.", { name = "Stencil" })
    .log()

    -- OUTPUT: Stencil is a simple formatter.
```

