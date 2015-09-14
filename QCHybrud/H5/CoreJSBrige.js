var nativeFunctionType = {
    NetService : 440,
    DataService : 540,
    UIService : 940,
    DeviceService : 140
}
;(function() {
	if (window.coreJSBrige) 
	{
		return ;
	}else{
		//alert("sa");
	}

	var sendMessageQueue = []
	var recevieMessageQueue = []
	var jsServiceHandler = {}
	var requestPostIframe 
	var REQUEST_SCHAME = "corejsbrigescheme"+"://"
	var NO_PARAM = "NO_PARAM"
	var JSTranSponder = "JsTranSpond"

	/**
	 * [creatMessage description]
	 * @param  {nativeService对象}
	 * @param  {请求数据}
	 * @param  {回调}
	 * @return {空}
	 */
	function creatMessage (nativeService,data,callBack,isNeedCallBackData) 
	{
		var messageObject={
			request:nativeService,
			requestData:data,
			requestCallBack:callBack,
			requestIsCallBackData:isNeedCallBackData
		}
		window.coreJSBrige.sendMsgQueue.push(messageObject)
		window.coreJSBrige.dispatchSendMessage()
	}
	/**
	 * [creatMessageNoCallBack description]
	 * @param  {nativeService对象}
	 * @param  {请求数据}
	 * @return {空}
	 */
	function creatMessageNoCallBack (nativeService,data) 
	{
		return  creatMessage(nativeService,data,null)
	}

	function creatMessageNoData(nativeService,callBack,isNeedCallBackData)
	{
		return creatMessage(nativeService,null,callBack,isNeedCallBackData)
	}

	/**
	 * [creatMessageOnlyService description]
	 * @param  {nativeService对象}
	 * @return {空}
	 */
	function creatMessageOnlyService (nativeService) 
	{
		return creatMessage(nativeService,null,null)
	}
	/**
	 * [recevieMessage description]
	 * @param  {native请求}
	 * @return {空}
	 */
	function recevieMessage(nativeRequst)
	{
		if (nativeRequst.URL){
			window.coreJSBrige.recevieMsgQueue.push(nativeRequst)
		};
	}
	/**
	 * [sendMessageToNative description]
	 * @param  {请求url}
	 * @return {空}
	 */
	function sendMessageToNative(routerURl)
	{
		 requestPostIframe = document.createElement('iframe')
		 requestPostIframe.setAttribute("src",routerURl)
		 requestPostIframe.setAttribute("style","display:none:");
		 requestPostIframe.setAttribute("width","0px");
		 requestPostIframe.setAttribute("height","0px");
		 requestPostIframe.setAttribute("frameborder","0");
		 //document.body.appendChild(requestPostIframe);
		 document.documentElement.appendChild(requestPostIframe)
		 requestPostIframe.parentNode.removeChild(requestPostIframe)
		 requestPostIframe = null

		//window.JsTranSpond.transpondUrl(routerURl)
	}
	/**
	 * [registerJsService description]
	 * @param  {JsService名字}
	 * @param  {JsService回调}
	 * @return {bool}
	 */
	function registerJsService (serviceName,serviceHandler) 
	{
		if (serviceName!=null&&serviceHandler!=null) 
		{
			if (!window.coreJSBrige.serviceHandler[serviceName]) 
			{
				window.coreJSBrige.serviceHandler[serviceName] = serviceHandler
				return true
			};
			return false
		}else{
			return false
		}
	}
	/**
	 * [dispatchRecevieMessage 分发收到的native请求]
	 * @return {[bool]}
	 */
	function dispatchRecevieMessage()
	{
		if (window.coreJSBrige.recevieMsgQueue.length == 0) {
			return false
		};
		for (var i = 0; i < widow.coreJSBrige.recevieMsgQueue.length; i++) 
		{
			var message = window.coreJSBrige.recevieMsgQueue[i]

			if (message.func) 
			{
				if (message.datas && window.coreJSBrige.serviceHandler[message.func]) 
				{
					var f = window.coreJSBrige.serviceHandler[message.func]
					f(message.datas)
					return true
				}else{
					 var f = window.coreJSBrige.serviceHandler[message.func]
					 f()
					return true
				}
			}
			window.coreJSBrige.recevieMsgQueue.shift()	
		}
	}
	/**
	 * [dispatchSendMessage 分发收到的对native的请求]
	 * @return {[type]}
	 */
	function dispatchSendMessage()
	{
		if(window.coreJSBrige.sendMsgQueue.length == 0){
			return false
		}
		for (var i = 0; i < window.coreJSBrige.sendMsgQueue.length; i++) {
			var message = window.coreJSBrige.sendMsgQueue[i]
			var url = URLConstruct(
				message.request.serviceType,
				message.request.serviceName,
				message.requestCallBack,
				message.requestData,
				message.requestIsCallBackData)
			if (url) {
                window.coreJSBrige.sendMsgQueue.shift()
				sendMessageToNative(url)
			}
  
		};

	}
/**
 * [URLConstruct URL请求构造]
 * @param {[枚举]} requestServiceType [请求类型]
 * @param {[字符]} requsetServiceName [请求名]
 * @param {[JSON]} callBack           [回调]
 * @param {[JSON]} requsetData        [请求数据]
 */
	function URLConstruct(requestServiceType,requsetServiceName,callBack,requsetData,isNeedCallBackData)
	{
		var URL = REQUEST_SCHAME
		var callBackStr
		var requsetDataStr

		switch(requestServiceType){
			case nativeFunctionType.UIService:
				URL = URL + nativeFunctionType.UIService
			break;
			case nativeFunctionType.DataService:
				URL = URL + nativeFunctionType.DataService
			break;
			case nativeFunctionType.NetService:
				URL = URL + nativeFunctionType.NetService
			break;
			case nativeFunctionType.DeviceService:
				URL = URL + nativeFunctionType.DeviceService
			break;
			default:
				return false
		}
		if(requsetServiceName)
		{
			URL = URL + "/" + requsetServiceName			
		}else
		{
			return false
		}

		if(callBack){
			callBackStr = callBack
			URL = URL + "/" +callBackStr 
			if(isNeedCallBackData)
			{
				URL = URL + "/" + "1"
			}else
			{
				URL = URL + "/" + NO_PARAM
			}
		}else{
			URL = URL + "/" + NO_PARAM;
			URL = URL + "/" + NO_PARAM
		}

		if (requsetData){
			requsetDataStr = JSON.stringify(requsetData)
			URL = URL + "/" +requsetDataStr
		}else
		{
			URL = URL + "/" + NO_PARAM
		}
		return URL
	}
	

	function callJsService(serviceName,serviceData)
	{
		var func = window.coreJSBrige.serviceHandler[serviceName]
		if(serviceData && func)
		{
			func(serviceData)
		}else if(func)
		{
			func()
		}
	}

	function test()
	{
		alert("test");
	}

	/**
	 * [coreJSBrige coreJSBrige核心对象]
	 * @type {Object}
	 */
	window.coreJSBrige = {
		sendMsgQueue: sendMessageQueue,
		recevieMsgQueue: recevieMessageQueue,
		serviceHandler: jsServiceHandler,
		//funciton--------------------------
		dispatchRecevieMessage:dispatchRecevieMessage,
		dispatchSendMessage:dispatchSendMessage,
		registerJsService:registerJsService,
		sendMessageToNative:sendMessageToNative,
		creatMessage:creatMessage,
		creatMessageNoCallBack:creatMessageNoCallBack,
		creatMessageNoData:creatMessageNoData,
		creatMessageOnlyService:creatMessageOnlyService,
		registerJsService:registerJsService,
		callJsService:callJsService,
		test:test
	}
//  alert("注入结束")
    //window.coreJSBrige.registerJsService("registerTest",registerTestFun)
})();

//window.coreJSBrige.creatMessage(nativeService,"aaaa","bbbbb")

// var funCallBack = function(){
// 	alert("this is a test")
// };

// var registerAnswer = window.coreJSBrige.registerJsService("testService",funCallBack)
// if (registerAnswer) {
// 	window.coreJSBrige.callJsService("testService");
// };