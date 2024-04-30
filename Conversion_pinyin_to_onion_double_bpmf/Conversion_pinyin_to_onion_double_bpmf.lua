--[[
一般拼音轉寫成洋蔥注音雙拼
rime 字典格式
--]]

-- local file = io.open("input_pinyin.txt", "r")
-- -- io.input(text)
-- -- text=""
-- local text=file:read('*all')
-- -- print(f)
-- file:close()


local function convert_to_onion_double_bpmf(text)
  if text == "" then return "" end
  text = string.gsub(text, "iu", "iU")
  text = string.gsub(text, "ui", "uI")
  text = string.gsub(text, "ong", "ung")
  text = string.gsub(text, "yi?", "i")
  text = string.gsub(text, "wu?", "u")
  text = string.gsub(text, "iu", "v")
  text = string.gsub(text, "([jqx])u", "%1v")
  text = string.gsub(text, "([iuv])n", "%1en")
  text = string.gsub(text, "zhi?", "Z")
  text = string.gsub(text, "chi?", "C")
  text = string.gsub(text, "shi?", "S")
  text = string.gsub(text, "([zcsr])i", "%1")
  text = string.gsub(text, "ai", "A")
  text = string.gsub(text, "ei", "I")
  text = string.gsub(text, "ao", "O")
  text = string.gsub(text, "ou", "U")
  text = string.gsub(text, "ang", "K")
  text = string.gsub(text, "eng", "G")
  text = string.gsub(text, "an", "M")
  text = string.gsub(text, "en", "N")
  text = string.gsub(text, "er", "R")
  text = string.gsub(text, "eh", "E")
  text = string.gsub(text, "([iv])e", "%1E")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])v(%d)\n", "\t%1y%2\n")
  text = string.gsub(text, "\tv", "\ty")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])iO", "\t%1q")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])iU", "\t%1c")
  -- text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])(uA|iM)", "\t%1m")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])(uA)", "\t%1m")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])(iM)", "\t%1m")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])uo", "\t%1o")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])iE", "\t%1p")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])[vu]N", "\t%1v")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])[vu]G", "\t%1b")
  -- text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])(vE|uI)", "\t%1l")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])(vE)", "\t%1l")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])(uI)", "\t%1l")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])[ui]a", "\t%1z")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])[ui]K", "\t%1x")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])[vu]M", "\t%1n")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])iN", "\t%1r")
  text = string.gsub(text, "\t([bpmfdtnlgkhjqxZCSrzcs])iG", "\t%1t")
  text = string.gsub(text, "\t([aoeEAIOUMNKGR]%d)\n", "\to%1\n")
  text = string.gsub(text, "\t([rZSCzsc])(%d)\n", "\t%1i%2\n")
  text = string.gsub(text, "\t([yui])(%d)\n", "\t%1e%2\n")
  text = string.gsub(text, "O", "w")
  text = string.gsub(text, "R", "r")
  text = string.gsub(text, "U", "d")
  text = string.gsub(text, "A", "j")
  text = string.gsub(text, "K", "s")
  text = string.gsub(text, "M", "h")
  text = string.gsub(text, "N", "f")
  text = string.gsub(text, "G", "g")
  text = string.gsub(text, "E", "k")
  text = string.gsub(text, "I", "k")
  text = string.gsub(text, "Z", "w")
  text = string.gsub(text, "S", "a")
  text = string.gsub(text, "C", "v")
  text = string.gsub(text, "1", ";")
  text = string.gsub(text, "2", "/")
  text = string.gsub(text, "3", ",")
  text = string.gsub(text, "4", "'")
  text = string.gsub(text, "5", ".")
  return text
end


local function readFile(fileName)
  local f = assert(io.open(fileName,'r'))
  local content = f:read('*all')
  f:close()
  return content
end

local function writeFile(fileName,content)
  local f = assert(io.open(fileName,'w'))
  f:write(content)
  f:close()
end

-- local function appendFile(fileName,content)
--   local f = assert(io.open(fileName,'a'))
--   f:write(content)
--   f:close()
-- end




local output_content = convert_to_onion_double_bpmf(readFile('input_pinyin.txt'))
-- print(readFile('input_pinyin.txt'))
writeFile('output_onion_double_bpmf.txt', output_content)

