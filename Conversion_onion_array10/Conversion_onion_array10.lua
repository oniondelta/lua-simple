--[[
「行列 10 數字編碼」和「行列 10 洋蔥英文編碼」相互轉換。
rime 字典格式
--]]

-- local file = io.open("input_pinyin.txt", "r")
-- -- io.input(text)
-- -- text=""
-- local text=file:read('*all')
-- -- print(f)
-- file:close()


local function convert_to_abc(text)
  if text == "" then return "" end
  text = string.gsub(text, "1", "z")
  text = string.gsub(text, "2", "x")
  text = string.gsub(text, "3", "c")
  text = string.gsub(text, "4", "a")
  text = string.gsub(text, "5", "s")
  text = string.gsub(text, "6", "d")
  text = string.gsub(text, "7", "q")
  text = string.gsub(text, "8", "w")
  text = string.gsub(text, "9", "e")
  text = string.gsub(text, "0", "f")
  -- text = string.gsub(text, ".", "v")
  -- text = string.gsub(text, "@", "v")
  text = string.gsub(text, "@", "")
  return text
end


local function convert_to_123(text)
  if text == "" then return "" end
  text = string.gsub(text, "z", "1")
  text = string.gsub(text, "x", "2")
  text = string.gsub(text, "c", "3")
  text = string.gsub(text, "a", "4")
  text = string.gsub(text, "s", "5")
  text = string.gsub(text, "d", "6")
  text = string.gsub(text, "q", "7")
  text = string.gsub(text, "w", "8")
  text = string.gsub(text, "e", "9")
  text = string.gsub(text, "f", "0")
  -- text = string.gsub(text, "v", ".")
  -- text = string.gsub(text, "v", "@")
  -- text = string.gsub(text, "v", "")
  return text
end


-- 分割字符串
local function split(str, reps)
  local resultStrList = {}
  -- ⚠️ 以下原本為"[^"..reps.."]+"，後面為「+」，但如此「\n\n」之空白行會跳掉，改「*」則保留空白行 ⚠️
  string.gsub(str, "[^"..reps.."]*", function(w)
    table.insert(resultStrList, w)
  end)
  return resultStrList
end


-- 執行：分割 → 轉換 → 合併
local function split_convert_concat(convert, input_txt)
  local split_table = split(input_txt, "\n")
  -- 此時「split_table」格式為：{"word1-code1-weight1", "word2-code2-weight2", "word3-code3-weight3", ...}
  for i, k in pairs(split_table) do
    split_table[i] = split(k, "\t")
  end
  -- 此時「split_table」格式為：{{word1, code1, weight1}, {word2, code2, weight2}, {word3, code3, weight3}, ...}
  for i, k in pairs(split_table) do
    k[2] = k[2] and convert(k[2]) or k[2]  -- 此處轉換「code」
    k = table.concat(k, "\t")
    split_table[i] = k
  end
  -- 此時「split_table」格式為：{"word1-code1-weight1", "word2-code2-weight2", "word3-code3-weight3", ...}
  local split_table = table.concat(split_table, "\n")  -- 空行會跳掉
  -- 此時「split_table」格式為一整個字串。
  return split_table
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




local output_content = split_convert_concat(convert_to_abc, readFile('input_array10.txt'))
writeFile('output_array10_abc.txt', output_content)

-- local output_content = split_convert_concat(convert_to_123, readFile('input_array10.txt'))
-- writeFile('output_array10_123.txt', output_content)

-- print(output_content)

