<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">   
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
   
    <style>
        div,pre { background : #FFF; padding:10px; margin:10px; }
        table { border:1px solid #AAA; }
        td { border:1px solid #AAA; width:25px; height:25px; }
        .selected { background:#1A5AE8; color:white; }
        
        
       input[type=radio] {
       	display: none;
        	margin: 10px;
        }
        
        input[type=radio]+label {
        	display: inline-block;
        	margin: -2px;
        	padding: 8px 19px;
        	background-color : #f5f5f5;
        	border: 1px solid #ccc;
        	fontsize: 13px !important;
        	width: 110px;
        	text-align: center;
        }
        input[type=radio]+label {
        	background-iamge : none;
        	background-color : #3598dc;
        	color: #fff;
        }
        
    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<script type="text/javascript">
//     $(document).ready(function () {
//         $("li").each(function () {
//             $(this).click(function () {
//                 $(this).addClass("selected");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
//                 $(this).siblings().removeClass("selected");  //siblings:형제요소들, removeClass:선택된 클래스의 특성을 없앰
//             });
//         });
//     });
</script>
    
<script type="text/javascript">
//   $(document).ready(function () {
//       $("label").each(function () {
//           $(this).click(function () {
//               $(this).addClass("selected");    //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
//               $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
//           });
//       });
//   });
</script>
    

</head>
<body style="padding:10px;">
    <h2>jQuery 시작 Selector</h2>
    <p>jQuery에 대한 자세한 내용을 보려면 jquery.com 을 방문하세요.</p>
    <div>
        <ul>
            <li>list item 1</li>
            <li>list item 2</li>           
            <li>list item 3</li>
        </ul>
    </div>
    
    <div class="card">
			<div class="card-header text-center">매물 종류</div>
			<div class="card-body pb-0">
				<table class="table table-borderless pb-0">
					<tbody>
						<tr>
							<td colspan="1" class="text-center">종류선택</td>
							
							<td colspan="5" class="text-left">
							<div class="form-group">					
							<label for ="option1-1" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="원룸" id="option1" autocomplete="off">원룸
							</label>
							
							<label for ="option1-2" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="투룸" id="option2" autocomplete="off">투룸
							</label> 
							
							<label for ="option1-3" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="쓰리룸" id="option3" autocomplete="off">쓰리룸
							</label> 
							
							<label for ="option1-4" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="오피스텔" id="option4" autocomplete="off">오피스텔
							</label> 
							
							<label for ="option1-5" class="btn btn-outline-secondary"> 
							<input type="radio" style="display: none;" name="roomType" value="아파트" id="option5" autocomplete="off">아파트
							</label>
							</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 거래정보 -->
		<div class="card">
			<div class="card-header text-center">
				<span>거래정보 *처음에 선택한 거래 종류가 우선노출됩니다. 예치금이 있는 경우 보증금 입력란에 필히 입력하세요.</span>
			</div>

			<div class="card-body pb-3">
				<div class="row">
				
					<div class="col-2 text-center">거래종류</div>

					<div class="col-3">
					<div class="form-group">
						<div>
							<label for ="option2-1" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="dealType" value="월세" id="option1" autocomplete="off">월세
							</label> 
						</div>
						<br />
						<div>
							<label for ="option2-2" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="dealType" value="전세" id="option2" autocomplete="off">전세
							</label> 
						</div>
						<br />
						<div>
							<label for ="option2-3" class="btn btn-outline-secondary btn-small"> 
							<input type="radio" style="display: none;" name="dealType" value="매매" id="option3" autocomplete="off">매매
							</label> 
						</div>
					</div>
					</div>
					
					<div class="col-7">
					<div class="form-group">
						<div>
							<span class="text-secondary"> 
							<input id="deposit" type="text" name="deposit" value="0" placeholder="보증금" style="width:120px;" />만원  / 
							<input id="monthRent"type="text" name="monthRent" value="0" placeholder="월세금" style="width:120px;"/>만원   (예: 월세 1000만원/50만원)
							</span>
						</div>
						<br />
						<div>
							<span class="text-secondary"> 
							<input type="text" name="yearRent" value="0" placeholder="전세금" style="width:120px;" />만원 (예: 전세 1000만원)
							</span>
						</div>
						<br />
						<div>
							<span class="text-secondary"> 
							<input type="text" name="dealRent" value="0" placeholder="매매가" style="width:120px;" />만원 (예: 매매 1000만원)
							</span>
						</div>
					</div>
					</div>
					
				</div>
			</div>
		</div>
		<br />
		
		<input type="radio" id="radio1" name="radios">
		<label for="radio1">바나나</label>
    

</body>
</html>