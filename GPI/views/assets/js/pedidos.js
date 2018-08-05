$('.btn').click(function(){
$(this).parents('.row').find('.first-block').toggleClass('col-md-2 col-md-1');
$(this).parents('.row').find('.last-block').toggleClass('col-md-8 col-md-9');
})