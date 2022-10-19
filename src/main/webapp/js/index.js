$().ready(function(){
   
   load();
    sed();
});
layui.use(['layer'],function () {
            var layer = layui.layer;
        })
        $(function () {
            // 页面初始化生成验证码
            window.onload = createCode('#loginCode');
            // 验证码切换
            $('#loginCode').click(function () {
                createCode('#loginCode');
            });
            // 登陆事件
            $('#loginBtn').click(function () {
                login();
            });
            // 注册事件
            $('#loginRegister').click(function () {
                register();
            });
        });
        // 生成验证码
        function createCode(codeID) {
            var code = "";
            // 验证码长度
            var codeLength = 4;
            // 验证码dom元素
            var checkCode = $(codeID);
            // 验证码随机数
            var random = [0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',
                'S','T','U','V','W','X','Y','Z'];
            for (var i = 0;i < codeLength; i++){
                // 随机数索引
                var index = Math.floor(Math.random()*36);
                code += random[index];
            }
            // 将生成的随机验证码赋值
            checkCode.val(code);
        }
        // 校验验证码、用户名、密码
        function validateCode(inputID,codeID) {
            var inputCode = $(inputID).val().toUpperCase();
            var cardCode = $(codeID).val();
            var loginUsername = $('#loginUsername').val();
            var loginPassword = $('#loginPassword').val();
            if ($.trim(loginUsername) == '' || $.trim(loginUsername).length<=0){
                layer.alert("用户名不能为空");
                return false;
            }
            if ($.trim(loginPassword) == '' || $.trim(loginPassword).length<=0){
                layer.alert("密码不能为空");
                return false;
            }
            if (inputCode.length<=0){
                layer.alert("验证码不能为空");
                return false;
            }
            if (inputCode != cardCode){
                layer.alert("请输入正确验证码");
                return false;
            }
            return true;
        }
        // 登录流程
        function login() {
            if (!validateCode('#loginCard','#loginCode')){
                //阻断提示
            }else {
                var loginUsername = $('#loginUsername').val();
                var loginPassword = $('#loginPassword').val();
			    var loginType = $('#roleSelect').val();
                var loginLoadIndex = layer.load(2);
                $('#loginBtn').val("正在登录...");
                $.ajax({
                    type:'post',
                    url:'http://localhost:8080/loginto',
                    dataType:'html',
                    data:{
							'loginUsername':loginUsername,
							'loginPassword':loginPassword,
							'loginType':loginType
						},
                    success:function (data) {
                        layer.close(loginLoadIndex);
                        var jsonData = JSON.parse(data);
                        if (jsonData[0] == 200 && jsonData[1] == 0){
							alert("登录成功");
							window.location.href ='../teacherpage/teacher.jsp';
							
                        }else if(jsonData[0] == 200 && jsonData[1] == 1){
							alert("登录成功");
							window.location.href ='../studentpage/student.jsp';
						}else{
							alert("登录失败，检查用户名密码");
	 						layer.close(loginLoadIndex);
                        	$('#loginBtn').val("登录");
						}
                    },
                    error:function () {
                        layer.close(loginLoadIndex);
                        $('#loginBtn').val("登录");
                    }
                });
            }

        }
        function sed() {
            $.ajax({
                type:'post',
                url:'http://localhost:8080/listgrade',
                dataType:'html',
                data:{},
                success:function (data) {
                    var jsonData = JSON.parse(data);
                    var parknames =[];
                    for(var i = 0; i < jsonData.length; i++){
                        parknames.push('<option value="'+i+'">'+jsonData[i]+'</option>');
                    }
                    //parknames.push('<option value="'+jsonData.length+'">'+暂无+'</option>');
                    $("#roleSelectsgade").html(parknames.join(' '));
                },
                error:function () {
                    alert("获取失败");
                }
            });
        }
		function load(){
			 $.ajax({
                    type:'post',
                    url:'http://localhost:8080/list',
                    dataType:'html',
                    data:{},
                    success:function (data) {
                        var jsonData = JSON.parse(data);
						var parknames =[];
						for(var i = 0; i < jsonData.length; i++){
							parknames.push('<option value="'+i+'">'+jsonData[i]+'</option>'); 
						}
						//parknames.push('<option value="'+jsonData.length+'">'+暂无+'</option>'); 
						 $("#roleSelectclass").html(parknames.join(' '));
                    },
                    error:function () {
                       alert("获取失败");
                    }
                });






		}
		
        // 注册流程
        function register() {
            layer.open({
                type:'1',
                content:$('.registerPage'),
                title:'注册',
                area:['430px','400px'],
                btn:['注册','重置','取消'],
                closeBtn:0,
                btn1:function (index,layero) {
                    //注册回调
                    layer.close(index);
                    var registerUsername = $('#registerUsername').val();
					var registerName = $('#registerNname').val();
					var registerPhone = $('#registerPhone').val();
					var selectType = $('#roleSelectType option:selected').val();
					var selectClass= $('#roleSelectclass option:selected').text();
					var selectGrden = $('#roleSelectsgade option:selected').text();
                    var registerPassword = $('#registerPassword').val();
                    var registerWellPassword = $('#registerWellPassword').val();
                    if(registerUsername == "" || registerName == "" || registerPassword == "" || registerWellPassword == ""){
						alert("必填信息不能为空,注册失败！");
						$('.registerPage').hide();
						return;
					}
					if(registerPhone.length != 11){
						alert("手机号格式错误,注册失败！");
						$('.registerPage').hide();
						return;
					}
					if(registerPassword.length < 8){
						alert("密码长度需大于8位,注册失败！");
						$('.registerPage').hide();
						return;
					}
					if(registerPassword != registerWellPassword){
						alert("两次密码不一致,注册失败！");
						$('.registerPage').hide();
						return;
					}
                    var registerLoadIndex = layer.load(2);
                    $.ajax({
                        type:'post',
                        url:'http://localhost:8080/user/adduser.do',
                        dataType:'html',
                        data:{
								'registerUsername': registerUsername,
								'registerNname': registerName,
								'registerPhone': registerPhone,
								'selectType':selectType,
								'selectClass': selectClass,
								'selectGrden': selectGrden,
								'registerPassword': registerPassword
						     },
                        success:function (data) {
	 						layer.close(registerLoadIndex);
							var jsonData = JSON.parse(data);
                            //layer.msg(data);
							if(jsonData[0] == 200){
								if(jsonData[1] == 0){
									alert("教师用户注册成功");
									$('.registerPage').hide();
								}else if(jsonData[1] == 1){
									alert("学生用户注册成功");
									$('.registerPage').hide();
								}
							}else{
								alert("用户已存在，请重新注册!");
								$('.registerPage').hide();
								return false;
							}
                        },
                        error:function () {
                            layer.close(registerLoadIndex);
                            layer.alert("请求超时，用户名已注册");
                            $('.registerPage').hide();
                        }
                    });
                },
                btn2:function (index,layero) {
                    //重置回调
                    var registerUsername = $('#registerUsername').val("");
                    var registerPassword = $('#registerPassword').val("");
                    var registerWellPassword = $('#registerWellPassword').val("");
                    // 防止注册页面关闭
                   
                    return false;
                },
                btn3:function (index,layero) {
                    //取消回调
                    $('.registerPage').hide();
                }
            })
        }