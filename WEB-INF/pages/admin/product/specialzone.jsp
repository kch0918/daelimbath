<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/pages/common_admin/admin_header.jsp"/>

<div id="container">
	<div class="admin-top">
		<h1 class="admin-title">스페셜 존 관리</h1>
		<div class="top-float">
			<button type="button" class="btn btn_a_type" onclick="fncSubmit();">저장</button>
		</div>
	</div>
	<div class="contain_inner">
		<div class="special-zone-wrap">
			<div class="left">
				<article class="special-box">
					<div class="special-img">
						<div class="img-cont">
							<img src="/upload/product/변기통.png" />
						</div>
						<div class="special-txt">
							<input type="text" placeholder="메인 타이틀을 작성해주세요.">
							<textarea placeholder="설명을 작성해주세요."></textarea>
						</div>
					</div>
					<div class="special-info">
						<input type="text" placeholder="연결 링크를 입력해주세요.">
	                   	<div class="input-file-box">
	                   		<span class="input-file">
		                     	<input type="text" id="fake_spacial_file_1" class="fake-upload" placeholder="이미지 첨부"/>
		                        <input type="file" id="spacial_file_1" name="spacial_file_1" onchange="checkFile(this)"/>
	                   		</span>
	                   		<button type="button" onclick="javascript:$('#spacial_file_1').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
	                   	</div>
					</div>
				</article>
				<article class="special-box">
					<div class="special-img">
						<div class="img-cont">
							<img src="/img/brand/2016_01.png" />
						</div>
						<div class="special-txt">
							<input type="text" placeholder="메인 타이틀을 작성해주세요.">
							<textarea placeholder="설명을 작성해주세요."></textarea>
						</div>
					</div>
					<div class="special-info">
						<input type="text" placeholder="연결 링크를 입력해주세요.">
	                   	<div class="input-file-box">
	                   		<span class="input-file">
		                     	<input type="text" id="fake_spacial_file_3" class="fake-upload" placeholder="이미지 첨부"/>
		                        <input type="file" id="spacial_file_3" name="spacial_file_3" onchange="checkFile(this)"/>
	                   		</span>
	                   		<button type="button" onclick="javascript:$('#spacial_file_3').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
	                   	</div>
					</div>
				</article>
				<article class="special-box">
					<div class="special-img">
						<div class="img-cont">
							<img src="/img/smlet03.png" />
						</div>
						<div class="special-txt">
							<input type="text" placeholder="메인 타이틀을 작성해주세요.">
							<textarea placeholder="설명을 작성해주세요."></textarea>
						</div>
					</div>
					<div class="special-info">
						<input type="text" placeholder="연결 링크를 입력해주세요.">
	                   	<div class="input-file-box">
	                   		<span class="input-file">
		                     	<input type="text" id="fake_spacial_file_5" class="fake-upload" placeholder="이미지 첨부"/>
		                        <input type="file" id="spacial_file_5" name="spacial_file_5" onchange="checkFile(this)"/>
	                   		</span>
	                   		<button type="button" onclick="javascript:$('#spacial_file_5').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
	                   	</div>
					</div>
				</article>
			</div>
			<div class="right">
				<article class="special-box">
					<div class="special-img">
						<div class="img-cont">
							<img src="/img/smlet05.png" />
						</div>
						<div class="special-txt">
							<input type="text" placeholder="메인 타이틀을 작성해주세요.">
							<textarea placeholder="설명을 작성해주세요."></textarea>
						</div>
					</div>
					<div class="special-info">
						<input type="text" placeholder="연결 링크를 입력해주세요.">
	                   	<div class="input-file-box">
	                   		<span class="input-file">
		                     	<input type="text" id="fake_spacial_file_2" class="fake-upload" placeholder="이미지 첨부"/>
		                        <input type="file" id="spacial_file_2" name="spacial_file_2" onchange="checkFile(this)"/>
	                   		</span>
	                   		<button type="button" onclick="javascript:$('#spacial_file_2').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
	                   	</div>
					</div>
				</article>
				<article class="special-box">
					<div class="special-img">
						<div class="img-cont">
							<img src="/img/smlet02.png" />
						</div>
						<div class="special-txt">
							<input type="text" placeholder="메인 타이틀을 작성해주세요.">
							<textarea placeholder="설명을 작성해주세요."></textarea>
						</div>
					</div>
					<div class="special-info">
						<input type="text" placeholder="연결 링크를 입력해주세요.">
	                   	<div class="input-file-box">
	                   		<span class="input-file">
		                     	<input type="text" id="fake_spacial_file_4" class="fake-upload" placeholder="이미지 첨부"/>
		                        <input type="file" id="spacial_file_4" name="spacial_file_4" onchange="checkFile(this)"/>
	                   		</span>
	                   		<button type="button" onclick="javascript:$('#spacial_file_4').trigger('click');" class="mid-btn btn_a_type">찾아보기</button>
	                   	</div>
					</div>
				</article>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/pages/common_admin/admin_footer.jsp"/>
