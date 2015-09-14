

function myJsbrigeGetOSVersion(){
        var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Platform_OS_Version"
    }
    window.coreJSBrige.creatMessageNoData(nativeServiceRequest,"registerTest",1)
}

//定位并且获取坐标
function myJsbrigeGetLocation()
{
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Location"
    }
    window.coreJSBrige.creatMessageNoData(nativeServiceRequest,"registerTest",1);
}

//数据删除
function myJsbrigeDeleteUser()
{
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DataService,
        serviceName:"Data_Delete"
    }
    var param = {
        objectName:"User",
        format:"account = 'eeeeeeee'"
    }
    window.coreJSBrige.creatMessage(nativeServiceRequest,param,"registerTest",1)
}

//数据更新
function myJsbrigeUpdateUser(){
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DataService,
        serviceName:"Data_Update"
    }
    var ob = {account:"bbbbbb"}
    var param = {
        objectName:"User",
        format:"account = 'eeeeeeef'",
        updateData:ob
    }
    window.coreJSBrige.creatMessage(nativeServiceRequest,param,"registerTest",1)
}

//网络状态查询
function myJsbrigeNetGetStatus(){
        var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.NetService,
        serviceName:"Net_Status"
    }
    window.coreJSBrige.creatMessageNoData(nativeServiceRequest,"registerTest2",1)
}
//数据查询测试
function getUser(){
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DataService,
        serviceName:"Data_Query"
    }
    var param = {objectName:"User"}
    window.coreJSBrige.creatMessage(nativeServiceRequest,param,"registerTest",1)
}
//获取系统版本信息
function myJsbrigeGetOSInfo(){
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Platform_OS_Version"
    };
    window.coreJSBrige.creatMessageNoData(nativeServiceRequest,"registerTest",1);
}
//测试Ui创建
function myJsbrigeUICreat()
{
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.UIService,
        serviceName:"UI_Create_AC"
    }
    var param = {url:"localpage://app/person.html"}
    window.coreJSBrige.creatMessage(nativeServiceRequest,param,"registerTest",1)
}
//数据查询测试，UI载入弹出测试、数据添加测试
function myJsbrigeDataQuery()
{
    var account = document.getElementById('account').value;
    var password = document.getElementById('password').value;
    if(account && password)
    {
        var param = {account:account,password:password};
        

        var nativeServiceRequest =
        {
            serviceType:nativeFunctionType.DataService,
            serviceName:"Data_Login_Check"
        }
        window.coreJSBrige.creatMessage(nativeServiceRequest,param,"registerTest",1)
    }else
    {
        alert("用户名或密码不能为空");
    }
}
//测试UI载入图标弹出测试
function myJsbrigeLoadingShow()
{
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.UIService,
        serviceName:"UI_ShowLoading"
    };
    window.coreJSBrige.creatMessageOnlyService(nativeServiceRequest);  
}
//获得手机的系统信息
function myJsbrigePhoneInfo(){
    var nativeServiceRequest = 
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Platform_Info"
    };
    window.coreJSBrige.creatMessageNoData(nativeServiceRequest,"registerTest",1);
}

//调用手机震动
function myJsbrigeShake(){
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Shake"
    };
    window.coreJSBrige.creatMessageOnlyService(nativeServiceRequest);
}
//调用前置摄像头
function myJsbrigeFrontCamera(){
    var param = {CameraDeviceFront:"1"};
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Camera"
    };
    window.coreJSBrige.creatMessage(nativeServiceRequest,param,"registerTest",1);
}
//相机调用测试
function myJsbrigeLink1()
{
    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Camera"
    };
    window.coreJSBrige.creatMessageNoData(nativeServiceRequest,"registerTest",1);
}
//调用系统相册
function myJsbrigeLink()
{

    var nativeServiceRequest =
    {
        serviceType:nativeFunctionType.DeviceService,
        serviceName:"Device_Photo_Select"
    };
    window.coreJSBrige.creatMessageNoData(nativeServiceRequest,"registerTest",1);
    
}
function back(url){
    
}

var registerTestFun = function returnFunction(bs)
{
    alert(bs);
    return "bcdddddddd";
};
var netStatus = function netfunction(statusInt)
{
    var netStatus = JSON.parse(statusInt);
    if(netStatus == "0"){
        alert("无网络");
    }
    if(netStatus == "1"){
        alert("手机网络");
    }
    if(netStatus == "2"){
        alert("wifi状态");
    }
};
window.coreJSBrige.registerJsService("registerTest",registerTestFun);
window.coreJSBrige.registerJsService("registerTest2",netStatus);