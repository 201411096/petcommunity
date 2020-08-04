(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("manager");
            this.set_titletext("manager");
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


            obj = new Dataset("manager", this);
            obj._setContents("<ColumnInfo><Column id=\"managerId\" type=\"STRING\" size=\"256\"/><Column id=\"managerDept\" type=\"STRING\" size=\"256\"/><Column id=\"managerHireDate\" type=\"STRING\" size=\"256\"/><Column id=\"managerName\" type=\"STRING\" size=\"256\"/><Column id=\"managerTel\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            obj = new Dataset("dept", this);
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">0</Col><Col id=\"data\">회원관리</Col></Row><Row><Col id=\"code\">1</Col><Col id=\"data\">커뮤니티</Col></Row><Row><Col id=\"code\">2</Col><Col id=\"data\">고객문의</Col></Row><Row><Col id=\"code\">3</Col><Col id=\"data\">반려동물</Col></Row><Row><Col id=\"code\">4</Col><Col id=\"data\">스토어</Col></Row></Rows>");
            this.addChild(obj.name, obj);
            
            // UI Components Initialize
            obj = new Grid("Grid03","731","150","505","492",null,null,null,null,null,null,this);
            obj.set_taborder("7");
            obj.set_border("1px solid black");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid01","10","40","710","600",null,null,null,null,null,null,this);
            obj.set_taborder("6");
            obj.set_border("1px solid black");
            obj._setContents("");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00","30","60","668","560",null,null,null,null,null,null,this);
            obj.set_taborder("0");
            obj.set_binddataset("manager");
            obj.set_color("transparent");
            obj.set_border("1px solid black");
            obj.set_cursor("pointer");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"98\"/><Column size=\"133\"/><Column size=\"138\"/><Column size=\"139\"/><Column size=\"160\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"아이디\"/><Cell col=\"1\" text=\"부서명\"/><Cell col=\"2\" text=\"입사일\"/><Cell col=\"3\" text=\"이름\"/><Cell col=\"4\" text=\"연락처\"/></Band><Band id=\"body\"><Cell text=\"bind:memberId\"/><Cell col=\"1\" text=\"bind:memberName\"/><Cell col=\"2\" text=\"bind:memberAddress\"/><Cell col=\"3\" text=\"bind:memberTel\"/><Cell col=\"4\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Static("Static00","777","240","59","40",null,null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_text("아이디");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Static("Static02","780","340","59","50",null,null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_text("부서명");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Static("Static03","780","450","59","44",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            obj.set_text("입사일");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            this.addChild(obj.name, obj);

            obj = new Button("managerDelete","1130","580","70","40",null,null,null,null,null,null,this);
            obj.set_taborder("5");
            obj.set_text("삭제");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            obj = new Edit("managerId","870","236","310","47",null,null,null,null,null,null,this);
            obj.set_taborder("4");
            obj.set_border("1px solid darkgray");
            this.addChild(obj.name, obj);

            obj = new Button("Button00","10","10","117","30",null,null,null,null,null,null,this);
            obj.set_taborder("8");
            obj.set_text("회원관리");
            this.addChild(obj.name, obj);

            obj = new Button("Button00_00","130","10","117","30",null,null,null,null,null,null,this);
            obj.set_taborder("9");
            obj.set_text("직원관리");
            this.addChild(obj.name, obj);

            obj = new Button("managerSelect","745","60","115","60",null,null,null,null,null,null,this);
            obj.set_taborder("10");
            obj.set_text("조회");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            obj = new Button("managerUpdate","1045","580","70","40",null,null,null,null,null,null,this);
            obj.set_taborder("11");
            obj.set_text("수정");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            obj = new Button("managerInsert","960","580","70","40",null,null,null,null,null,null,this);
            obj.set_taborder("12");
            obj.set_text("등록");
            obj.set_font("bold 14px/normal \"HY신명조\"");
            obj.set_border("1px solid black");
            this.addChild(obj.name, obj);

            obj = new Combo("managerDept","869","343","311","53",null,null,null,null,null,null,this);
            obj.set_taborder("13");
            obj.set_innerdataset("dept");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_text("Combo00");
            this.addChild(obj.name, obj);

            obj = new Calendar("managerHireDate","870","446","312","52",null,null,null,null,null,null,this);
            obj.set_taborder("14");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","Desktop_screen",1280,720,this,
            	//-- Layout function
            	function(p)
            	{
                var rootobj = p;
                p = rootobj;
                p.set_titletext("manager");

                p.Grid03.set_taborder("7");
                p.Grid03.set_border("1px solid black");
                p.Grid03.move("731","150","505","492",null,null);

                p.Grid01.set_taborder("6");
                p.Grid01.set_border("1px solid black");
                p.Grid01.move("10","40","710","600",null,null);

                p.Grid00.set_taborder("0");
                p.Grid00.set_binddataset("manager");
                p.Grid00.set_color("transparent");
                p.Grid00.set_border("1px solid black");
                p.Grid00.set_cursor("pointer");
                p.Grid00.move("30","60","668","560",null,null);

                p.Static00.set_taborder("1");
                p.Static00.set_text("아이디");
                p.Static00.set_font("bold 14px/normal \"HY신명조\"");
                p.Static00.move("777","240","59","40",null,null);

                p.Static02.set_taborder("2");
                p.Static02.set_text("부서명");
                p.Static02.set_font("bold 14px/normal \"HY신명조\"");
                p.Static02.move("780","340","59","50",null,null);

                p.Static03.set_taborder("3");
                p.Static03.set_text("입사일");
                p.Static03.set_font("bold 14px/normal \"HY신명조\"");
                p.Static03.move("780","450","59","44",null,null);

                p.managerDelete.set_taborder("5");
                p.managerDelete.set_text("삭제");
                p.managerDelete.set_font("bold 14px/normal \"HY신명조\"");
                p.managerDelete.set_border("1px solid black");
                p.managerDelete.move("1130","580","70","40",null,null);

                p.managerId.set_taborder("4");
                p.managerId.set_border("1px solid darkgray");
                p.managerId.move("870","236","310","47",null,null);

                p.Button00.set_taborder("8");
                p.Button00.set_text("회원관리");
                p.Button00.move("10","10","117","30",null,null);

                p.Button00_00.set_taborder("9");
                p.Button00_00.set_text("직원관리");
                p.Button00_00.move("130","10","117","30",null,null);

                p.managerSelect.set_taborder("10");
                p.managerSelect.set_text("조회");
                p.managerSelect.set_font("bold 14px/normal \"HY신명조\"");
                p.managerSelect.set_border("1px solid black");
                p.managerSelect.move("745","60","115","60",null,null);

                p.managerUpdate.set_taborder("11");
                p.managerUpdate.set_text("수정");
                p.managerUpdate.set_font("bold 14px/normal \"HY신명조\"");
                p.managerUpdate.set_border("1px solid black");
                p.managerUpdate.move("1045","580","70","40",null,null);

                p.managerInsert.set_taborder("12");
                p.managerInsert.set_text("등록");
                p.managerInsert.set_font("bold 14px/normal \"HY신명조\"");
                p.managerInsert.set_border("1px solid black");
                p.managerInsert.move("960","580","70","40",null,null);

                p.managerDept.set_taborder("13");
                p.managerDept.set_innerdataset("dept");
                p.managerDept.set_codecolumn("code");
                p.managerDept.set_datacolumn("data");
                p.managerDept.set_text("Combo00");
                p.managerDept.move("869","343","311","53",null,null);

                p.managerHireDate.set_taborder("14");
                p.managerHireDate.move("870","446","312","52",null,null);
            	}
            );
            this.addLayout(obj.name, obj);

            //-- Normal Layout : this
            obj = new Layout("Layout0","",1280,720,this,
            	//-- Layout function
            	function(p)
            	{
                var rootobj = p;
                p = rootobj;

            	}
            );
            obj.set_mobileorientation("landscape");
            this.addLayout(obj.name, obj);
            
            // BindItem Information

        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script
        this.registerScript("Form_Work_copy0.xfdl", function() {


        this.Button00_onclick = function(obj,e)
        {
        	this.go("FrameBase::Form_Work.xfdl")
        };

        this.Button00_00_onclick = function(obj,e)
        {
        	this.go("FrameBase::Form_Work_copy0.xfdl")
        };

        // 매니저 조회버튼
        this.managerSelectBtn_onclick = function(obj,e)
        {
        	this.transaction(
         			"urlTest03",
        			"strURL::managerselect.do",
         			"",
         			"manager=ar",
         			"",
         			"fn_callback"
         		);

        	this.fn_callback = function(svcID, errCD, errMSG){
        		let ret = (errMSG=="FAILED" || svcID != "urlTest03") ? "error" : "success";
        		if(ret=="error")
        			this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);
        	}
        };

        //매니저 부서 등록하기
        this.managerInsertBtn_onclick = function(obj,e){
        	alert("등록");
        	var Id = encodeURI(this.managerId.value,"UTF-8");
        	var Dept = this.managerDept.text;
        	var managerHire = encodeURI(this.managerHireDate.value,"UTF-8");

         	this.transaction(
         			"urlTest05",
        			"strURL::managerInsert.do?id="+Id+"&dept="+Dept+"&hireDate="+managerHire,
         			"",
         			"manager=ar",
         			"",
         			"fn_callback"
         		);

         	this.fn_callback = function(svcID, errCD, errMSG){
         		let ret = (errMSG=="FAILED" || svcID != "urlTest05") ? "error" : "success";
         		if(ret=="error")
         			this.alert("[폼이름_fn_callback] "+ret + " : " + svcID + ", " + errCD + ", " + errMSG);
        	};

        };

        });
        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.managerDelete.addEventHandler("onclick",this.deleteBtn_onclick,this);
            this.managerId.addEventHandler("onchanged",this.Edit00_onchanged,this);
            this.Button00.addEventHandler("onclick",this.Button00_onclick,this);
            this.Button00_00.addEventHandler("onclick",this.Button00_00_onclick,this);
            this.managerSelect.addEventHandler("onclick",this.managerSelectBtn_onclick,this);
            this.managerUpdate.addEventHandler("onclick",this.deleteBtn_onclick,this);
            this.managerInsert.addEventHandler("onclick",this.managerInsertBtn_onclick,this);
        };

        this.loadIncludeScript("Form_Work_copy0.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
