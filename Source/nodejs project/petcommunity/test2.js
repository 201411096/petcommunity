var fs = require('fs');
var moment = require('moment');
require('moment-timezone');
moment.tz.setDefault("Asia/Seoul");

fs.appendFile('.\\log\\chat_log\\mynewfile1.txt', 'Hello content!', function (err) {
    if (err) throw err;
    console.log('Saved!');
  });

function myAppendFile(){
    
}