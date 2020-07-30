const https = require('https');
const fs = require('fs');
const options = {
  pfx: fs.readFileSync('petcommunity.pfx'),
  passphrase: '123456'
};

var app = https.createServer(options, (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.setHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS");
    //res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type,Origin,Accept,Access-Control-Request-Method,Access-Control-Request-Headers,Authorization');
    res.setHeader('Access-Control-Allow-Credentials', true);

}).listen(3000, '192.168.0.18', () => {
    console.log('listening on *:3000');
});

var io = require('socket.io')(app);
var userList = new Array();

io.on('connection', (socket) => {
  console.log('user connected');
  socket.on('disconnect', () => {
    console.log('user disconnected');
  });
  socket.on('chat message', (msg) => {
    io.emit('chat message', msg);
    console.log('message: ' + msg);
  });
  socket.on('memberInfo', function(memberInfo){
//    addMemberInfoToArray(socket, memberInfo, userList);
    console.log('memberId : ' + memberInfo.memberId);
    console.log('memberPassword : ' + memberInfo.memberPassword);
    console.log('memberName : ' + memberInfo.memberName);
    console.log('memberAddress : ' + memberInfo.memberAddress);
    console.log('memberTel : ' + memberInfo.memberTel);
    console.log('memberEmail : ' + memberInfo.memberEmail);
    console.log('memberBirthday : ' + memberInfo.memberBirthday);
    console.log('memberFlag : ' + memberInfo.memberFlag);
    io.emit('chat message', memberInfo.memberId + "님이 입장하셨습니다.");
//    printUserListInConsole();
  });
});
/*
function addMemberInfoToArray(socket, outerMemberInfo, userList){
  var tempObject = new Object();
  var tempMemberInfo = new Object();
  tempObject.socketId = socket.id;
  if(outerMemberInfo!=undefined){

    tempObject.memberId = outerMemberId;
  }else{
    tempObject.memberId = "user_"+socket.id;
  }
  userList.push(tempObject);
}
function printUserListInConsole(){
  console.log("printUserListInConsole start ...");
  for(var i=0; i<userList.length; i++){
    console.log(userList[i].memberId);
  }
  console.log("printUserListInConsole end ...");
}
*/