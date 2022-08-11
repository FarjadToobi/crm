@extends('layouts.app')

@section('content')
    <style>
        p {
            margin: 0;
        }
    </style>
    <x-header title="Messages" description="lorem ipsum" />
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#write_message">Write Message</button>
        </div>
        <div class="card-body">
            @foreach ($messages as $m)
                <div class="row">
                    <div class="col-md-7 {{ $m->reciver_id == Auth::user()->id ? 'offset-md-5' : '' }}">
                        <div class="alert alert-{{ $m->reciver_id == Auth::user()->id ? 'primary' : 'success' }}">
                            {!! $m->message !!}
                            <div>
                                
                            @isset($m->messageFiles)
                                @foreach ($m->messageFiles as $doc)
                                    <a href="{{ url('/files/' . $doc->file) }}" class="btn btn-light" download>Download File</a>
                                @endforeach
                            @endisset
                            </div>

                            <p class="mt-1"><small>{{ $m->created_at }}</small></p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade top-30" id="write_message" tabindex="-1" role="dialog" aria-labelledby="write_messageLabel" aria-hidden="true">
        <form action="{{route('chats.store')}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Send Message</strong></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">                           
                        <x-text-area name="message" label="Message"  placeholder="message"/>                                    
                        <x-input name="files[]"   id="inputImage" label="Upload File" type="file" multiple />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send</button>
                    </div>
                </div>
                </div>
            </div>
        </form>
    </div>
@endsection
