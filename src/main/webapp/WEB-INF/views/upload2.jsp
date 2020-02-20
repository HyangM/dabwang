<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>

<!-- <script src="/js/jquery.min.js"></script> -->
<!-- <script src="/js/jquery-migrate-3.0.1.min.js"></script> -->
<!-- <script src="/js/popper.min.js"></script> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<div class="container">
   <h2 class="text-center">방 내놓기</h2>
   <br /> <br /> <br />
      
   <table class="table table-borderless">
		<tbody>
			<tr class="text-center" id="detail_menu">
				<td>방 내놓기</td>
				<td>내방관리</td>
			</tr>
		</tbody>
	</table>
   <hr />
   <br />

   
   
<form action="/uploadTest" method="POST">
<!-- 추가정보 ----------->
   <div class="card">
      <div class="card-header">
         <span>추가정보</span>
      </div>
      <div class="card-body">
         <table class="table table-borderless">
            <tbody>
               <tr>
                  <td colspan="4">관리비</td>
                  <td colspan="4">
                     <span><input type="text" style="width: 50px;" id="mCost" name="mCost" />만원</span>
                  </td>
               </tr>
               <tr>
                  <td colspan="4">주차여부</td>
                  <td colspan="2">
                     <input type="button" class="parking btn btn-outline-primary" parking ="N" name="parkingN" value="불가능" />
                     <input type="button" class="parking btn btn-outline-primary" parking ="P" name="parkingP" value="가능" />
                  </td>
                                
               </tr>
               <tr>
                  <td colspan="4">옵션항목</td>
                  <td colspan="4">
                     <span>
                        <button class="options btn btn-outline-info">에어컨</button>
                        <button class="options btn btn-outline-info">세탁기</button>
                        <button class="options btn btn-outline-info">옷장</button>
                        <button class="btn btn-outline-info">냉장고</button>
                        <button class="btn btn-outline-info">전자도어락</button>
                        <button class="btn btn-outline-info">가스레인지</button>
                        <button class="btn btn-outline-info">비데</button>
                        <button class="btn btn-outline-info">신발장</button>
                        <button class="btn btn-outline-info">인덕션</button>
                        <button class="btn btn-outline-info">전자레인지</button>
                        <button class="btn btn-outline-info">책상</button>
                        <button class="btn btn-outline-info">침대</button>
                        <button class="btn btn-outline-info">TV</button>
                        <button class="btn btn-outline-info">비디오폰</button>
                        <button class="btn btn-outline-info">공동현관</button>
                        <button class="btn btn-outline-info">경비원</button>
                        <button class="btn btn-outline-info">CCTV</button>
                        <button class="btn btn-outline-info">방범창</button>
                        <button class="btn btn-outline-info">인터폰</button>
                       
                     </span>
                  </td>
               </tr>
               <tr>
                  <td colspan="4">전세자금대출</td>
                  <td colspan="4">
                     <span>
                        <button class="btn btn-outline-info">가능</button>
                        <button class="btn btn-outline-info">불가능</button>
                     </span>
                  </td>
               </tr>               
            </tbody>
         </table>
      </div>
   </div>
   


   
   <div>
      <span><input type="checkbox"/>매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</span>      
   </div>
   <div >
      <button type="submit" class="btn btn-primary" id="room--upload">매물등록</button>
   </div>
   <br /> <br />
  
</form>
   <!--전체 컨테이너 끝 div -->
</div>





 <script src="/js/upload.js" type="text/javascript"></script>

<br />
<br />
<%@ include file="include/footer.jsp"%>