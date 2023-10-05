var SEARCH = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.table = document.getElementById("myTable");
        CONFIG.input = document.getElementById("myInput");
        
        if(!CONFIG.table){
            return;
        }
        
        const myInput = document.getElementById("myInput");

        if(myInput){
            myInput.addEventListener("input", Searchbar);
        }
        
    }

    function Searchbar() {
        var td, i, txtValue;
        var filter = CONFIG.input.value.toUpperCase();
        var tr = CONFIG.table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[2];
            
            if (td) {
                txtValue = td.textContent || td.innerText;
                
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }       
        }
    }

    return {
        init: init,
    }
}());
