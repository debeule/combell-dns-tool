var ACTIVEHEADER = (function() {
  const CONFIG = {};

  function init(){
      CONFIG.navbar = document.getElementById("nav");

      if(!CONFIG.navbar){
        return;
      }

      const hamburger =$(".hamburger");
      const navMenu = $(".nav_Menu");

      const barOne = $(".bar1");
      const barTwo = $(".bar2");
      const barThree = $(".bar3");

      hamburger.on("click", ()=>{
        navMenu.toggleClass("active");
        barOne.toggleClass("active");
        barTwo.toggleClass("active");
        barThree.toggleClass("active");
      });
  }
  return {
      init: init,
  }
}());