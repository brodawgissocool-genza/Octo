import 'dart:html' as Html;

var Luau, Json, Layout_type;


main() {
  print('Octo.cloud fundemental (USE LUAU AND PYTHON!)');
  Luau = 'True';
  Json = 'Dynamic ';
  Layout_type = Html.window.prompt('Layout typw? Dark/punchy, white/punchy, or Dark/classic, and White/classic', '');
  print('Using the revision…….');
}


import 'dart:io';

void main() async {
  // 1. Read the custom .oct code file
  var octCode = await File('script.oct').readAsString();
  
  // 2. Pass the raw code text directly into your Luau executor process
  Process.run('luau', ['OctoBuild.luau', octCode]).then((ProcessResult results) {
    print(results.stdout);
  });
}
