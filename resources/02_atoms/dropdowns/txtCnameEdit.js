
// function updateeditTextField() {
//     var selectedValueType = document.getElementById("recordType").value;
//     console.log(selectedValueType);
//     if (selectedValueType == "TXT" || selectedValueType == "CNAME") {
//         document.getElementById("edittextField").style.display = "inline-grid";
//         document.getElementById("editlabelTextField").style.display = "block";
//     } 
//     else {
//         document.getElementById("edittextField").style.display = "none";
//         document.getElementById("editlabelTextField").style.display = "none";
//     }
// }


// var FORMEDITTXTCNAME = (function() {
var FORMEDITTXTCNAME = (function() {
    const CONFIG = {};

    function init(){
        CONFIG.inputBox = document.getElementById("recordType");

        if(!CONFIG.inputBox){
            return;
        }
        
        var images = document.querySelectorAll(".editPen");
        
        images.forEach(function(image) {
            image.addEventListener("click", toggleTextField);
        });
    }
    function toggleTextField() {
        var textFieldLabel = document.getElementById("editlabelTextField");
        var textField = document.getElementById("edittextField");

        if (CONFIG.inputBox.value === "TXT" || CONFIG.inputBox.value === "CNAME") {
            textFieldLabel.style.display = "block";
            textField.style.display = "inline-grid";
        } else {
            textFieldLabel.style.display = "none";
            textField.style.display = "none";
        }
    }
    return {
        init: init,
    }
}());