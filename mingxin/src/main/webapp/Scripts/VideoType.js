var videoType4YY = "YY";
var videoType4Gensee = "Gensee";
var videoType4Owner = "Owner";
var noVideoTip = "<span style='font-size:2rem;color:white;'><br/><br/><br/><br/>当前无直播</span>";
function closeVideo(){
//	 $("#VideoDiv").html(noVideoTip);
	LoadYYVideo("", "");
}
function ChangeVideoType4Room(d) {
    if (d == videoType4YY) {
        var e = $("#hfVideoNO").val();
        var b = $("#hfSubVideoNO").val();
        LoadYYVideo(e, b)
    } else {
        if (d == videoType4Gensee) {
            var c = $("#hfVideoNO").val();
            var a = $("#hfSubVideoNO").val();
            LoadGenseeVideo(c, a)
        } else {
            LoadMyVideo()
        }
    }
}
function ChangeVideoType4RoomInMobile(f, e) {
    if (f == videoType4YY) {
        var g = 0;
        var d = "";
        if (IsApple()) {
            if (false == IsIphone4()) {
                if (e.length > 0) {
                    if (IsWechatBrowser()) {
                        g = 270
                    } else {
                        g = 230
                    }
                    if (IsIpad()) {
                        g = $(window).width() * 0.75
                    }
                    var b = $(window).width();
                    d = '<iframe width="' + b + '" height="' + g + '" style="margin-top:-50px;"  id="iframeVideo" frameborder="0" scrolling="no" src="http://www.zhiniu8.com/h5live?uid=' + e + '"></iframe>';
                    $("#VideoDiv").html(d)
                } else {
                    $("#VideoDiv").html(noVideoTip)
                }
            } else {
                if (false == $("#divPopVideo4Android").is(":hidden")) {
                    if (e.length > 0) {
                        g = 260;
                        var b = $(window).width() - 18;
                        var d = '<iframe width="' + b + '" height="' + g + '"  id="iframeVideo"   frameborder="0" scrolling="no" src="http://www.zhiniu8.com/h5live?uid=' + e + '"></iframe>';
                        $("#divVideo4Android").html(d)
                    } else {
                        $("#divVideo4Android").html(noVideoTip)
                    }
                }
            }
        } else {
            if (false == $("#divPopVideo4Android").is(":hidden")) {
                if (e.length > 0) {
                    g = 260 * $(window).height() / 477;
                    var d = '<iframe width="100%" height="' + g + '"  id="iframeVideo" frameborder="0" scrolling="no" src="http://www.zhiniu8.com/h5live?uid=' + e + '"></iframe>';
                    $("#divVideo4Android").html(d)
                } else {
                    $("#divVideo4Android").html(noVideoTip)
                }
            }
        }
    } else {
        if (f == videoType4Gensee) {
            var c = $("#hfVideoNO").val();
            var a = $("#hfSubVideoNO").val();
            LoadGenseeVideo(c, a)
        } else {
            LoadMyVideo()
        }
    }
}
function LoadYYVideo(f, c) {
//    var b = "http://yy.com/s/" + f + "/" + c + "/finscene.swf";
    var b = "http://yy.com/s/" + f + "/" + c + "/yyscene.swf";
    var d = '   <embed src="' + b + '" quality="high" width="100%"';
    d += ' height="100%" align="middle" allowscriptaccess="never" allowfullscreen="true"';
    d += '  mode="transparent" wmode="transparent" bgcolor="#000000"  t="live"type="application/x-shockwave-flash"></embed>';
    var a = ' <object type="application/x-shockwave-flash" id="i_Live_Player" name="i_Live_Player" t="live" align="middle" data="' + b + '" ';
    a += ' width="100%" height="100%" style="visibility: visible; ">';
    a += ' <param name="quality" value="high">';
    a += '<param name="wmode" value="transparent">';
    a += '<param name="bgcolor" value="#000000">';
    a += '<param name="allowscriptaccess" value="sameDomain">';
    a += '<param name="allowfullscreen" value="true">';
    a += "</object>";
    try {
        $("#VideoDiv").html(d)
    } catch(e) {
        try {
            $("#VideoDiv").html(a)
        } catch(e) {
            alert(e)
        }
    }
    $("#hfVideoNO").val(f);
    $("#hfSubVideoNO").val(c)
}
function LoadGenseeVideo(b, a) {
    var c = '<gs:video-live id="videoComponent" site="' + b + '"  ownerid="' + a + '"  />';
    try {
        $("#VideoDiv").html(c)
    } catch(d) {
        alert(d)
    }
    $("#hfVideoNO").val(b);
    $("#hfSubVideoNO").val(a)
}
function LoadMyVideo() {};