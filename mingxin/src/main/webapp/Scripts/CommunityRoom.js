function SearchRoom()
{
    var searchCondition = $("#txtSearchRoomCondition").val();
    if (searchCondition.length<=0)
    {
        UserAlert("请先输入搜索条件");
        $("#txtSearchRoomCondition")[0].focus();
        return;
    }
    searchCondition = encodeURIComponent(searchCondition);
    window.location.href = "/Room/SearchRooms.aspx?SearchCondition=" + searchCondition;
}