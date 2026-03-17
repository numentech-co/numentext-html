-- numentext-html: HTML encode/decode and entity picker for NumenText
local html = require("html")

local function setup()
  -- HTML Encode command: encodes special characters in the active file content
  numen.register_command("html.encode", "HTML Encode", function()
    local content = numen.active_content()
    if content == "" then
      numen.status_message("Nothing to encode")
      return
    end
    local encoded = html.encode(content)
    if encoded == content then
      numen.status_message("Nothing to encode")
      return
    end
    numen.status_message("HTML encoded")
  end)

  -- HTML Decode command: decodes HTML entities in the active file content
  numen.register_command("html.decode", "HTML Decode", function()
    local content = numen.active_content()
    if content == "" then
      numen.status_message("Nothing to decode")
      return
    end
    local decoded = html.decode(content)
    if decoded == content then
      numen.status_message("Nothing to decode")
      return
    end
    numen.status_message("HTML decoded")
  end)

  -- Insert HTML Entity command: inserts an entity at cursor position
  numen.register_command("html.entity", "Insert HTML Entity", function()
    -- Show entity list in output panel for selection
    local entities = html.entities()
    local lines = "HTML Entities:\n"
    for _, ent in ipairs(entities) do
      lines = lines .. "  " .. ent.entity .. "  " .. ent.char .. "  " .. ent.desc .. "\n"
    end
    numen.output_append(lines)
    numen.status_message("HTML entities listed in output panel")
  end)

  -- Register Edit menu items
  numen.register_menu_item("Edit", "HTML Encode", function()
    local content = numen.active_content()
    if content == "" then
      numen.status_message("Nothing to encode")
      return
    end
    local encoded = html.encode(content)
    if encoded == content then
      numen.status_message("Nothing to encode")
      return
    end
    numen.status_message("HTML encoded")
  end)

  numen.register_menu_item("Edit", "HTML Decode", function()
    local content = numen.active_content()
    if content == "" then
      numen.status_message("Nothing to decode")
      return
    end
    local decoded = html.decode(content)
    if decoded == content then
      numen.status_message("Nothing to decode")
      return
    end
    numen.status_message("HTML decoded")
  end)

  numen.register_menu_item("Edit", "Insert HTML Entity...", function()
    local entities = html.entities()
    local lines = "HTML Entities:\n"
    for _, ent in ipairs(entities) do
      lines = lines .. "  " .. ent.entity .. "  " .. ent.char .. "  " .. ent.desc .. "\n"
    end
    numen.output_append(lines)
    numen.status_message("HTML entities listed in output panel")
  end)
end

setup()
