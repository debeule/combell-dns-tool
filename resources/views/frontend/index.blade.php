@extends("layouts.master")

@section("content")
    <div class="popup hide" data-popup="popup-3" ></div>

    <div  class="popup center_Popup" data-popup="popup-1" >
        <div class=" bg--darkGrey border_RadiusForm" >
            <div class="pt--10 mb--5 mr--10 flex justify_ContentRight">
                <a>
                    <img class="trigger" data-popup="popup-3"  type="button"  src="{{asset('images/closeWhite.png')}}">
                </a>
            </div>
            <div class="mt--5 mb--10 fc--white Proxima-Nova-ExtraBold">
                <h1>CREATE RECORD</h1>
            </div>
            <form action="{{ route('createRecord') }}" method="POST">
                @csrf
                <div class="mt--7 fc--white">
                    <label class=" label_Sizing" for="dropdown">Type</label>
                    <select  id="dropdown" name="recordType" class="input_Sizing">
                        <option value="A">A</option>
                        <option value="CNAME">CNAME</option>
                        <option value="TXT">TXT</option>
                    </select>
                </div>
                <div class="mt--10" >
                    <div> 
                        <label class="fc--white  label_Sizing" for="recordName">Name</label>
                        <input type="text" id="recordName" name="recordName" class="shape_Add flex1 input_Sizing" placeholder="Title website" >
                        <p data-Name="{{Auth::User()->first_name}}" data-LastName="{{ Auth::User()->last_name}}" id="recordExample" class="fc--white mb--0 ml--3"></p>
                    </div>
                </div>
                <div class="mt--5" >
                    <label id="labelTextField" class="hide fc--white  label_Sizing" for="textField">Value</label>
                    <textarea name="content" class="hide  flex1 input_Sizing" type="text" id="textField"></textarea>
                </div>
                <div>
                    <button data-refresh-page id="saveButton" class="button_Save button_Font mt--10 mb--20 ml--3 bg--white fc--black "  type="submit" disabled>Save</button>
                </div>
            </form>
        </div>
    </div>

    <div class="popup center_Popup" data-popup="popup-10" >
        <div class=" bg--darkGrey border_RadiusForm">
            <div class="pt--10 mb--5 mr--10 flex justify_ContentRight">
                <a>
                    <img class="trigger" data-popup="popup-3"  type="button"  src="{{asset('images/closeWhite.png')}}">
                </a>
            </div>
            <div class="mt--5 fc--white Proxima-Nova-ExtraBold">
                <h1>EDIT RECORD</h1>
            </div>

            <form action="{{ route('editRecord') }}" method="POST">
                @csrf
                <div class="hide"><input type="text" id="idrecord" name="recordId"/></div>
                <div class="mt--7 fc--white">
                    <label class="label_Sizing" for="recordType">Type</label>
                    <input value="" type="text" id="recordType" name="recordType" class="shape_Add flex1 input_Sizing" readonly>
                </div>

                <div class="mt--10" >
                    <div> 
                        <label class="fc--white  label_Sizing" for="editName">Name</label>
                        <input type="text" id="editName" name="recordName" class="shape_Add flex1 input_Sizing" >
                        <p  id="recordExample" class="fc--white mb--0 ml--3"></p>
                    </div>
                </div>
                <div class="mt--5" >
                    <label id="editlabelTextField" class="hide fc--white  label_Sizing" for="edittextField">Value</label>
                    <textarea id="edittextField" name="content" class="hide  flex1 input_Sizing" type="text" ></textarea>
                </div>
                <div>
                    <button data-refresh-page class="button_Save button_Font mt--10 mb--20 ml--3 bg--white fc--black "  type="submit">Save</button>
                </div>
            </form>
        </div>
    </div>

    @if(session()->get('message'))
        @if (session()->get('positive') == true)
            <div  id="hideNotification" class="bg--green fc--white center_Div align_ItemsCenter notification">
                <p class="marginbottom_Reset">{{ session('message') }}</p>
            </div>
        @endif

        @if (session()->get('positive') == false)
            <div  id="hideNotification" class="bg--red fc--white center_Div align_ItemsCenter notification">
                <p class="marginbottom_Reset">{{ session('message') }}</p>
            </div>    
        @endif
    @endif

    <div class="alignment mt--20 container">
        <div class="mb--10">
            <h1>YOUR RECORDS</h1>
        </div>
        <div  class="has_Search alignment_Vertical mb--15">
            <img class="fa fa-search form_ControlFeedback ml--2 mt--4 mr--3" src={{asset('images/search.png')}}>
            <input  type="text" id="myInput" class="form_Control shape_Search body bg--lightgrey" placeholder="" >
            <div class="ml--5"> 
                <p class="mb--0">Sort</p>
                <select id="sortBy" class="size">
                    <option value="1">Name</option>
                    <option value="2">Type</option>
                </select>
            </div>
        </div>
        
        <div>
            <form method="POST" id="checkbox_form" action="{{route('deleteRecord')}}">
                @csrf
                <div class="alignment_Vertical mb--5">
                    <button data-popup="popup-1"  class="button_PlacementCreate trigger button_Create bg--black fc--white">Create</button>
                    <button data-refresh-page class="button_PlacementDelete ml--5 button_Delete bg--white"  id="submitcheckbox" type="submit" >Delete</button>
                </div>
                
            <div class="table-responsive table_Width" >   
                <table id="myTable" class="table table-striped table_Styling" >
                    <thead>
                        <th class="hide">checkbox</th>
                        <th class="hide">Name</th>
                        <th class="hide">Type</th>
                        <th class="hide">edit</th>
                    </thead>
                    <tbody>
                        @foreach ($responses as $response)
                            <tr @if($response->is_pending) class="bg--darkGrey" @endif black class="pb--10">
                                <td class=" align-middle">
                                    <input @if($response->is_pending) class="hide" @endif id="checkbox" name="recordIds[]" value="{{ $response->record_id }}" class="checkbox"  type="checkbox"/>
                                </td>
                                <td class="align-middle">
                                    <a @if($response->is_pending) class="hide" @endif class="ml--5 hide_EditMobile" href="">
                                        <img data-response="{{$response}}" name="{{ $response->record_id }}" data-popup="popup-10"  class="trigger" type="button" src="{{asset('images/Pencilblackpen.png')}}">
                                    </a>
                                </td>
                                <td class="align-middle">{{ $response->record_name }}.{{ Auth::User()->first_name}}.{{ Auth::User()->last_name}}<span class="hide_Mail">.nxtmediatech.eu</span></td>
                                <td class="pl--10 align-middle">{{ $response->type }}</td>
                                <td class="align-middle">
                                    <a @if($response->is_pending) class="hide" @endif class="ml--15 hide_EditDesktop" href="">
                                        <img data-response="{{$response}}" name="{{ $response->record_id }}" data-popup="popup-10"  class="trigger editPen" type="button" src="{{asset('images/Pencilblackpen.png')}}">
                                    </a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="mt--10 center_Div">
                {{ $responses->links('pagination::default') }}
            </div>
    </div>
@endsection