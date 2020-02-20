<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/nav.jsp"%>

<div class="container">
   <h2 class="text-center">방 내놓기</h2>
   <br /> <br /> <br />

   <ul class="list-group list-group-horizontal">
      <li class="list-group-item m-auto">방 내놓기</li>
      <li class="list-group-item m-auto">내방관리</li>
   </ul>
   <hr />

   <br />
   <div class="card text-left">
      <div class="card-body">
         <ul>
            <li>등록한 매물은 30일 동안 노출됩니다.</li>
            <li>일반 회원은 1개의 매물만 내놓을 수 있고, 직거래로 표시됩니다.</li>
         </ul>
      </div>
   </div>
   <br /> <br /> <br />

   <div class="card">
      <div class="card-header">매물 종류</div>
      <div class="card-body pb-0">
         <table class="table table-borderless pb-0">
            <tbody>
               <tr>
                  <td colspan="1">종류선택</td>
                  <td colspan="5">
                     <button type="button" class="btn btn-outline-primary">원룸</button>
                     <button type="button" class="btn btn-outline-primary">투룸</button>
                     <button type="button" class="btn btn-outline-primary">쓰리룸</button>
                     <button type="button" class="btn btn-outline-primary">오피스텔(도시형)</button>
                     <button type="button" class="btn btn-outline-primary">아파트</button>
                  </td>
               </tr>
               <tr>
                  <td colspan="1">건물유형</td>
                  <td colspan="5">
                     <button type="button" class="btn btn-outline-primary">단독주택</button>
                     <button type="button" class="btn btn-outline-primary">다가구주택</button>
                     <button type="button" class="btn btn-outline-primary">빌라/연립/다세대</button>
                     <button type="button" class="btn btn-outline-primary">상가주택</button>
                     <button type="button" class="btn btn-outline-primary">도피스텔</button>
                     <button type="button" class="btn btn-outline-primary">도시형생활주택</button>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <br /> <br />

   <div class="card">
      <div class="card-header">
         <span class="">위치 정보</span> <span class="text-secondary">*등기부등본 상의 주소를 입력해 주세요.</span>
      </div>

      <div class="card-body pb-0">
         <div class="row">
            <div class="col-sm-1 text-center">주소</div>

            <div class="col-sm-6">
               <form action="" method="GET">
                  <div class="form-group">
                     <span> <label for="addr" class="text-smaller">도로명,건물면,지번에 대해 통합검색이 가능합니다.</label>
                     </span> <span><input type="text" class="form-control" placeholder="" id="addr" /></span> <span><button type="button"
                           class="btn btn-dark btn-sm">주소검색</button></span> <br /> <br />
                     <textarea rows="2" cols="40">선택한 주소내용</textarea>
                  </div>

                  <div class="form-group row">
                     <div class="col-sm-6">
                        <input type="text" class="form-control" placeholder="예)101동" id="dong" />
                     </div>
                     <div class="col-sm-6">
                        <input type="text" class="form-control" placeholder="예)201호" id="ho" />
                     </div>
                     <span><input type="checkbox" />등본에 동정보가 없는 경우 선택해 주세요.</span>
                  </div>
                  <a href="" class="text-primary">주소가 검색되지 않으세요?</a> <br />
               </form>
            </div>

            <div class="col-sm-3">
               <img src="/images/kwon/map1.png" id="location_map" style="width: 400px; height: 300px;" />
            </div>
         </div>
      </div>
   </div>
   <br />
   <!-- 거래정보 -->
   <div class="card">
      <div class="card-header">
         <span>거래정보 *처음에 선택한 거래 종류가 우선노출됩니다. 예치금이 있는 경우 보증금 입력란에 필히 입력하세요.</span>
      </div>

      <div class="card-body pb-3">
         <div class="row">
            <div class="col-sm-2 text-center">거래종류</div>

            <div class="col-sm-10">
               <button type="button" class="btn btn-primary btn-small">월세</button>
               <span class="text-secondary"><input type="text" name="보증금" placeholder="보증금" /> / <input type="text" name="월세" placeholder="월세" />(예: 월세
                  1000만원/50만원)</span>

               <button type="button" class="btn btn-primary btn-small">전세</button>
               <span class="text-secondary"><input type="text" name="전세" placeholder="전세" /> (예: 전세 1000만원)</span> <br /> <span><input type="checkbox" />단기가능</span>

            </div>
         </div>
      </div>
   </div>
   <br />

   <!-- 기본정보 -->
   <div class="card">
      <div class="card-header text-center">
         <span>기본정보</span>
      </div>
      <div class="card-body">
         <table class="table table-borderless">
            <tbody>

               <tr>
                  <td>건물크기<br />(1P=3.3058㎡)
                  </td>
                  <td colspan="2"><span>공급면적 <input type="number" style="width: 70px;" />평 <input type="text" style="width: 70px;" />㎡
                  </span></td>
                  <td>해당 층수</td>
                  <td colspan="2"><select class="form-control">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                  </select></td>
               </tr>
               <tr>
                  <td>입주가능일</td>
                  <td colspan="5">
                     <button class="btn btn-outline-primary">즉시입주</button>
                     <button class="btn btn-outline-primary">날짜협의</button>
                     <button class="btn btn-outline-primary">날짜선택</button>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <br/>


