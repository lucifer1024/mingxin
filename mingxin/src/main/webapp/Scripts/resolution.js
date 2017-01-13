
var winWidth = 0;
var winHeight = 0;
var sc=document.getElementById("skin");

function findDimensions() //函数：获取尺寸
{
	// 获取窗口宽度
	if (window.innerWidth)
		winWidth = window.innerWidth;
	else if ((document.body) && (document.body.clientWidth))
		winWidth = document.body.clientWidth;
	// 获取窗口高度
	if (window.innerHeight)
		winHeight = window.innerHeight;
	else if ((document.body) && (document.body.clientHeight))
		winHeight = document.body.clientHeight;
           
	// 通过深入Document内部对body进行检测，获取窗口大小
	if (document.documentElement  && document.documentElement.clientHeight && document.documentElement.clientWidth)
	{
        winHeight = document.documentElement.clientHeight;
        winWidth = document.documentElement.clientWidth;
	}
	//if((winWidth>=1024) && (winWidth<1280)){ 
	//		    sc.setAttribute("href","css/1024.css"); 
	//		    $(".video").height(300+"px");
	//		}else if((winWidth>=1280) && (winWidth<1366)){
	//		    sc.setAttribute("href","css/1280.css");
	//		    $(".video").height(372+"px");
	//		}else if((winWidth>=1366) && (winWidth<1440)){
	//		    sc.setAttribute("href","css/1366.css");
	//		    $(".video").height(372+"px");
	//		}else if((winWidth>=1440) && (winWidth<1600)){
	//		    sc.setAttribute("href","css/1440.css");
	//		    $(".video").height(414+"px");
	//		}else if((winWidth>=1600) && (winWidth<1920)){
	//		    sc.setAttribute("href","css/1600.css");
	//		    $(".video").height(452+"px");
	//		}else if(winWidth>=1920){
	//		    sc.setAttribute("href","css/1920.css");
	//		    $(".video").height(540+"px");
	//		}else{
	//		   sc.setAttribute("href","css/1024.css");	
	//		   $(".video").height(300+"px");
	//		}
			
			
		
  	
}




//findDimensions();  
//
//// 调用函数，获取数值
//window.onresize=function(){
//	findDimensions();
//	
//}

$(function () {
    //findDimensions();

    $(window).load(function () {
        //setTimeout(resize,100); //延迟100毫秒，否则，屏幕下面可能会出现黑条
        setTimeout(function () { 
            resize(1); 
            //$("#MySplitter").splitter({
            //    type: "h", 
            //    sizeTop: true,	/* use height set in stylesheet */
            //    //resizeTo: window,
            //    accessKey: "P"
            //    });
            if ($("#hfIsDiffPubliAndPrivateChatArea").val() == "True")
            {
                SetSplitter();
            }
        }, 100); //延迟100毫秒，否则，屏幕下面可能会出现黑条
    });
    $(window).resize(function () {
        resize(0);
    });

});

function SetSplitter()
{
    $("#MySplitter").splitter({
        type: "h",
        outline: false,
        sizeBottom: $("#divMyChat").height(),
        minTop: 50,
        minBottom: 50,
        resizeToWidth: true,
        //dock: "top",
        //dockSpeed: 200,
        cookie: "docksplitter",
        dockKey: 'Z',   // Alt-Shift-Z in FF/IE
        accessKey: 'I'  // Alt-Shift-I in FF/IE
    });
    //$("#divPublicChat").width($("#MySplitter").width());
    //$(".splitter-bar").width($("#MySplitter").width());
    //$("#divMyChat").width($("#MySplitter").width());
}

