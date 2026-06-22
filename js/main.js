// Azzurra Pet Shop — interações
(function(){
  // Menu mobile
  var toggle=document.querySelector('.nav-toggle');
  var links=document.querySelector('.nav-links');
  if(toggle&&links){
    toggle.addEventListener('click',function(){
      links.classList.toggle('open');
    });
    links.querySelectorAll('a').forEach(function(a){
      a.addEventListener('click',function(){links.classList.remove('open');});
    });
  }
  // FAQ accordion
  document.querySelectorAll('.faq-q').forEach(function(q){
    q.addEventListener('click',function(){
      q.parentElement.classList.toggle('open');
    });
  });
})();
