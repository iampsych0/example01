<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%@ include file = "_inc_top.jsp" %>

<%	
	MemoDAO dao = new MemoDAO();

	String pageNumber_ = request.getParameter("pageNumber");
	if(pageNumber_ == null || pageNumber_.trim().equals("")){
		pageNumber_ = "1";
	}
	int pageNumber = Integer.parseInt(pageNumber_);
	int pageSize = 10;
	int blockSize = 10;
	int totalRecord = dao.getTotalRecord(searchGubun, searchData);
	int block = (pageNumber - 1) / pageSize;
	int jj = totalRecord - pageSize * (pageNumber - 1);
	double totalPageDou = Math.ceil(totalRecord / (double)pageSize);
	int totalPage = (int)totalPageDou;
	int startRecord = pageSize * (pageNumber - 1) + 1;
	int lastRecord = pageSize * pageNumber;

	ArrayList<MemoDTO> list = dao.getSelectAll(searchGubun, searchData, startRecord, lastRecord);
%>


<fieldset style ="border: 0px solid blue; margin: 10px 0px 20px 0px;">
	<form name="chugaTopForm">
		<table border="1" align="center">
			<tr>
				<td colspan="4"><h2>메모 목록</h2></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td colspan="3"><input type="text" name="writer"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><textarea name="content" style="width: 150px; height:50px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<button type="button" onclick="chugaTop();">등록하기</button>
				</td>
			</tr>
			<tr>
				<td>순번</td>
				<td>작성자</td>
				<td>내용</td>
				<td>등록일</td>
			</tr>
	
			
		</table>
	</form>
<script>
	function chugaTop(){
		document.chugaTopForm.action = "mainProc.jsp?menuGubun=memo_chugaProc";
		document.chugaTopForm.method = "post";
		document.chugaTopForm.submit();
	}
</script>
</fieldset>

<hr>

<script>
	function move(value1, value2, value3, value4, value5){
		location.href = 'main.jsp?menuGubun=' + value1 + '&no=' + value2 + '&searchGubun=' + value3 + '&searchData=' + value4 + '&pageNumber=' + value5;
	}
	
	function search(){
		document.searchForm.action = "../main/main.jsp?menuGubun=memo_list";
		document.searchForm.method = "post";
		document.searchForm.submit();
	}
</script>