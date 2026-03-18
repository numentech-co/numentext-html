-- numentext-html: HTML encode/decode and entity picker for NumenText
local html = require("html")

local function do_encode()
  local sel = numen.selected_text()
  if sel ~= "" then
    local encoded = html.encode(sel)
    if encoded ~= sel then
      numen.replace_selection(encoded)
      numen.status_message("HTML encoded selection")
    else
      numen.status_message("Nothing to encode")
    end
  else
    local content = numen.active_content()
    if content == "" then
      numen.status_message("Nothing to encode")
      return
    end
    local encoded = html.encode(content)
    if encoded ~= content then
      numen.set_content(encoded)
      numen.status_message("HTML encoded file")
    else
      numen.status_message("Nothing to encode")
    end
  end
end

local function do_decode()
  local sel = numen.selected_text()
  if sel ~= "" then
    local decoded = html.decode(sel)
    if decoded ~= sel then
      numen.replace_selection(decoded)
      numen.status_message("HTML decoded selection")
    else
      numen.status_message("Nothing to decode")
    end
  else
    local content = numen.active_content()
    if content == "" then
      numen.status_message("Nothing to decode")
      return
    end
    local decoded = html.decode(content)
    if decoded ~= content then
      numen.set_content(decoded)
      numen.status_message("HTML decoded file")
    else
      numen.status_message("Nothing to decode")
    end
  end
end

local function do_entity()
  local entities = html.entities()
  local lines = "HTML Entities (type entity code to insert):\n"
  for _, ent in ipairs(entities) do
    lines = lines .. "  " .. ent.entity .. "  " .. ent.char .. "  " .. ent.desc .. "\n"
  end
  numen.output_append(lines)
  numen.status_message("HTML entities listed in output panel")
end

-- Register commands
numen.register_command("html.encode", "HTML Encode", do_encode)
numen.register_command("html.decode", "HTML Decode", do_decode)
numen.register_command("html.entity", "Insert HTML Entity", do_entity)

-- Register menu items
numen.register_menu_item("Edit", "HTML Encode", do_encode)
numen.register_menu_item("Edit", "HTML Decode", do_decode)
numen.register_menu_item("Edit", "Insert HTML Entity...", do_entity)
