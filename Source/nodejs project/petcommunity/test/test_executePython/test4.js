let {PythonShell} = require('python-shell')
//var parser = require('fast-xml-parser');
const convert = require('xml-js');
var systemPythonPath = 'C:/ProgramData/Anaconda3/python.exe'
var directoryPath = process.cwd();
var directoryPathArray = directoryPath.split('\\');
for(var i=0; i<4; i++){
    directoryPathArray.pop();
}
directoryPath = directoryPathArray[0];
for(var i=1; i<directoryPathArray.length; i++){
    directoryPath+="/";
    directoryPath+=directoryPathArray[i];
}
directoryPath+="/python project/pythonProject_kys/PublicData.py";

var options = {
    mode: 'text',
    pythonPath: systemPythonPath, //python의 설치경로를 입력하는 부분
    pythonOptions: ['-u'],
    scriptPath: '',
    // args:[1],
    args: [0, '20200801', '20200831', '3']
}

PythonShell.run(directoryPath, options, function (err, results) {
    if (err) throw err;
    // console.log('results: %j', results);
    // var parsedResult = parser.parse(results);
    var parsedResult = convert.xml2json(results, {compact: true, spaces: 4});
    console.log(typeof(parsedResult));
  });