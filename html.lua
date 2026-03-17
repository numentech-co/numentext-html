-- html.lua: HTML encode/decode logic and entity list

local M = {}

-- Characters that must be encoded in HTML
local encode_map = {
  ["&"] = "&amp;",
  ["<"] = "&lt;",
  [">"] = "&gt;",
  ['"'] = "&quot;",
  ["'"] = "&apos;",
}

-- HTML entity to character decode map
local decode_map = {
  ["&amp;"]    = "&",
  ["&lt;"]     = "<",
  ["&gt;"]     = ">",
  ["&quot;"]   = '"',
  ["&apos;"]   = "'",
  ["&nbsp;"]   = "\194\160",       -- U+00A0
  ["&copy;"]   = "\194\169",       -- U+00A9
  ["&reg;"]    = "\194\174",       -- U+00AE
  ["&trade;"]  = "\226\132\162",   -- U+2122
  ["&mdash;"]  = "\226\128\148",   -- U+2014
  ["&ndash;"]  = "\226\128\147",   -- U+2013
  ["&laquo;"]  = "\194\171",       -- U+00AB
  ["&raquo;"]  = "\194\187",       -- U+00BB
  ["&bull;"]   = "\226\128\162",   -- U+2022
  ["&hellip;"] = "\226\128\166",   -- U+2026
  ["&euro;"]   = "\226\130\172",   -- U+20AC
  ["&pound;"]  = "\194\163",       -- U+00A3
  ["&yen;"]    = "\194\165",       -- U+00A5
  ["&cent;"]   = "\194\162",       -- U+00A2
  ["&deg;"]    = "\194\176",       -- U+00B0
  ["&times;"]  = "\195\151",       -- U+00D7
  ["&divide;"] = "\195\183",       -- U+00F7
  ["&plusmn;"] = "\194\177",       -- U+00B1
  ["&frac12;"] = "\194\189",       -- U+00BD
  ["&frac14;"] = "\194\188",       -- U+00BC
  ["&frac34;"] = "\194\190",       -- U+00BE
}

-- Encode special characters to HTML entities
function M.encode(text)
  local result = text
  -- Encode & first to avoid double-encoding
  result = result:gsub("&", "&amp;")
  result = result:gsub("<", "&lt;")
  result = result:gsub(">", "&gt;")
  result = result:gsub('"', "&quot;")
  result = result:gsub("'", "&apos;")
  return result
end

-- Decode HTML entities back to characters
function M.decode(text)
  local result = text
  -- Decode all entities except &amp; first to avoid double-decoding
  for entity, char in pairs(decode_map) do
    if entity ~= "&amp;" then
      result = result:gsub(entity, char)
    end
  end
  -- Decode &amp; last
  result = result:gsub("&amp;", "&")
  return result
end

-- Return the list of common HTML entities for the picker
function M.entities()
  return {
    {entity = "&nbsp;",   char = " ",   desc = "Non-breaking space"},
    {entity = "&lt;",     char = "<",   desc = "Less than"},
    {entity = "&gt;",     char = ">",   desc = "Greater than"},
    {entity = "&amp;",    char = "&",   desc = "Ampersand"},
    {entity = "&quot;",   char = '"',   desc = "Double quote"},
    {entity = "&apos;",   char = "'",   desc = "Apostrophe"},
    {entity = "&copy;",   char = "(c)", desc = "Copyright"},
    {entity = "&reg;",    char = "(R)", desc = "Registered"},
    {entity = "&trade;",  char = "TM",  desc = "Trademark"},
    {entity = "&mdash;",  char = "---", desc = "Em dash"},
    {entity = "&ndash;",  char = "--",  desc = "En dash"},
    {entity = "&laquo;",  char = "<<",  desc = "Left angle quote"},
    {entity = "&raquo;",  char = ">>",  desc = "Right angle quote"},
    {entity = "&bull;",   char = "*",   desc = "Bullet"},
    {entity = "&hellip;", char = "...", desc = "Ellipsis"},
    {entity = "&euro;",   char = "EUR", desc = "Euro sign"},
    {entity = "&pound;",  char = "GBP", desc = "Pound sign"},
    {entity = "&yen;",    char = "JPY", desc = "Yen sign"},
    {entity = "&cent;",   char = "c",   desc = "Cent sign"},
    {entity = "&deg;",    char = "o",   desc = "Degree"},
    {entity = "&times;",  char = "x",   desc = "Multiplication"},
    {entity = "&divide;", char = "/",   desc = "Division"},
    {entity = "&plusmn;", char = "+/-", desc = "Plus-minus"},
    {entity = "&frac12;", char = "1/2", desc = "One half"},
    {entity = "&frac14;", char = "1/4", desc = "One quarter"},
    {entity = "&frac34;", char = "3/4", desc = "Three quarters"},
  }
end

return M
