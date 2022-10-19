layui.use(['table', 'dropdown'], function () {
	var table = layui.table
		, $ = layui.$
		, laytpl = layui.laytpl
		, dropdown = layui.dropdown
    page();

    function page() {
        $.ajax({
            url: 'http://localhost:8080/user/getCount',
            dataType: 'json',
            type: 'get',
            async: false,
            success: function (data) {
                console.log(data.count)
                count = data.count;
            }
        });
    }

    table.render({
		elem: '#test'  //绑定table id
        , url: 'http://localhost:8080/user/getStu' //改地址是访问地址
		, cellMinWidth: 80
		, toolbar: '#toolbarDemo'
		, defaultToolbar: ['filter', 'exports', 'print', {
			title: '帮助'
			, layEvent: 'LAYTABLE_TIPS'
			, icon: 'layui-icon-tips'
		}]

		, cols: [[ //表头
            {type: 'checkbox', fixed: 'left'}
            , {field: 'susername', title: '学号', width: 100, sort: true}
            , {field: 'sname', title: '姓名', width: 100}
            , {field: 'phone', title: '电话号码', width: 200, sort: true}
            , {field: 'classname', title: '班级', width: 150, sort: true}
            , {
                field: 'grade', title: '年级', width: 150, sort: true
            }
            , {field: 'password', title: '密码', width: 150, sort: true}

            , {field: 'right', title: '操作', width: 150, toolbar: '#barDemo'}

        ]]
        , page: true
        , limit: 10
        , limits: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100]  //数据分页条
		, id: 'testReload'
        , response: {
            statusName: 'status' //规定数据状态的字段名称，默认：code
            , dataName: 'rows' //规定数据列表的字段名称，默认：data
        }
        , parseData: function (item) { //将原始数据解析成 table 组件所规定的数据
            return {
                "status": 0,   //解析接口状态
                "message": "成功",  //解析提示文本
                "count": count,       //解析数据长度
                "rows": item.data  //解析数据列表
            };
        }
		, error: function (res, msg) {
			console.log(res, msg)
		}
	});
	table.on('tool(tabletest)', function (obj) {
		var id = obj.data.username;
		$.ajax({
			type: 'post',
			url: 'http://localhost:8080//stray/admin/queryly.do',
			dataType: "json",
			data: {'username': id},
			traditional: true,
			success: function (data) {
				var str = '';
				for (var i = 0; i < data.length; i++) {
					str += "动物名:" + data[i][0] + "动物信息:" + data[i][1] + "领养时间:" + data[i][2] + "住址:" + obj.data.address + "<br><br>";
				}
				layer.alert(str);

			},
			error: function () {
				layer.alert("请求超时");
			}
		});
	});

	//工具栏事件
	table.on('toolbar(tabletest)', function (obj) {
		var config = obj.config;
		var checkStatus = table.checkStatus(config.id);
		switch (obj.event) {
			case 'getCheckData':
				var data = checkStatus.data;
				layer.alert(JSON.stringify(data));
				break;
			case 'getCheckLength':
				var data = checkStatus.data;
				layer.msg('选中了：' + data.length + ' 个');
				break;
			case 'getData':
				var getData = table.getData(obj.config.id);
				console.log(getData);
				layer.alert(JSON.stringify(getData));
				break;
			case 'isAll':
				layer.msg(checkStatus.isAll ? '全选' : '未全选')
				break;
			case 'LAYTABLE_TIPS':
				layer.alert(config.title || 'Table for layui-v' + layui.v);
				break;
			case 'sx':
				location.reload();
				break;
			case 'update':
				var data = checkStatus.data;
				if (data.length == 1) {
					layer.open({
						type: 1,
						skin: 'layui-layer-rim',
						area: ['40%', '50%'],
						btn: ['修改', '取消'],
						shadeClose: true,
						end: function (index, layero) {
							return false;
						},
						content: '<br><div class="layui-inline"><label class="layui-form-label">用户名:</label><div class="layui-input-inline"><input value = ' + data[0].username + ' class="layui-input" name="keyword" id="pusername"autocomplete="off"></div></div>' +
							'<br><div class="layui-inline"><label class="layui-form-label">姓名:</label><div class="layui-input-inline"><input value = ' + data[0].name + ' class="layui-input" name="keyword" id="pname"autocomplete="off"></div></div>' +
							'<br><div class="layui-inline"><label class="layui-form-label">手机号:</label><div class="layui-input-inline"><input value = ' + data[0].phone + ' class="layui-input" name="keyword" id="pphone"autocomplete="off"></div></div>' +
							'<br><div class="layui-inline"><label class="layui-form-label">住址:</label><div class="layui-input-inline"><input value = ' + data[0].address + ' class="layui-input" name="keyword" id="paddress"autocomplete="off"></div></div>' +
							'<br><div class="layui-inline"><label class="layui-form-label">性别:</label><div class="layui-input-inline"><select id="psexSelect" class="layui-select" name="roleSelect"><option value="0">男</option><option value="1">女</option></select></div></div>' +
							'<br><div class="layui-inline"><label class="layui-form-label">密码:</label><div class="layui-input-inline"><input value = ' + data[0].password + ' class="layui-input" name="keyword" id="ppassword"autocomplete="off"></div></div>'
						, btn1: function (index, layero) {
							var username = $('#pusername').val();
							var name = $('#pname').val();
							var phone = $('#pphone').val();
							var address = $('#paddress').val();
							var sex = $('#psexSelect').val();
							var password = $('#ppassword').val();
							// if(username == '' || name == '' || phone == '' || address == '' || password == ''){
							// 	layer.alert("提交信息未完成，不予提交");
							// 	return false;
							// }
							if (username == data[0].username && name == data[0].name && phone == data[0].phone && address == data[0].address && sex == data[0].sex && password == data[0].password) {
								layer.alert("保存成功");
								return;
							}
							$.ajax({
								type: 'post',
								url: 'http://localhost:8080//stray/admin/update.do',
								dataType: "json",
								data: {
									'username': username,
									'name': name,
									'phone': phone,
									'address': address,
									'sex': sex,
									'password': password
								},
								traditional: true,
								success: function (data) {
									if (data[0] == 200) {
										alert("修改成功");
										location.reload();
									} else {
										layer.alert("修改失败");
										return;
									}
								},
								error: function () {
									layer.alert("请求超时");
								}
							});
						},
						btn2: function (index, layero) {
							//取消回调
							$('.registerPage').hide();
						}
					});
				} else {
					layer.alert("一次只允许修改一个用户信息");
					return;
				}

				break;
		}
		;
	});

    $('#query').click(function () {
        var susername = $('#susername').val();
        var classname = $("#selectId option:selected").text();
        console.log(classname)
        table.reload('test', {
            url: 'http://localhost:8080/user/query.do'
            , methods: "get"
            , request: {
                pageName: 'page' //页码的参数名称，默认：page
            }
            , where: {
                susername: susername,
                classname: classname,
            }
            , page: {
                curr: 1
            }
        });
    })
});

function show_img(t) {
	var url = $(t).attr('src');
	var t = $(t).find("img");

	layer.open({
		type: 1,
		skin: 'layui-layer-rim',
		area: ['80%', '90%'],
		shadeClose: true,
		end: function (index, layero) {
			return false;
		},

		content: '<div style="text-align:center"><img src="' + url + '" /></div>'
	});
}

layui.use('carousel', function () {
	var carousel = layui.carousel;

	//建造实例
	carousel.render({
		elem: '#test1'
		, index: 2
		//,full: true
		, arrow: 'always'
		//,interval: 5000
		//,autoplay: false
		//,indicator: 'outside'
		//,trigger: 'hover'
	});

	//事件
	carousel.on('change(test1)', function (res) {
		console.log(res)
	});

	carousel.render({
		elem: '#test2'
		, interval: 1800
		//,full: true
		, anim: 'fade'
		, height: '120px'
	});

	carousel.render({
		elem: '#test3'
		//,full: true
		, arrow: 'always'
		//,autoplay: false
		//,indicator: 'outside'
		//,trigger: 'hover'
		, anim: 'updown'
		//,full: true
	});

	carousel.render({
		elem: '#test4'
		, width: '100%'
		, height: '600px'
		, interval: 5000
	});
});