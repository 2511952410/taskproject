layui.use(['table', 'dropdown'], function() {
	var table = layui.table
		, $ = layui.$
		, laytpl = layui.laytpl
		, dropdown = layui.dropdown
			table.render({
		elem: '#test'  //绑定table id
		, url: 'http://localhost:8080/stu/submit.do'  //数据请求路径
		, cellMinWidth: 80
		, toolbar: '#toolbarDemo'
		,defaultToolbar: ['filter', 'exports', 'print', {
      title: '帮助'
      ,layEvent: 'LAYTABLE_TIPS'
      ,icon: 'layui-icon-tips'
    }]
 		
		, cols: [[
			  { type: 'checkbox', fixed: 'left' }
			, { field: 'subjectid', width: 130, title: '课程ID', sort: true }
			, { field: 'subjectname', width: 290, title: '课题名称' }
			, { field: 'tusername', width: 190, title: '课题老师工号' }
			, { field: 'tname', width: 160, title: '课题老师姓名' }
			, { field: 'susername', width: 150, title: '学生学号' } //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
			, { field: 'sname', width: 150, title: '学生姓名' }
			, { field: 'type', width: 170, title: '目前状态'}
			, { field:'id', width:170, title:'id'}
		]]
		, page: true   //开启分页
		, limit: 10   //默认十条数据一页
		, limits: [10, 20, 30, 50]  //数据分页条
		, id: 'testReload'
		, done: function() {
			$("[data-field='type']").children().each(function(){
     		if($(this).text()=='0'){
      			$(this).text("审核中")
     		}else if($(this).text()=='1'){
      			$(this).text("待发")
     			}else if($(this).text()=='2'){
      			$(this).text("审核未通过")
     			}else if($(this).text()=='3'){
      			$(this).text("审核通过")
     			}else if($(this).text()=='4'){
				$(this).text("作业已上传")
				}else if($(this).text()=='5'){
					$(this).text("作业审核成功，完成任务");
				}
    		});
		}
		 ,error: function(res, msg){
      console.log(res, msg)
    }
	
	});
	  
  //工具栏事件
  table.on('toolbar(tabletest)', function(obj){
    var config = obj.config;
    var checkStatus = table.checkStatus(config.id);
    switch(obj.event){
      case 'worksub':
		var getData = table.getData(obj.config.id);
		if(getData.length == 1 && getData[0].type != 4){
            layer.open({
                type:'1',
                content:$('.registerPage'),
                title:'作业上传',
                area:['430px','400px'],
                btn:['提交','取消'],
                closeBtn:0,
                btn1:function (index,layero) {
					var formData = new FormData();
					formData.append("file",$('#file')[0].files[0]);
                    $.ajax({
                        type:'post',
                        url:'http://localhost:8080/subject/stuWorkUp',
                        data:formData,
                        cache: false,
    					contentType: false,
    					processData: false,
                        success:function (data) {
							var datas = JSON.parse(data);
							if(datas[0] == 200){
								alert("作业上传成功");
								$('.registerPage').hide();
							}else{
								alert("作业上传失败了");
							}
                        },
                        error:function () {
                            $('.registerPage').hide();
                        }
                    });
                },
                btn2:function (index,layero) {
                }
            })
      break;
    };
}
  });
});
