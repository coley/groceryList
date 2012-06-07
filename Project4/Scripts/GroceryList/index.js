(function ($) {
    $(document).ready(function () {

        $(".delete").click(function (e) {
            e.preventDefault();

            var delete_btn = $(this);
            var item_id = $(this).parent().parent().attr("id");
            var item_table = $("table");
            var item_count = item_table.attr("id");

            $.get("/GroceryList/Delete/" + item_id, function (response) {
                //the first parent is the td and the 2nd parent is the tr
                if (response == 1) {
                    delete_btn.parent().parent().remove();

                    //Calculate total items
                    var new_item_count = item_count - 1;

                    //If new item count is 0, remove item table, else update id attribute of item table
                    if (new_item_count == 0) {
                        item_table.remove();
                    } else {
                        item_table.attr("id", new_item_count);
                    }

                } else {
                    alert("Error: item could not be deleted");
                }
            });
        })
    })
})(jQuery)