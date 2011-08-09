$(function() {
    $("#feed_table th a, #feed_table .pagination a").live("click", function(){
        $.getScript(this.href);
        return false;
    });
    $("#feed_table_search submit").keyup(function(){
       $.get(this.action, $(this).serialize(), null, "script");
        return false;
    });
});

//$("#feed_table_search input").keyup(function(){
//       $.get($("#feed_table_search").attr("action"), $("#feed_table_search").serialize(), null, "script");
//        return false;
//    });
