var HIDENOTIFICATION = (function() {
    function init(){
        $(function() {
            setTimeout(function() { $("#hideNotification").fadeOut(1500); }, 2000);
        })
    }
    
    return {
        init: init,
    }
}());