<!-- 추가정보 ----------->

   <div class="card">
      <div class="card-header text-center">
         <span>추가정보</span>
      </div>
      <div class="card-body">
         <table class="table table-borderless">
            <tbody>
               <tr>
                  <td>관리비</td>
                  <td colspan="5">
                     <span><input type="number" style="width: 50px;" />만원</span>
                  </td>
               </tr>
               <tr>
                  <td>주차여부</td>
                  <td colspan="2">
                     <button class="btn btn-outline-primary">불가능</button>
                     <button class="btn btn-outline-primary">가능</button>
                  </td>
                  <td>엘리베이터</td>
                  <td colspan="2">
                     <button class="btn btn-outline-primary">있음</button>
                     <button class="btn btn-outline-primary">없음</button>
                  </td>                  
               </tr>
               <tr>
                  <td>옵션항목</td>
                  <td colspan="5">
                     <span>
                        <button class="btn btn-outline-info">에어컨</button>
                        <button class="btn btn-outline-info">세탁기</button>
                        <button class="btn btn-outline-info">옷장</button>
                        <button class="btn btn-outline-info">TV</button>
                        <button class="btn btn-outline-info">냉장고</button>
                        <button class="btn btn-outline-info">전자도어락</button>
                     </span>
                  </td>
               </tr>
               <tr>
                  <td>전세자금대출</td>
                  <td colspan="5">
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
   
   <!-- 상세 설명 입력란 -->
   <div class="card">
      <div class="card-header text-center">
         <span>상세 설명</span>
      </div>
      <div class="card-body">
         <table class="table table-borderless">
            <tbody>
               <tr>
                  <td>제목</td>
                  <td colspan="5">
                     <<input type="text" style="width: 200px;" placeholder="예)신논현역 도보 5분거리.혼자 살기 좋은 방!" />
                  </td>
               </tr>
               <tr>
                  <td>주차여부</td>
                  <td colspan="5">
                     <textarea rows="10" cols="80" >
                     상세설명 작성 주의사항<br/>
                     -방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다.<br/>
                     -중개수수료를 언급한 내용은 입력할 수 없습니다.<br/><br/>
                     *주의사항 위반시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다.<br/>
                     *다방의 매물등록 규정에 위반되는 금칙어는 등록이 불가합니다.<br/><br/>      
                     
                     </textarea>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>
   </div>
   <br/>
   <!-- 사진 등록 -->
   <div class="card">
      <div class="card-header text-center">
         <span>사진등록</span>
      </div>
      <div class="card-body">
         <div class="card">
            <div class="card-body">
               <div>-사진은 가로로 찍은 사진을 권장합니다.</div>
               <div>-사진 용량은 사진 한 장당 10MB까지 등록이 가능합니다.</div>
            </div>
         </div>
         
         <input type="file" name="photo" id="" />
         
         <span class="text-primary">허위 매물을 등록할 경우 다방에서 임의로 계정 및 매물 전체 삭제 처리 됩니다.</span>
      
      </div>
   </div>
   <br/>
   <br/>
   
   
   <div>
      <span><input type="checkbox"/>매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</span>      
   </div>
   <div >
      <button type="button" class="btn btn-outline-secondary">취소</button>
      <button type="button" class="btn btn-primary">매물등록</button>
   </div>




   <br /> <br />

   
   

   <!--전체 컨테이너 끝 div -->
</div>





<br />
<br />
<%@ include file="include/footer.jsp"%>