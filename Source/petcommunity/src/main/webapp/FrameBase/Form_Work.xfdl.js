(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("member");
            this.set_titletext("Form_Work");
            if (Form == this.constructor)
            {
                this._setFormPosition(1280,720);
            }
            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("Dataset00", this);
            obj._setContents("<ColumnInfo><Column id=\"memberId\" type=\"STRING\" size=\"100\"/><Column id=\"memberName\" type=\"STRING\" size=\"100\"/><Column id=\"memberAddress\" type=\"STRING\" size=\"100\"/><Column id=\"memberTel\" type=\"STRING\" size=\"100\"/><Column id=\"memberEmail\" type=\"STRING\" size=\"100\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            obj = new Dataset("Dataset01", this);
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">0</Col><Col id=\"data\">아이디</Col></Row><Row><Col id=\"code\">1</Col><Col id=\"data\">이름</Col></Row><Row><Col id=\"code\">2</Col><Col id=\"data\">주소</Col></Row></Rows>");
            this.addChild(obj.name, obj);
            
            // UI Components Initialize
            obj = new Grid("Grid03","731","150","505","492",null,null,null,null,null,null,this);
            obj.set_taborder("18");
            obj.set_border("1px solid black");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid02","730","40","506","100",null,null,null,null,null,null,this);
            obj.set_taborder("17");
            obj.set_border("1px solid black");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01","10","40","710","600",null,null,null,null,null,null,this);
            obj.set_taborder("16");
            obj.set_border("1px solid black");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00","30","60","668","560",null,null,null,null,null,null,this);
            obj.set_taborder("0");
            obj.set_binddataset("Dataset00");
            obj.set_color("transparent");
            obj.set_border("1px solid black");
            obj.set_cursor("pointer");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"83\"/><Column size=\"177\"/><Column size=\"172\"/><Column size=\"154\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"아이디\"/><Cell col=\"1\" text=\"회원명\"/><Cell col=\"2\" text=\"주소\"/><Cell col=\"3\" text=\"연락처\"/><Cell col=\"4\" text=\"이메일\"/></Band><Band id=\"body\"><Cell text=\"bind:memberId\"/><Cell col=\"1\" text=\"bind:memberName\"/><Cell col=\"2\" text=\"bind:memberAddress\"/><Cell col=\"3\" text=\"bind:memberTel\"/><Cell col=\"4\" text=\"bind:memberEmail\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo00","740","70","70","40",null,null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_innerdataset("Dataset01");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_border("1px solid black");
            obj.set_text("");
            this.addChild(obj.name, obj);

            obj = new Edit("memberInfo","820","70","240","40",null,null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            obj = new Button("searchInfo","1075","70","70","40",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            obj.set_text("검색");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            obj = new Static("Static00","777","200","59","40",null,null,null,null,null,null,this);
            obj.set_taborder("4");
            obj.set_text("성명");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Static("Static02","780","270","59","50",null,null,null,null,null,null,this);
            obj.set_taborder("5");
            obj.set_text("아이디");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Static("Static03","780","340","59","44",null,null,null,null,null,null,this);
            obj.set_taborder("6");
            obj.set_text("주소");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Button("deleteInfo","1130","580","70","40",null,null,null,null,null,null,this);
            obj.set_taborder("10");
            obj.set_text("삭제");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            obj = new Static("Static03_00","781","410","59","50",null,null,null,null,null,null,this);
            obj.set_taborder("11");
            obj.set_text("연락처");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Static("Static00_00","780","483","59","40",null,null,null,null,null,null,this);
            obj.set_taborder("12");
            obj.set_text("이메일");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Edit("memberAddress","870","337","310","47",null,null,null,null,null,null,this);
            obj.set_taborder("7");
            obj.set_border("1px solid darkgray");
            this.addChild(obj.name, obj);

            obj = new Edit("memberName","870","196","310","47",null,null,null,null,null,null,this);
            obj.set_taborder("8");
            obj.set_border("1px solid darkgray");
            this.addChild(obj.name, obj);

            obj = new Edit("memberId","870","270","310","47",null,null,null,null,null,null,this);
            obj.set_taborder("9");
            obj.set_visible("true");
            obj.set_border("1px solid darkgray");
            obj.set_color("black");
            this.addChild(obj.name, obj);

            obj = new Edit("memberTel","870","407","310","47",null,null,null,null,null,null,this);
            obj.set_taborder("13");
            obj.set_border("1px solid darkgray");
            this.addChild(obj.name, obj);

            obj = new Edit("memberEmail","870","476","310","47",null,null,null,null,null,null,this);
            obj.set_taborder("15");
            obj.set_border("1px solid darkgray");
            this.addChild(obj.name, obj);

            obj = new Button("selectInfo","1155","70","70","40",null,null,null,null,null,null,this);
            obj.set_taborder("14");
            obj.set_text("보기");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","Desktop_screen",1280,720,this,function(p){});
            this.addLayout(obj.name, obj);
            
            // BindItem Information
            obj = new BindItem("item0","memberName","value","Dataset00","memberName");
            this.addChild(obj.name, obj);
            obj.bind();

            obj = new BindItem("item1","memberId","value","Dataset00","memberId");
            this.addChild(obj.name, obj);
            obj.bind();

            obj = new BindItem("item2","memberAddress","value","Dataset00","memberAddress");
            this.addChild(obj.name, obj);
            obj.bind();

            obj = new BindItem("item3","memberTel","value","Dataset00","memberTel");
            this.addChild(obj.name, obj);
            obj.bind();

            obj = new BindItem("item4","memberEmail","value","Dataset00","memberEmail");
            this.addChild(obj.name, obj);
            obj.bind();
        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script
        this.registerScript("Form_Work.xfdl", function() {
        //보기 버튼 눌렸을 때
        this.selectBtn_onclick = function(obj,e)
        {
         	this.transaction(
         			"urlTest03",
        			"strURL::selectInfo.do",
         			"",
         			"Dataset00=ar",
         			"",
         			"fn_callback"
         		);

        	this.fn_callback = function(svcID, errCD, errMSG){
        		let ret = (errMSG=="FAILED" || svcID != "urlTest03") ? "error" : "success";
        		if(ret=="error")
        			this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);
        	}
        };


        //검색 버튼 눌렸을 때
        this.searchBtn_onclick = function(obj,e)
        {
        	var combobox = encodeURI(this.Combo00.value,"UTF-8");
        	var memberInfo = encodeURI(this.memberInfo.value,"UTF-8");
        	console.log(combobox);
        	console.log(memberInfo);

         	this.transaction(
         			"urlTest03",
        			"strURL::searchInfo.do?searchword="+memberInfo+"&combobox="+combobox,
         			"",
         			"Dataset00=ar",
         			"",
         			"fn_callback"
         		);

         	this.fn_callback = function(svcID, errCD, errMSG){
         		let ret = (errMSG=="FAILED" || svcID != "urlTest03") ? "error" : "success";
         		if(ret=="error")
         			this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);
        	}
        };

        //삭제 버튼 눌렸을 때
        this.deleteBtn_onclick = function(obj,e)
        {
        	var result = this.confirm("회원을 삭제하시겠습니까?");
        	if(result){

        		var memberId = encodeURI(this.memberId.value,"UTF-8");
        	this.transaction(
         			"urlTest04",
        			"strURL::deleteInfo.do?memberId="+this.memberId.value,
         			"",
         			"Dataset00=ar",
         			"",
         			"fn_callback"
         		);

        	this.Dataset00.deleteRow(this.Dataset00.rowposition);
        	this.Dataset00.addRow(this.Dataset00.rowposition);
        	this.fn_callback = function(svcID, errCD, errMSG){
        		let ret = (errMSG=="FAILED" || svcID != "urlTest04") ? "error" : "success";
        		alert("삭제되었습니다.");
        // 		if(ret=="error")
        // 			this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);
        	}
        	}


        };




        });
        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.memberInfo.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.searchInfo.addEventHandler("onclick",this.searchBtn_onclick,this);
            this.deleteInfo.addEventHandler("onclick",this.deleteBtn_onclick,this);
            this.memberAddress.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.memberName.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.memberId.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.memberTel.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.memberEmail.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.selectInfo.addEventHandler("onclick",this.selectBtn_onclick,this);
        };

        this.loadIncludeScript("Form_Work.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
