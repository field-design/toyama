function PartsApi() {
    this.addParts = function(type, add_container_selector, after_add_parts_callback){
        $.ajax({
            type: "POST",
            async: false,
            url: location.pathname,
            data: { 'addtype' : type, 'count' : $(add_container_selector).children().length, 'container_option' : $(add_container_selector).attr('data-option') },
            success: function(response){
                $(add_container_selector).append(response);
                if(after_add_parts_callback) {
                    after_add_parts_callback();
                }
            }
        });
    }
}