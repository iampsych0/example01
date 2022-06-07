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
				<td colspan="4" align="center">
					<button type="button" onclick="chugaTop();">등록하기</button>
				</td>
			</tr>

			<tr>
				<td>순번</td>
				<td>작성자</td>
				<td>내용</td>
				<td>등록일</td>
			</tr>
	
	<% 
		for(int i=0; i<list.size(); i++){
			MemoDTO imsiDto = list.get(i);
			String content = imsiDto.getContent();
			content = content.replace("\n", "<br>");
	%>
		<tr>
			<td><%=jj %></td>
			<td><a href="#" onclick="move('memo_view', '<%=imsiDto.getNo() %>');"> <%=imsiDto.getWriter() %></a></td>
			<td><%=imsiDto.getContent() %></td>
			<td><%=imsiDto.getRegiDate() %></td>
		</tr>
	<% 
			jj--;
		} 
	%>
	
	<% if(totalRecord > 0) { %>
	<tr>
		<td colspan="6" align="center" style="padding : 10px 10px;">
			<a href='#' onclick="move('memo_list', '', '<%=searchGubun %>', '<%=searchData %>', '1');">[첫페이지]</a>
			&nbsp;
			
			<%
				if (block > 0) {
					int imsiPage = (block - 1) * blockSize + 10;
			%>
				<a href='#' onclick="move('memo_list', '', '<%=searchGubun %>', '<%=searchData %>', '<%=imsiPage %>');">[이전10개] </a>
			<% } else {%>
					[이전10개]
			<% } %>
			&nbsp;
			<%
				for(int goPage=1; goPage<=blockSize; goPage++){
					int imsiValue = block * blockSize + goPage;
					if(totalPage - imsiValue >= 0){
						if(imsiValue == pageNumber) {
			%>
							[<%=imsiValue %>]
			<%				
						}else {
			%>
						<a href='#' onclick="move('memo_list', '', '<%=searchGubun %>', '<%=searchData %>', '<%=imsiValue %>');"><%=imsiValue %> </a>
			<%				
						}
						out.println("&nbsp;");
					}
				}
			%>
			&nbsp;
			<%
				int totalBlock = totalPage / blockSize;
				double value1 = (double)totalBlock;
				double value2 = totalPage / blockSize;
				if(value1 - value2 == 0){
					totalBlock = totalBlock - 1;
				}
				
				if(block - totalBlock < 0){
					int yyy = (block + 1) * blockSize + 1;
					int zzz = block +1;
				
			%>
					<a href='#' onclick="move('memo_list', '', '<%=searchGubun %>', '<%=searchData %>', '<%=yyy %>');">[다음10개]</a>
			<% } else { %>
					[다음10개]
			<%
				} 
			%>
			&nbsp;
			
			<a href='#' onclick="move('memo_list', '', '<%=searchGubun %>', '<%=searchData %>', '<%=totalPage %>');">[끝페이지]</a>
		</td>
	</tr>
	<% } %>
	
</table>
</form>
<table border="1" align="center">
	<tr>
		<td colspan="4" style="padding : 10px 0px; width: 100%;">
			<form name="searchForm">
				<select name = "searchGubun">
					<option value="" <%if(searchGubun.equals("")) { out.println("selected");} %>>-- 선택 --</option>
					<option value="writer" <%if(searchGubun.equals("writer")) { out.println("selected");} %>> 작성자</option>
					<option value="content" <%if(searchGubun.equals("content")) { out.println("selected");} %>> 내용</option>
					<option value="writer_content" <%if(searchGubun.equals("name_content")) { out.println("selected");} %>> 작성자+내용</option>
				</select>
				&nbsp;
				<input type="text" name="searchData" value="<%=searchData %>">
				&nbsp;
				<button type ="button" onclick="search();">검색</button>
			</form>
		</td>
	</tr>
</table>
		
	<script>
		function chugaTop(){
			document.chugaTopForm.action = "../main/mainProc.jsp?menuGubun=memo_chugaProc";
			document.chugaTopForm.method = "post";
			document.chugaTopForm.submit();
		}
	</script>

<% if(searchYesNo.equals("X")) { %>
* 전체 레코드 : <%=totalRecord %>건 (<%=pageNumber %> page /<%=totalPage %> page)
<% } else {%>
* 검색어 <font style="color : red; font-weight : bold;">"<%=searchData %>"</font> 로 검색된 레코드 : <%=totalRecord %>건 (<%=pageNumber %> page /<%=totalPage %> page)
<% } %>

</fieldset>

<hr>

<h2>서브 메뉴</h2>
|
<a href="#" onclick="move('memo_list', '', '<%=searchGubun %>', '<%=searchData %>', '1')">전체목록</a>
|
<a href="#" onclick="move('memo_chuga', '')">등록</a>
|


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