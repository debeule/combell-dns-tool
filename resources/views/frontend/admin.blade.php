@extends("layouts.master")

@section("content")
    <div class="popup hide" data-popup="popup-3"></div>

    <div class="popup center_Popup" data-popup="popup-1" >
        <div class=" bg--darkGrey border_RadiusForm" >
            <div class="pt--10 mb--5 mr--10 flex justify_ContentRight">
                <a>
                    <img class="trigger" data-popup="popup-3"  type="button"  src="{{asset('images/closeWhite.png')}}">
                </a>
            </div>
            <div class="mt--5 fc--white Proxima-Nova-ExtraBold">
                <h1>CREATE USER</h1>
            </div>
            <form id="createUser_Form" action="{{ route('createUser') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="mt--7 fc--white">
                    <input value="14491" type="hidden" id="servicePack" name="servicePack" class="shape_Add flex1 input_Sizing" >
                    <label class="label_Sizing" for="serviceStudent">Servicepack</label>
                    <input value="KDG-student" type="text" id="serviceStudent" name="serviceStudent" class="shape_Add flex1 input_Sizing" Readonly>
                </div>

                <div class="mt--10" >
                    <div> 
                        <label class="fc--white  label_Sizing" for="recordName">Choose a file</label>
                        <input class="fc--white mb--15 ml--20 mt--2" type="file" id="csvFile" name="csvFile" accept=".csv">
                    </div>
                </div>
                <div>
                    <button id="saveCreateUser" data-refresh-page class="button_Save button_Font mt--10 mb--20 ml--3 bg--white fc--black "  type="submit">Save</button>
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
            <h1>ALL USERS</h1>
        </div>
        <div  class="has_Search alignment_Vertical mb--15">
            <img class="fa fa-search form_ControlFeedback ml--2 mt--4 mr--3" src={{asset('images/search.png')}}>
            <input  type="text" id="inputSearch"  class="form_Control shape_Search body bg--lightgrey" placeholder="" >
            <div class="ml--5"> 
                <p class="mb--0">Sort</p>
                <select id="userSortBy" class="size">
                    <option value="1">Name</option>
                    <option value="2">Records</option>
                </select>
            </div>
        </div>
        
        <div class="alignment_Vertical mb--5">
            <button  data-popup="popup-1"  class="button_PlacementCreate trigger button_Create bg--black fc--white">Create user</button>
            <form>
                @csrf
                <button data-refresh-page  class="button_PlacementDelete ml--5 button_Delete bg--white" form="deleteUsers_form" id="submitDeleteUserRecords" type="submit" >Delete Users</button>
            </form>
        </div>
        
        <div>
            <form method="POST" id="deleteUsers_form">
            <div class="table-responsive table_Width">    
                <table id="userTable" class="table table-striped table_Styling">
                    <thead>
                        <th></th>
                        <th>email</th>
                        <th>created at</th>
                        <th>records</th>
                    </thead>
                    <tbody>
                        @foreach ($responses as $response)
                            <tr black class="pb--10">
                                <td>
                                    <input name="userIds[]" value="{{$response->id}}" class="checkbox" type="checkbox"/>
                                </td>
                                <div class="bg--grey">
                                    <td class="">{{ $response->email }}</td>
                                    <td class="pl--10">{{ $response->created_at }}</td>
                                    <td class="pl--10">{{ $response->records_count }}</td>
                                </div>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>     
            <div class="mt--10 center_Div">
                {{ $responses->links('pagination::default') }}
            </div>       
        </div>
    </div>
@endsection