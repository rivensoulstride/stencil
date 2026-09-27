--- A stencil() use to formatting a string easier then manual concat and replace words.
--- And easy to read when maintain a code.
---
--- [API]:
---   - write(content: string, replaces: table<string, string|number>?)
---   - writeln(content: string, replaces: table<string, string|number>?)
---   - get_content()
---   - log()
---
---@param placeholder string?
local function M(placeholder)
  assert(type(placeholder) == "string", "A 'placeholder' parameter must be a string.")

  placeholder = placeholder or "{{(.-)}}"

  ---@type table<number, string>
  local buffers = {}
  local api = {}


  --- Formatting a string in one line.
  ---@param content string
  ---@param replaces table<string, string|number>?
  function api.write(content, replaces)
    assert(type(content) == "string", "A 'content' parameter must be a string.")
    assert(replaces == nil or type(replaces) == "table", "A 'replaces' argument is optional. if send in function, must be a table.")

    if replaces == nil then
      buffers[#buffers + 1] = content
    else
      buffers[#buffers + 1] = content:gsub(placeholder, replaces)
    end
    return api
  end

  --- Formatting a string with new line.
  ---@param content string
  ---@param replaces table<string, string|number>?
  function api.writeln(content, replaces)
    assert(type(content) == "string", "A 'content' parameter must be a string.")
    assert(replaces == nil or type(replaces) == "table", "A 'replaces' argument is optional. if send in function, must be a table.")

    if replaces == nil then
      buffers[#buffers + 1] = content .. "\n"
    else
      buffers[#buffers + 1] = content:gsub(placeholder, replaces) .. "\n"
    end
    return api
  end

  --- Getting a string formatted.
  function api.get_content()
    local content = table.concat(buffers)
    buffers = {}

    return content
  end

  --- Logging a string formatted on Console.
  function api.log()
    local content = table.concat(buffers)
    buffers = {}

    print(content)
  end

  return api
end
return M

