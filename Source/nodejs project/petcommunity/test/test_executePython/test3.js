let {PythonShell} = require('python-shell')

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
console.log("directoryPath 확인 : ", directoryPath);

var options = {
    mode: 'text',
    pythonPath: 'C:/ProgramData/Anaconda3/python.exe', //python의 설치경로를 입력하는 부분
    pythonOptions: ['-u'],
    scriptPath: '',
    // args:[1],
    args: [0, '20200801', '20200831', '100']
}

PythonShell.run(directoryPath, options, function (err, results) {
    console.log("check directoryPath in PythonShell.run() ..." + directoryPath);
    if (err) throw err;
  
    
    console.log('results: %j', results);
  });