function resize(isStartup) {
   
    var windowHeight = $(window).height();
    
    var headerHeight = $('.t').outerHeight();
    
    var footerHeight = 0;
    if ($('#divForeignProductPrice').length>0)
    {
        footerHeight = $('#divForeignProductPrice').outerHeight();
    }    
    var $main = $('.l-links');
    
    var mainHeight = windowHeight - headerHeight - footerHeight - 40; //中间主体高度
    
    //if (isStartup == 0) {
    if (mainHeight <= $("#divVideo").height() + 150) {
            //return;
        mainHeight = $("#divVideo").height() + 150;
        }
    //}
    
    $main.height(mainHeight + 37); //设置主体高度
    $(".chat-box").height(mainHeight);
   
    
    //$(".mcenter").height(mainHeight); //设置主体高度
    //$(".m_right").height(mainHeight); //设置主体高度

    ////$(".editorBox").width($("#divMessageInput").width() - $(".btnBox").width());


    ///行情
    //$("#divMarketTrendContent").height($(".chat-box").height() - $("#divVideo").outerHeight() - $("#tab1").outerHeight());
    //$("#divMarketTrend").height($("#divMarketTrendContent").height());
    //$(".box1-in").height($("#divMarketTrendContent").height());
    //if ($("#divCannotViewMarketTrend").length > 0)
    //{
    //    $("#divCannotViewMarketTrend").height($(".box1-in").height() - 10);
    //}
    //if ($("#divCanViewMarket").length > 0) {
    //    $("#divCanViewMarket").height($(".box1-in").height() - 10);
    //}    
    //$(".marketsummarylist").height($("#divMarketTrendContent").height() - 65);
    ResizeHQArea();

    if ($(".guestMarquee").length > 0)
    {
        $(".guestMarquee").width($("#divMarketTrendGuestNotice").width() - 100);
    }

    //聊天
    var additionHeightWhenNoPrice = 10;
    //if ($('#divForeignProductPrice').length <= 0) {
    //    additionHeightWhenNoPrice = 10;
    //}
    $("#MySplitter").height(mainHeight - $(".chat-box-tip").outerHeight() - $("#divMessageInput").outerHeight() - additionHeightWhenNoPrice);
    $(".chat-box-group").height(mainHeight - $(".chat-box-tip").outerHeight() - $("#divMyChat").outerHeight() - $("#divMessageInput").outerHeight() - additionHeightWhenNoPrice);
    $(".chat-box-group-in").height($(".chat-box-group").height());

    //在线用户
    $("#divUserOnlineOuter").height(mainHeight);
    $(".chat-contact-list").height(mainHeight - $(".search1").outerHeight() - $("#divUserOnlineHead").outerHeight());
    $("#dlUserList").height($(".chat-contact-list").height());
    //if ($("#divVideoCoverLive4Gensee").length > 0) {
    //    $(".hq_tip_w").height($(".hq_tip_w").height() - 25);
    //}
    //$(".hq_tip_con").height($(".hq_tip_w").height()  - $(".hq_tip").height());
    //$(".hq_tip_list").height($(".hq_tip_con").height() - 8);
    //var height4ShowOperation4MarketTrend = 0;
    //if ($("#divShowOperation4MarketTrend").length>0)
    //{
    //    height4ShowOperation4MarketTrend = 23;
    //}
    //$("#scrollDiv4HQ").height($(".hq_tip_list").height() - height4ShowOperation4MarketTrend);
    //var hqSummaryHead = 24; //姓名，喊单等
    //$(".hq_tip_scroll").height($(".hq_tip_list").height() - hqSummaryHead * 2);
    ////微信图标
    //if ($("#liSubscribeWeChat").length > 0) //如果显示关注微信
    //{
    //    $("#divWeChat").css("top", $("#liSubscribeWeChat").position().top - 25 + "px");
    //}

    
    //////中间
    //var messageInputHeight = 114;//$("#divMessageInput").height();        
    //var myChatMessageHeight = 0;
    //var addQuestionTipHeight = 0;
    //var centerHeadHeight = $(".mc_header_w").height();
    
    //$(".mc_show_d").height(mainHeight - centerHeadHeight - messageInputHeight - 32);
    //var height4MyChat = 0;
    //if ($(".mc_top2_con_w").length > 0)
    //{
    //    height4MyChat = $(".mc_top2_con_w").height();
    //}
    //else
    //{
    //    height4MyChat = -8; //不显示私聊区域时，那个间隔线条也不要显示，所以要增加几个像素的高度
    //}

    //$(".mc_show_scroll_w").height($(".mc_show_d").height() - height4MyChat - 5);

    //$("#chatMessageDiv").height($(".mc_show_scroll_w").height());
    ////$("#chatMessageDiv").height($(".mc_show_scroll_w").height());
    ////$("#mcshow").mCustomScrollbar('update');
    //$("#chatMessageUL").height($(".mc_show_scroll_w").height());

    //////右边
    ////$(".duokong").height(messageInputHeight);
    ////$(".m_r_t2").height(93);
    //var priceHeight = 0;
    //if ($("#divForeignProductPrice").length > 0)
    //{
    //    priceHeight = $(".m_r_t2").height();
    //}
    //else
    //{
    //    priceHeight = -5;
    //}
    
    ////$(".online_list").height(mainHeight - $(".search_d").height() - $("#tabs4OnlineUser").height() - priceHeight - $(".m_r_bottom").height() - 44);
    //$(".online_list").height(mainHeight - $(".search_d").height() - $("#tabs4OnlineUser").height() - priceHeight - $(".m_r_bottom").height() - 13);
    //$("#dlUserList").mCustomScrollbar('update');
    //if (("#dlRelatedUserList").length > 0)
    //{
    //    $("#dlRelatedUserList").mCustomScrollbar('update');
    //}
    //var leftValue4QRCode = $(".m_right").position().left;
    //var topValue4QRCode = $(".m_r_bottom").position().top + 62;
    //$(".qrcode").attr("style", "left:" + leftValue4QRCode + "px; top:" + topValue4QRCode + "px;position:absolute;z-index:99999;");
    
}


function ResizeHQArea() {
    var additionHeightWhenNoPrice = 0;
    if ($('#divForeignProductPrice').length <= 0) {
        additionHeightWhenNoPrice = 5;
    }
    $("#divMarketTrendContent").height($(".chat-box").height() - $("#divVideo").outerHeight() - $("#tab1").outerHeight() - additionHeightWhenNoPrice);
    $("#divMarketTrend").height($("#divMarketTrendContent").height());
    $(".box1-in").height($("#divMarketTrendContent").height());
    if ($("#divCannotViewMarketTrend").length > 0) {
        $("#divCannotViewMarketTrend").height($(".box1-in").height() - 10);
    }
    if ($("#divCanViewMarket").length > 0) {
        $("#divCanViewMarket").height($(".box1-in").height() - 10);
    }
    $(".marketsummarylist").height($("#divMarketTrendContent").height() - 65);
}