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
        .selected { background:#1A5AE8; color: red; }
        
        
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
    $(document).ready(function () {
        $("li").each(function () {
            $(this).click(function () {
                $(this).addClass("selected");                      //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
                $(this).siblings().removeClass("selected");  //siblings:형제요소들, removeClass:선택된 클래스의 특성을 없앰
            });
        });
    });
</script>
    
<script type="text/javascript">
  $(document).ready(function () {
      $("#radio1").each(function () {
          $(this).click(function () {
              $(this).addClass("selected");    //클릭된 부분을 상단에 정의된 CCS인 selected클래스로 적용
              $(this).siblings().removeClass("selected");  //siblings:형제요소들,    removeClass:선택된 클래스의 특성을 없앰
          });
      });
  });
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
    
   <hr/>
		
		<input type="radio" id="radio1" name="radios">
		<label for="radio1">바나나</label>
		<input type="radio" id="radio2" name="radios">
		<label for="radio2">딸기</label>
		<input type="radio" id="radio3" name="radios">
		<label for="radio3">사과</label>
    

</body>
</html>