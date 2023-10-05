var HIDENOTIFICATION={init:function(){$(function(){setTimeout(function(){$("#hideNotification").fadeOut(1500)},2e3)})}};
var UPDATEPFIELD=function(){const e={};function t(t){"deleteContentBackward"!==t.inputType?e.text.innerHTML=e.input.value+"."+e.firstName+"."+e.lastName+".nxtmediatech.eu":e.text.innerHTML=""}return{init:function(){e.input=document.getElementById("recordName"),e.text=document.getElementById("recordExample"),e.input&&(e.firstName=e.text.getAttribute("data-Name"),e.lastName=e.text.getAttribute("data-LastName"),e.input.addEventListener("input",t))}}}();
var PAGEREFRESH=function(){const n={};return{init:function(){if(n.buttons=document.querySelectorAll("[data-refresh-page]"),0!==n.buttons.length)for(var t=0;t<n.buttons.length;t++)n.buttons[t].addEventListener("click",function(){location.reload()})}}}();


var BTNACTIVE=function(){const t={};function n(){t.input.value.length?t.saveButton.disabled=!1:t.saveButton.disabled=!0}return{init:function(){t.input=document.getElementById("recordName"),t.saveButton=document.getElementById("saveButton"),t.input&&t.saveButton&&t.input.addEventListener("input",n)}}}();
var FORMTXTCNAME=function(){const e={};function t(e){"TXT"==e||"CNAME"==e?(document.getElementById("textField").style.display="inline-grid",document.getElementById("labelTextField").style.display="block"):(document.getElementById("textField").style.display="none",document.getElementById("labelTextField").style.display="none")}return{init:function(){e.selectedValue=document.getElementById("dropdown"),e.selectedValue&&(t(e.selectedValue),document.getElementById("dropdown").addEventListener("change",function(){t(this.value)}))}}}();
var FORMEDITTXTCNAME=function(){const n={};function t(){var e=document.getElementById("editlabelTextField"),t=document.getElementById("edittextField");"TXT"===n.inputBox.value||"CNAME"===n.inputBox.value?(e.style.display="block",t.style.display="inline-grid"):(e.style.display="none",t.style.display="none")}return{init:function(){n.inputBox=document.getElementById("recordType"),n.inputBox&&document.querySelectorAll(".editPen").forEach(function(e){e.addEventListener("click",t)})}}}();
var ACTIVEHEADER=function(){const r={};return{init:function(){if(r.navbar=document.getElementById("nav"),r.navbar){var a=$(".hamburger");const t=$(".nav_Menu"),n=$(".bar1"),e=$(".bar2"),c=$(".bar3");a.on("click",()=>{t.toggleClass("active"),n.toggleClass("active"),e.toggleClass("active"),c.toggleClass("active")})}}}}();
var ACTIVENAVBAR=function(){const n={};return{init:function(){n.navbar=document.getElementById("nav"),n.navbar&&document.addEventListener("DOMContentLoaded",function(){var t=window.location.href,e=document.querySelectorAll("#nav li a");for(let n=0;n<e.length;n++)e[n].href===t&&(e[n].classList.add("active"),e[n].classList.add("no-click"))})}}}();
var SEARCH=function(){const l={};function t(){for(var e,t=l.input.value.toUpperCase(),n=l.table.getElementsByTagName("tr"),a=0;a<n.length;a++)(e=n[a].getElementsByTagName("td")[2])&&(-1<(e.textContent||e.innerText).toUpperCase().indexOf(t)?n[a].style.display="":n[a].style.display="none")}return{init:function(){var e;l.table=document.getElementById("myTable"),l.input=document.getElementById("myInput"),l.table&&(e=document.getElementById("myInput"))&&e.addEventListener("input",t)}}}();
var SEARCHUSERS=function(){const i={};function t(){for(var e,t=i.input.value.toUpperCase(),n=i.table.getElementsByTagName("tr"),a=0;a<n.length;a++)(e=n[a].getElementsByTagName("td")[1])&&(-1<(e.textContent||e.innerText).toUpperCase().indexOf(t)?n[a].style.display="":n[a].style.display="none")}return{init:function(){var e;i.table=document.getElementById("userTable"),i.input=document.getElementById("inputSearch"),i.table&&(e=document.getElementById("inputSearch"))&&e.addEventListener("input",t)}}}();
$(function(){$("#checkbox_form, #deleteUsers_form").submit(function(e){e.preventDefault();e="checkbox_form"==this.id?"deleteRecord":"deleteUser";$.ajaxSetup({headers:{"X-CSRF-TOKEN":$('meta[name="csrf-token"]').attr("content")}}),$.ajax({type:"POST",url:e,data:new FormData(this),cache:!1,processData:!1,contentType:!1})})});
var LABELTEXT=function(){const t={};return{init:function(){t.dropdown=document.getElementById("dropdown"),t.label=document.getElementById("labelTextField"),t.dropdown&&document.addEventListener("DOMContentLoaded",function(){var n,e;n=t.dropdown,e=t.label,n.addEventListener("change",function(){"TXT"==n.value&&(e.innerText="Value"),"CNAME"==n.value&&(e.innerText="Destination")})})}}}();
var OPENFORM=function(){const t={};function o(e){e.preventDefault();var e=e.target.dataset.popup;e&&(e=document.querySelector(`.popup[data-popup="${e}"]`))&&(t.popups.forEach(e=>e.classList.remove("active")),e.classList.add("active"))}function r(e){e.preventDefault();var e=e.target.dataset.popup;e&&(e=document.querySelector(`.popup[data-popup="${e}"]`))&&e.classList.remove("active")}return{init:function(){t.triggers=document.querySelectorAll(".trigger"),t.popups=document.querySelectorAll(".popup"),t.close=document.querySelectorAll(".close"),t.triggers.forEach(e=>e.addEventListener("click",o)),t.close.forEach(e=>e.addEventListener("click",r))}}}();
var RECORDVALUES=function(){const e={};return{init:function(){e.images=document.querySelectorAll(".editPen"),e.images&&e.images.forEach(function(e){e.addEventListener("click",function(){var e=this.dataset.response;e=e,document.getElementById("idrecord").value=JSON.parse(e).record_id,document.getElementById("editName").value=JSON.parse(e).record_name,document.getElementById("recordType").value=JSON.parse(e).type,document.getElementById("edittextField").value=JSON.parse(e).content})})}}}();
var RECORDTABLE=function(){const d={};function e(){var e=d.sortByIndex.options[d.sortByIndex.selectedIndex].value;let n;"1"===e?n=2:"2"===e&&(n=3),d.rowsIndex=Array.from(d.rowsIndex).sort((e,t)=>{e=e.getElementsByTagName("td")[n].textContent,t=t.getElementsByTagName("td")[n].textContent;return e<t?-1:t<e?1:0}),d.tbodyIndex.innerHTML="";for(const t of d.rowsIndex)d.tbodyIndex.appendChild(t)}return{init:function(){d.tableRecords=document.getElementById("myTable"),d.tableRecords&&(d.tbodyIndex=d.tableRecords.getElementsByTagName("tbody")[0],d.rowsIndex=d.tbodyIndex.getElementsByTagName("tr"),d.sortByIndex=document.getElementById("sortBy"),d.sortByIndex.addEventListener("change",e))}}}();
var USERTABLE=function(){const o={};function t(){var t=o.sortBy.options[o.sortBy.selectedIndex].value;let n;var e=o.table1.getElementsByTagName("tbody")[0];let r=e.getElementsByTagName("tr");"1"===t?(n=1,r=Array.from(r).sort((t,e)=>{t=t.getElementsByTagName("td")[n].textContent,e=e.getElementsByTagName("td")[n].textContent;return t<e?-1:e<t?1:0})):"2"===t&&(n=3,r=Array.from(r).sort((t,e)=>{t=parseInt(t.getElementsByTagName("td")[n].textContent);return parseInt(e.getElementsByTagName("td")[n].textContent)-t})),e.innerHTML="";for(const a of r)e.appendChild(a)}return{init:function(){o.table1=document.getElementById("userTable"),o.table1&&(o.sortBy=document.getElementById("userSortBy"),o.sortBy.addEventListener("change",t))}}}();
var HELPPAGE=function(){const t={};return{init:function(){t.listItems=document.querySelectorAll("li[data-help]"),t.listItems&&t.listItems.forEach(t=>{t.addEventListener("click",t=>{t=t.currentTarget.getAttribute("data-help");const e=document.querySelector(`div[data-help="${t}"]`);e.style.display="block",document.querySelectorAll("div[data-help]").forEach(t=>{t!==e&&(t.style.display="none")})})})}}}();
USERTABLE.init(),RECORDTABLE.init(),UPDATEPFIELD.init(),BTNACTIVE.init(),SEARCH.init(),ACTIVENAVBAR.init(),ACTIVEHEADER.init(),HIDENOTIFICATION.init(),RECORDVALUES.init(),FORMTXTCNAME.init(),FORMEDITTXTCNAME.init(),OPENFORM.init(),LABELTEXT.init(),HELPPAGE.init(),SEARCHUSERS.init(),PAGEREFRESH.init();