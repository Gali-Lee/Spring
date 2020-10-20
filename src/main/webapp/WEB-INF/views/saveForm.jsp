<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/header.jsp"%>
<main>
	<div class="jumbotron">
		<h1>글쓰기 페이지</h1>
	</div>
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<div class="form-group">
				TITLE : <input type="text" class="form-control form-control-sm"
					placeholder="제목을 입력하세요" name="text1" id="title">
			</div>
			<div class="form-group">
				<div id="summernote">aaaa</div>
			</div>
			<button onclick="test()">글 등록</button>
		</div>
		<div class="sm-sm-1"></div>

	</div>
	<script>
		$(document).ready(function() {
			$('#summernote').summernote();
		});
	</script>
</main>
<script type="text/javascript">
	function test(){
		let title_el = document.querySelector("#title");
		let title = title_el.value;
		let content = $("#summernote").summernote('code');
		
		console.log(title);
		console.log(content);

		let board = {
			title: title,
			content: content
		};
		
		fetch("/save",{
			method:"post",
			headers:{
				'Content-Type':'application/json; charset=utf-8',	
			},
			body:JSON.stringify(board)
			
		}).then(res=>res.text())
		.then(res=>{
			if(res=="ok"){
				alert("작성완료");
				self.location="/list";
			}else{
				alert("수정실패");
			}
		}); 
		
	}
	
</script>
<%@ include file="layout/footer.jsp"%>