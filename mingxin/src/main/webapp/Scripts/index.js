
function closeSelectSkinWindow() {
    $("#divSelectSkin").hide();
    $("#divbg4Popup").hide()
}

function bandSkin()
{
    var skinId = $("#hfSkinId").val();
   
    $("#myskin").find("a").removeClass().addClass("s-skin-btn-n").html("使用");
    $("#" + skinId).removeClass().addClass("s-skin-btn-y").html("使用中");
}

$(function () {
    //var _wrap=$('ul.r_note');
    //var leftjl = $(".top_share").position().left + $(".top_share").outerWidth() + 20 + "px";
    //$("#myskin").css("left", leftjl);
    bandSkin();
   
    $("#myskin a").click(function () {
        
        //$("#myskin a").empty();
        //$(this).append("<span></span>");
        $("#skinFile").attr("href", "/skin/" + this.id + "/style.css?5");
        $("#hfSkinId").val(this.id);
        //$("#spnArtDialogJs").html('<link rel="stylesheet" href="/Scripts/artDialog/skins/' + this.id + '.css">');
        $.ajax({
            type: "post",
            url: basePath+'/Room/RoomManager?Method=ChangeSkin&RoomId=' + roomIdInSignalR + "&SkinId=" + this.id,
            data: '',
            beforeSend: function (XMLHttpRequest) {
                //ShowLoading();
            },
            success: function (data, textStatus) {
                if (data == "Ok") {
                    bandSkin();
                    closeSelectSkinWindow();
                }
                else if (data == "HAS_NO_AUTH") {
                    UserAlert("您没有操作权限");
                    return;
                }
                else if (data == "Error_Not_Login") {
                    UserAlert("您尚未登录或登录信息已过期，请先登录");
                    return;
                }
                else {
                    UserAlert(data);
                }
            },
            complete: function (XMLHttpRequest, textStatus) {
                //HideLoading();
            },
            error: function () {
                //请求出错处理
            }
	});
    })

	});



