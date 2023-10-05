var RECORDTABLE = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.tableRecords = document.getElementById("myTable");

        if(!CONFIG.tableRecords){
            return;
        }

        CONFIG.tbodyIndex = CONFIG.tableRecords.getElementsByTagName("tbody")[0];
        CONFIG.rowsIndex = CONFIG.tbodyIndex.getElementsByTagName("tr");

        CONFIG.sortByIndex = document.getElementById("sortBy");
        CONFIG.sortByIndex.addEventListener("change", sortRecordTable);
    }
    
    function sortRecordTable() {
        const selectedOptionIndex = CONFIG.sortByIndex.options[CONFIG.sortByIndex.selectedIndex].value;
        let columnIndex;
            
        if(selectedOptionIndex === "1"){
            columnIndex = 2;
        }
        else if(selectedOptionIndex === "2"){
            columnIndex = 3;
        }

        CONFIG.rowsIndex = Array.from(CONFIG.rowsIndex).sort((a, b) => {
            const value1 = a.getElementsByTagName("td")[columnIndex].textContent;
            const value2 = b.getElementsByTagName("td")[columnIndex].textContent;
    
            if (value1 < value2) {
                return -1;
            } else if (value1 > value2) {
                return 1;
            }
                return 0;
            });

            CONFIG.tbodyIndex.innerHTML = "";
    
            for (const rowIndex of CONFIG.rowsIndex) {
                CONFIG.tbodyIndex.appendChild(rowIndex);
            }
    };
    
    return {
        init: init,
    }
}());