<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>404lỗi-{{ config('app.name') }}</title>
    <style>
        #box{
            margin: 0 auto;
            width: 540px;
            height: 540px;
        }
        p{
            margin-bottom: 60px;
            width: 540px;
            height: 20px;
            text-align: center;
            line-height: 20px;
        }
        #mes{
            font-size: 30px;
            color: red;
        }
        .hint{
            color: #999;
        }
        a{
            color: #259AEA;
        }
    </style>
    <script>
        var i = 5;
        var intervalid;
        intervalid = setInterval("fun()", 1000);
        function fun() {
            if (i == 0) {
                window.location.href = "/";
                clearInterval(intervalid);
            }
            document.getElementById("mes").innerHTML = i;
            i--;
        }
    </script>
</head>
<body>
<div id="box">
    <img src="{{ asset('images/home/404.jpg') }}" alt="404">
    <p>f <span id="mes">5</span> quay lại sau vài giây<a href="/">{{ config('app.name') }}</a>trang đầu</p>
    <p class="hint">Xin lỗi - bạn có thể đã nhập sai URL hoặc trang đã bị xóa hoặc di chuyển</p>
</div>
</body>
</html>
