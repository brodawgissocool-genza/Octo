// Header prints from your original Luau file
console.log("octo.cloud json, this build is used for luau packages.");

function readluau() {
    console.log("octo.cl");
    console.log("MIT");
    // running
    // going to json directory
}

// Global variable configurations
let octopusCount = 8;
let languageName = "Octo";

// 1. Grab the raw .oct code string passed from arguments
// Node.js arguments start at index 2 (index 0 is node, index 1 is the file path)
const args = process.argv.slice(2);
let rawOctoCode = "";

if (args.length > 0) {
    rawOctoCode = args[0];
} else {
    rawOctoCode = 'Squirt("No code provided!")';
}

// 2. Create your variable tracking database
let OctoVariables = {};

// 3. Define what your custom functions actually do in JavaScript
function runCommand(lineText) {
    // Clean up trailing/leading spaces
    lineText = lineText.trim();
    
    // Ignore comments
    if (lineText.startsWith("//")) {
        return;
    }
    
    // Handle var: var - creates a NIL variable
    if (lineText.startsWith("var ")) {
        let varName = lineText.slice(4).trim();
        OctoVariables[varName] = "NIL";
        return;
    }
    
    // Handle Squirt(): Squirt() - prints out the given input
    if (lineText.startsWith("Squirt(") && lineText.endsWith(")")) {
        let payload = lineText.slice(7, -1);
        // Strip out quotes if it's a raw string literal
        payload = payload.replace(/"/g, '');
        console.log(payload);
        return;
    }
}

// 4. Main Interpreter Loop: Split code by lines and run them sequentially
const codeLines = rawOctoCode.split("\n");
for (let line of codeLines) {
    if (line !== "") {
        runCommand(line);
    }
}
