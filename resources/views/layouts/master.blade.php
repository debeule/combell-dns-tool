<!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>DNS Admin</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="{{asset('images/kdg.ico')}}">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
  </head>

  <body>
    <nav id="myTopnav"  class="navbar header topnav bg--black">
      <a href="/"><img  class="image_Variant_1 " src="{{asset('images/KdG_V_White.png')}}" ></a>
        
      <ul id="nav" class="mb--0 nav_Menu">
        <li class="text_Decoration"><a class="nav_Item py--3 px--10 fc--white link_Underline" href="/records">Records</a></li>
        <li class="text_Decoration"><a class="nav_Item py--3 px--10 fc--white link_Underline" href="/help">Help</a></li>
        
        @role('admin')
          <li><a class="nav_Item py--3 px--10 fc--white link_Underline" href="/admin">Admin</a></li>
          <li><a class="nav_Item py--3 px--10 fc--white link_Underline" href="/monitor">Monitor</a></li>
        @endrole
        
        <li><a  class="nav_Item py--3 px--10 fc--white link_Underline nav_Logout" href="/logout">Log out</a></li>
      </ul>

      <a class="nav_Item" href="/logout">
        <button class="nav_LogoutButton button_Logout fc--black bg--white button_Font" >Logout</button>
      </a>

      <div class="hamburger">
        <div class="bar1"></div>
        <div class="bar2"></div>
        <div class="bar3"></div>
      </div>
    </nav>

    @yield('content')

    <script type="text/javascript" src="/js/main.js"></script>
  </body>
</html>
