var OPENFORM = (function() {
  const CONFIG = {};

  function init(){      
      CONFIG.triggers = document.querySelectorAll('.trigger');
      CONFIG.popups = document.querySelectorAll('.popup');
      CONFIG.close = document.querySelectorAll('.close');

      CONFIG.triggers.forEach(trigger => trigger.addEventListener('click', onTriggerClicked));
      CONFIG.close.forEach(close => close.addEventListener('click', onCloseClicked));
  }
  
  function onTriggerClicked(e) {
    e.preventDefault();
    const trigger = e.target;
    const target = trigger.dataset.popup;
    
    if (!target) { return; } 
    
    const popup = document.querySelector(`.popup[data-popup="${target}"]`);
    
    if (!popup) { return; } 
  
    CONFIG.popups.forEach(p => p.classList.remove('active'));
    popup.classList.add('active');
  }
  
  function onCloseClicked(e) {
    e.preventDefault();
    const close = e.target;
    const target = close.dataset.popup;
    
    if (!target) { return; } 
    
    const popup = document.querySelector(`.popup[data-popup="${target}"]`);
    
    if (!popup) { return; } 
  
    popup.classList.remove('active');
  }

  return {
      init: init,
  }
}());