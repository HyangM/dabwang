<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style>
button.selected{
  color:red;
}
</style>
</head>
<body>




<button>Item</button>
<button>Item</button>
<button>Item</button>

<script>
$('button').on('click', function(){
    $('button').removeClass('selected');
    $(this).addClass('selected');
});

</script>


</body>
</html>