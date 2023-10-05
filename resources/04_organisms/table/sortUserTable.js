var USERTABLE = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.table1 = document.getElementById("userTable");

        if(!CONFIG.table1){
            return;
        }

        CONFIG.sortBy = document.getElementById("userSortBy");
        CONFIG.sortBy.addEventListener("change", sortTable);
    }
    function sortTable() {
        const selectedOption = CONFIG.sortBy.options[CONFIG.sortBy.selectedIndex].value;
        let col;
        const tbody = CONFIG.table1.getElementsByTagName("tbody")[0];
        let rows = tbody.getElementsByTagName("tr");

        if (selectedOption === "1") {
            col = 1;
            
            rows = Array.from(rows).sort((a, b) => {
                const valueA = a.getElementsByTagName("td")[col].textContent;
                const valueB = b.getElementsByTagName("td")[col].textContent;

                if (valueA < valueB) {
                    return -1;
                } else if (valueA > valueB) {
                    return 1;
                }
                    return 0;
            });
        } else if (selectedOption === "2") {
            col = 3;
            
            rows = Array.from(rows).sort((a, b) => {
                const valueA = parseInt(a.getElementsByTagName("td")[col].textContent);
                const valueB = parseInt(b.getElementsByTagName("td")[col].textContent);
                return valueB - valueA;
            });
        }
    
        tbody.innerHTML = "";
    
        for (const row of rows) {
            tbody.appendChild(row);
        }
    }
    
    return {
        init: init,
    }
}());