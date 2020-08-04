(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("Form_Work");
            this.set_titletext("Form_Work");
            if (Form == this.constructor)
            {
                this._setFormPosition(1280,720);
            }
            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("manager", this);
            obj._setContents("<ColumnInfo><Column id=\"memberId\" type=\"STRING\" size=\"256\"/><Column id=\"managerDept\" type=\"STRING\" size=\"256\"/><Column id=\"managerHireDate\" type=\"STRING\" size=\"256\"/><Column id=\"managerName\" type=\"STRING\" size=\"256\"/><Column id=\"managerTel\" type=\"STRING\" size=\"256\"/></ColumnInfo>");
            this.addChild(obj.name, obj);


            obj = new Dataset("combo", this);
            obj._setContents("<ColumnInfo><Column id=\"code\" type=\"STRING\" size=\"256\"/><Column id=\"data\" type=\"STRING\" size=\"256\"/></ColumnInfo><Rows><Row><Col id=\"code\">0</Col><Col id=\"data\">커뮤니티</Col></Row><Row><Col id=\"code\">1</Col><Col id=\"data\">회원관리</Col></Row><Row><Col id=\"code\">2</Col><Col id=\"data\">고객문의</Col></Row><Row><Col id=\"code\">3</Col><Col id=\"data\">반려동물</Col></Row><Row><Col id=\"code\">4</Col><Col id=\"data\">동물병원</Col></Row><Row><Col id=\"code\">5</Col><Col id=\"data\">스토어</Col></Row></Rows>");
            this.addChild(obj.name, obj);
            
            // UI Components Initialize
            obj = new Edit("Edit00","680","107","310","50",null,null,null,null,null,null,this);
            obj.set_taborder("0");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00","81","107","479","309",null,null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_binddataset("manager");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"80\"/><Column size=\"102\"/><Column size=\"100\"/><Column size=\"100\"/><Column size=\"93\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"memberId\"/><Cell col=\"1\" text=\"managerDept\"/><Cell col=\"2\" text=\"managerHireDate\"/><Cell col=\"3\" text=\"managerName\"/><Cell col=\"4\" text=\"managerTel\"/></Band><Band id=\"body\"><Cell text=\"bind:memberId\"/><Cell col=\"1\" text=\"bind:managerDept\"/><Cell col=\"2\" text=\"bind:managerHireDate\"/><Cell col=\"3\" text=\"bind:managerName\"/><Cell col=\"4\" text=\"bind:managerTel\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Combo("Combo00","680","170","310","51",null,null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_innerdataset("combo");
            obj.set_codecolumn("code");
            obj.set_datacolumn("data");
            obj.set_text("Combo00");
            this.addChild(obj.name, obj);

            obj = new Calendar("Calendar00","680","234","310","53",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            this.addChild(obj.name, obj);

            obj = new Static("Static00","634","116","73","44",null,null,null,null,null,null,this);
            obj.set_taborder("4");
            obj.set_text("ID");
            this.addChild(obj.name, obj);

            obj = new Static("Static00_00","624","176","73","44",null,null,null,null,null,null,this);
            obj.set_taborder("5");
            obj.set_text("부서");
            this.addChild(obj.name, obj);

            obj = new Static("Static00_00_00","624","236","73","44",null,null,null,null,null,null,this);
            obj.set_taborder("6");
            obj.set_text("입사일");
            this.addChild(obj.name, obj);

            obj = new Button("Button00","615","342","117","54",null,null,null,null,null,null,this);
            obj.set_taborder("7");
            obj.set_text("조회");
            this.addChild(obj.name, obj);

            obj = new Button("Button00_00","745","342","117","54",null,null,null,null,null,null,this);
            obj.set_taborder("8");
            obj.set_text("수정");
            this.addChild(obj.name, obj);

            obj = new Button("Button00_00_00","875","342","117","54",null,null,null,null,null,null,this);
            obj.set_taborder("9");
            obj.set_text("삭제");
            this.addChild(obj.name, obj);

            obj = new Static("Static01","80","29","25.00%","61",null,null,null,null,null,null,this);
            obj.set_taborder("10");
            obj.set_text("직원 관리");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","Desktop_screen",1280,720,this,function(p){});
            this.addLayout(obj.name, obj);
            
            // BindItem Information

        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script
        this.registerScript("Form_Work.xfdl", function() {

        this.select_onclick = function(obj,e)
        {

        };

        });
        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.Static00_00.addEventHandler("onclick",this.Static00_00_onclick,this);
            this.Static00_00_00.addEventHandler("onclick",this.Static00_00_onclick,this);
            this.Button00.addEventHandler("onclick",this.select_onclick,this);
        };

        this.loadIncludeScript("Form_Work.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
