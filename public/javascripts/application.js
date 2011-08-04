$(function() {
    $("#feed_table th a").live("click", function(){
        $.getScript(this.href);
        return false;
    })
});
