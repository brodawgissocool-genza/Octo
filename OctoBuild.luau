--- this is the luau build

print("octo.cloud json, this build is used for luau packages.")

local function readluau()
  print("octo.cl")
  print("MIT")
  --- running
  --- going to json directory 
end

--!strict
local octopusCount: number = 8
local languageName: string = "Octo"

--!strict
-- Octo Language Core Interpreter Engine

-- 1. Grab the raw .oct code string passed from your Dart script
local args = {...}
local rawOctoCode = args[1] or "Squirt(\"No code provided!\")"

-- 2. Create your variable tracking database
local OctoVariables = {}

-- 3. Define what your custom functions actually do in Luau
local function runCommand(lineText: string)
    -- Clean up trailing/leading spaces
    lineText = string.gsub(lineText, "^%s*(.-)%s*$", "%1")
    
    -- Ignore comments
    if string.sub(lineText, 1, 2) == "//" then 
        return 
    end
    
    -- Handle var: var - creates a NIL variable
    if string.sub(lineText, 1, 4) == "var " then
        local varName = string.sub(lineText, 5)
        OctoVariables[varName] = "NIL"
        return
    end
    
    -- Handle Squirt(): Squirt() - prints out the given input
    if string.match(lineText, "^Squirt%((.-)%)$") then
        local payload = string.match(lineText, "^Squirt%((.-)%)$")
        -- Strip out quotes if it's a raw string literal
        payload = string.gsub(payload, "\"", "")
        print(payload)
        return
    end
end

-- 4. Main Interpreter Loop: Split code by lines and run them sequentially
local codeLines = string.split(rawOctoCode, "\n")
for _, line in codeLines do
    if line ~= "" then
        runCommand(line)
    end
end

