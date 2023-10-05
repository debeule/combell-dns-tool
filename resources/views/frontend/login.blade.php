<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="{{asset("css/styles.css")}}">
    <title>Document</title>
</head>

<body>
    <div class="login_leftHalf " style="background: url({{asset('/images/Home_Screen_Fill.png')}});">

    </div>

    <div class="login_rightHalf container mt--20 pt--20">
        <div class="container mb--15">   
            <img class="image_Variant_6 " src="{{asset('images/KdG_V_Black.png')}}">
        </div>
        <h1 class="mb--5 fc--black">WELCOME!</h1>
        
        <div class="fc--grey">This is KdG's Combell platform</div>
        <a class="mt--10 mb--20 ml--3" href="{{ route('login') }}">
            <button class='button_Login button_Font  bg--black fc--white'  >Log in with your <strong>kdg.be</strong> account</button>
        </a>
        <div >
            <img id="catBox" class="image_Variant_3" src="http://edgecats.net/" alt="Random GIF"> 
        </div>
    </div>

    <script type="text/javascript" src="/js/main.js"></script> 
</body>

</html>
