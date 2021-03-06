<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common/header.jsp" />
<script type="text/javascript">
$(window).ready(function() {
    var desCont = $('.des_txt');
    var startP = parseInt($(".design_wr").css("margin-top")) * 3;
    var desImg = $('.design_wr');

    // design-right
    $.each(desCont, function(index, item) {
        var _this = $(this);
        var _thisOff = $(this).offset();
        $(window).scroll(function() {
            if ($(document).scrollTop() + startP > _thisOff.top && $(document).scrollTop() + startP < _thisOff.top + _this.height()) {
                desCont.removeClass('on');
                _this.addClass('on');
            } else if ($(document).scrollTop() + startP < desImg.offset().top) {
                desCont.removeClass('on');
            }
        });
    })

    // design-left img
        var fixController = new ScrollMagic.Controller();
        var fixImg = $('.des_img'),
            wH = $(window).height()/2,
            startFix = parseInt($(".design_wr").css("margin-top"));
        var imgBxHeigt = $('.design_wr').innerHeight();
        var yearScene = new ScrollMagic.Scene({ triggerElement: ".design_wr", offset: -startFix + wH, duration: imgBxHeigt - wH})
            .setPin('.des_img')
            .addIndicators({ name: "year" })
            .addTo(fixController);
    //
    // var desImgOff = desImg.offset();
    // $(window).scroll(function() {
    //     if ($(document).scrollTop() + startFix > desImgOff.top && $(document).scrollTop() + startFix < desImgOff.top + $('.des_l').height()) {
    //         desImg.find('.des_img').addClass('fixed');
    //         desImg.find('.fixed').css('top', startFix);
    //     } else if ($(document).scrollTop() + startFix < desImg.offset().top) {
    //         desImg.find('.des_img').removeClass('fixed');
    //     }
    // });

});
</script>
<div id="wrap" class="header_botm">
    <div class="product technology design">
        <div class="section01">
            <div class="cont_pagew">
                <div class="prod_nm align_center">
                    <div class="txt_nmb">
                        <span class="daelim_ico"><img src="/img/icon/daelim_ico.png" alt="icon"></span>
                        <span class="txt_eng">Bidet</span>
                    </div>
                    <div class="txt_main">DESIGN AWARD</div>
                    <div class="txt_sub">????????? ????????? ?????? ???????????? ??????, ?????? ?????? ????????? ???????????? ??????,<br>
                        ????????? ????????? ????????? ?????? ??????????????? ?????? ????????? ???????????? ???????????????.
                    </div>
                </div>
            </div>
        </div>
        <div class="section01 sec_design">
            <div class="cont_pagew">
                <div class="prod_nm align_center">
                    <div class="txt_main">??????????????? ?????????</div>
                </div>
                <div class="design_wr">
                    <div class="des_l">
                        <div class="des_img"><img src="/img/brand/design_feat.png"></div>
                    </div>
                    <div class="des_r">
                        <div class="des_inner">
                            <div class="des_txt on">
                                <div class="main_txt">
                                    <div class="des_bg">convenient</div>
                                    <span class="num">01</span>
                                    <span class="title">?????????</span>
                                </div>
                                <div class="main_sub">??????????????? ???????????? ?????????????????? ??????<br>
                                    ?????? ???????????? ????????? ??? ?????? ?????? ????????? ???????????? ???????????????.
                                </div>
                            </div>
                            <div class="des_txt">
                                <div class="main_txt">
                                    <div class="des_bg">Beauty</div>
                                    <span class="num">02</span>
                                    <span class="title">????????????</span>
                                </div>
                                <div class="main_sub">??????????????? ???????????? ?????????????????? ??????<br>
                                    ?????? ???????????? ????????? ??? ?????? ?????? ????????? ???????????? ???????????????.
                                </div>
                            </div>
                            <div class="des_txt">
                                <div class="main_txt">
                                    <div class="des_bg">natural</div>
                                    <span class="num">03</span>
                                    <span class="title">???????????????</span>
                                </div>
                                <div class="main_sub">??????????????? ???????????? ?????????????????? ??????<br>
                                    ?????? ???????????? ????????? ??? ?????? ?????? ????????? ???????????? ???????????????.
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section01 sec_award">
            <div class="pagew">
                <div class="prod_nm align_center">
                    <div class="txt_main award_txt">????????? ????????? ????????????</div>
                    <div class="txt_en">Good design award<br>
                        Pin-up design award</div>
                </div>
                <div class="award_wrap">
                    <div class="award_bx">
                        <div class="award_tit">good<br>
                            design Award</div>
                        <div class="award_img">
                            <img src="/img/magazine/award1.png">
                            <img src="/img/magazine/award_ico1.png" class="award_ico">
                        </div>
                        <div class="award_num">
                            <div class="num_txt">
                                <span class="num">30</span>
                                <span class="txt">??? ??????</span>
                            </div>
                            <div class="dw_bt blue">
                                <a href="" class="btn_view bt_bg bt_ani">
                                    <span class="button__inner">
                                        <span class="button__title">?????? ?????? ???????????? <strong><img src="/img/icon/more_plus.png" alt="icon"></strong></span>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="award_bx">
                        <div class="award_tit">Pin-up<br>
                            design Award</div>
                        <div class="award_img">
                            <img src="/img/magazine/award2.png">
                            <img src="/img/magazine/award_ico2.png" class="award_ico">
                        </div>
                        <div class="award_num">
                            <div class="num_txt">
                                <span class="num">8</span>
                                <span class="txt">??? ??????</span>
                            </div>
                            <div class="dw_bt blue">
                                <a href="" class="btn_view bt_bg bt_ani">
                                    <span class="button__inner">
                                        <span class="button__title">?????? ?????? ???????????? <strong><img src="/img/icon/more_plus.png" alt="icon"></strong></span>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/pages/common/footer.jsp" />