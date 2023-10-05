var HELPPAGE = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.listItems = document.querySelectorAll('li[data-help]');

        if(!CONFIG.listItems){
            return;
        }

        setHelpPage();
    }

    function setHelpPage() {
        CONFIG.listItems.forEach(x => {
            x.addEventListener('click', event => {
                const helpId = event.currentTarget.getAttribute('data-help');
                const helpDiv = document.querySelector(`div[data-help="${helpId}"]`);
                
                helpDiv.style.display = 'block';

                document.querySelectorAll('div[data-help]').forEach(div => {
                    if (div !== helpDiv) {
                        div.style.display = 'none';
                    }
                });
            });
        });
    }
    

    return {
        init: init,
    }
}());