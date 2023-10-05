@extends('layouts.master')

@section('content')
    <div class="help_Divide ">
        <div  class=" bg--grey  ">
            <ul class="pt--10 pb--5 list_StyleNone">
                <li data-help="make" class="mb--5 helpPageClass"><img  class="pr--5 pl--5 helpPageClass" src="images/Vectorarrowhelp.png"><a href="#"  class="pb--5 fc--white link_Underline helpPageClass" >How do I create a record?</a></li>
                <li data-help="change" class="mb--5 helpPageClass"><img  class="pr--5 pl--5 helpPageClass" src="images/Vectorarrowhelp.png"><a href="#"  class="fc--white link_Underline helpPageClass" >How can I edit my records?</a></li> 
                <li data-help="delete" class="mb--5 helpPageClass"><img  class="pr--5 pl--5 helpPageClass" src="images/Vectorarrowhelp.png"><a href="#"  class="fc--white link_Underline helpPageClass" >How do I remove a record?</a></li> 
                <li data-help="specific" class="mb--5 helpPageClass"><img  class="pr--5 pl--5 helpPageClass" src="images/Vectorarrowhelp.png"><a href="#"  class="fc--white link_Underline helpPageClass" >How can I find any specific records?</a></li> 
            </ul>
        </div>

        <div data-help="make" class=" pt--15">
            <h1  class="center_Text mb--20">How do I create a record?</h1>
            <p  class="pb--5 textboxsize">Go to the homepage. You can easily do this by clicking on the “Records” tab in the navigation above.</p>
            <img class="image_Variant_7 image_AlignCenter mb--15" src="{{asset('images/records.png')}}">
            <p class="pb--5 textboxsize">Next, click on the “Create” button near your records. This makes a pop-up window appear where you can select your record type and give a name for your subdomain.</p>
            <div>
                <img class="image_Variant_7 image_AlignCenter mb--15" src="{{asset('images/aanmaken.png')}}">
            </div>
            <div>
                <img class="image_Variant_7 image_AlignCenter mb--15" src="{{asset('images/Recordaanmaken.jpg')}}">
            </div>
            <p class="pb--5 textboxsize">When you're ready to enter your details, press the “Save” button at the bottom to save your created record. A confirmation message will appear above the homepage and the record will be added to your list.</p>
            <img class="pb--20 image_AlignCenter image_Variant_7" src="{{asset('images/Recordaangemaakt.jpg')}}">
        </div>

        <div data-help="change"  class="hide  pt--15" >
            <h1  class="center_Text mb--20">How can I edit my records?</h1>
            <p  class="pb--5 textboxsize">In your list of records on the homepage, you can see that every record has a pencil icon on the right side of the bar. 
            Simply press on the pencil icon and a pop-up window will appear.</p>
            <img class="image_Variant_7 image_AlignCenter mb--15" src="{{asset('images/Recordchange.jpg')}}">
            <p class="pb--5 textboxsize">Here, you can change your record type and your subdomain name. 
            Once you've changed your information, press on the “Save” button 
            below to save your changes to the record. This record will now be 
            updated with the information you have provided.</p>
            <img class="image_Variant_7 image_AlignCenter mb--15" src="{{asset('images/Recordchangeform.jpg')}}">
        </div>

        <div data-help="delete" class="hide pt--15" >
            <h1 class="center_Text mb--20">How do I remove a record?</h1>
            <p class="textboxsize pb--5">Go to your list of records on the homepage. 
            Every record in that list has a checkbox on the left side of the bar. 
            Click on the checkbox of the record you wish to remove and 
            then click on the “Remove” button at the top of your record list.

            <br><br>Note that it's possible to select multiple records to 
            remove them as a group. Simply select every record you 
            wish to remove before clicking on the “Remove” button.</p>
            <img class="image_Variant_7 mb--15 image_AlignCenter" src="{{asset('images/recorddelete.jpg')}}">
        
            <p class="pb--5 textboxsize">A confirmation window will now appear at the top of the homepage confirming that you have successfully removed that record from your list.</p>
            <img class="image_Variant_7 image_AlignCenter mb--15" src="{{asset('images/recorddeleteconfirmation.jpg')}}">
        </div>

        <div data-help="specific" class="hide pt--15">
            <h1  class="center_Text mb--20">How can I find any specific records?</h1>
            <p class="textboxsize pb--5">There are multiple ways to search for the record you need.

            First, on the homepage, you have the option to filter your list of records. These can be filtered either by name or any type of records.
            
            Left of the option to filter your records is a search bar, 
            where you can type and look for any name of any record within your list. 
            This will make any record that matches what you’ve entered in the search bar appear.</p>
            <img class="image_Variant_7 mb--15 image_AlignCenter" src="{{asset('images/Recordspecific.jpg')}}">
            <p class="pb--5 textboxsize">Lastly, the homepage can only hold 6 records at a time. Given you have any more than that, 
            you can look for other records by selecting one of the pages at the bottom of the list. 
            This will update the list to show any other records you might be looking for.</p>
            <img class="image_Variant_7 mb--20 image_AlignCenter" src="{{asset('images/Recordpaging.jpg')}}">
        </div>

        

    </div>
@endsection
