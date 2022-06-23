$(function(){
	//GNB on 동작
	var p = location.pathname;
	$('.main-menu .dep2 > li').each(function(){
		var targetPath = $(this).attr('data-path');
		if(p.indexOf(targetPath) > -1){
			$(this).addClass('on').closest('.dep1').addClass('on');
		}
	})
	
	//GNB 토글 동작
	$('.main-menu .dep1 > span').click(function(){
		$(this).next('.sub-menu').slideToggle(400);
		$(this).parent().toggleClass('active');
	})
	
	//헤더 어드민 메뉴 동작
	$('.admin-menu').click(function(){
		$(this).toggleClass('active');
	})
	
	//custom select 공통 동작
	$('.custom-select .selected').click(function(){
		$(this).closest('.custom-select').toggleClass('active');
	})
	
	//팝업 기본 동작
	$('.popup-open').click(function(){ //팝업 열기
		var _popup = $(this).attr('href');
		$(_popup).show();
	});
	$('.popup-close').click(function(){ //팝업 닫기
		var _popup = $(this).closest('.popup-wrap');
		_popup.hide();
	})
})