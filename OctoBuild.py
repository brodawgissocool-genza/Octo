import sys

# Maintaining your exact print header strings
print("octo.cloud json, this build is used for luau packages.")

def readluau():
    print("octo.cl")
    print("MIT")
    # running
    # going to json directory
    pass

# Preserving your variables exactly
octopusCount = 8
languageName = "Octo"

# Grab the raw text data passed into the script arguments
args = sys.argv[1:]
if len(args) > 0:
    rawOctoCode = args[0]
else:
    rawOctoCode = 'Squirt("No code provided!")'

OctoVariables = {}

def runCommand(lineText: str):
    # Python equivalent to clean up trailing/leading spaces
    lineText = lineText.strip()
    
    # Ignore comments
    if lineText.startswith("//"):
        return
    
    # Handle var: var - creates a NIL variable
    if lineText.startswith("var "):
        varName = lineText[4:]
        OctoVariables[varName] = "NIL"
        return
    
    # Handle Squirt(): Squirt() - prints out the given input
    # Directly mimics your string.match check from the Luau logic
    if lineText.startswith("Squirt(") and lineText.endswith(")"):
        payload = lineText[7:-1]
        # Strip out quotes if it's a raw string literal
        payload = payload.replace('"', '')
        print(payload)
        return

# Main Interpreter Loop: Split code by lines and run them sequentially
codeLines = rawOctoCode.split("\n")
for line in codeLines:
    if line != "":
        runCommand(line)
