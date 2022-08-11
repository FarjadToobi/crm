@extends('layouts.app')

@section('content')
    <x-header title="All Messages" description="lorem ipsum" />
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Sender Name</th>
                            <th>Message</th>
                            <th>Send At</th>
                            @if (Auth::user()->hasPermission(['messages-access', 'reply-message']))
                                <th>Action</th>
                            @endif
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Sender Name</th>
                            <th>Message</th>
                            <th>Send At</th>
                            @if (Auth::user()->hasPermission(['messages-access', 'reply-message']))
                                <th>Action</th>
                            @endif
                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach ($messages as $m)
                            <tr>
                                <td>{{ $m->id }}</td>
                                <td class="text-capitalize">{{ $m->name }}</td>
                                <td>{!! Str::limit($m->message, 80) !!}</td>
                                <td>{{ $m->created_at }}</td>
                                @if (Auth::user()->hasPermission(['messages-access', 'reply-message']))
                                    <td>
                                        {{-- <button type="button" class="btn btn-primary" data-toggle="modal"
                                        data-target="#reply{{ $m->id }}">
                                        <i class="fas fa-reply"></i> Reply
                                    </button> --}}
                                        @permission('reply-message')
                                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#reply_{{ $m->id }}">
                                                <i class="fa fa-reply"></i> Reply
                                            </button>
                                        @endpermission
                                        @permission('messages-access')
                                            <a href="{{ route('messages.show', $m->sender_id) }}" class="btn btn-dark"><i
                                                    class="fas fa-eye"></i> View</a>
                                        @endpermission
                                    </td>
                                @endif
                            </tr>
                            @permission('reply-message')
                                <!-- Modal -->
                                <div class="modal fade top-30" id="reply_{{ $m->id }}" tabindex="-1" role="dialog"
                                    aria-labelledby="reply_{{ $m->id }}Label" aria-hidden="true">
                                    <form action="{{ route('messages.store') }}" method="post" enctype="multipart/form-data">
                                        @csrf
                                        <div class="modal-dialog" role="document">
                                            <form id="formAuthentication" class="mb-3" action="{{ route('messages.store') }}"
                                                method="POST" enctype="multipart/form-data">
                                                @csrf

                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Reply To: <strong
                                                                class="text-capitalize">{{ $m->name }}</strong></h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" name="reciver_id" value="{{ $m->sender_id }}">
                                                        <x-text-area name="message" label="Message" placeholder="message" />
                                                        <x-input name="files[]" id="inputImage" label="Upload File"
                                                            type="file" multiple />
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Send</button>
                                                    </div>

                                            </form>
                                        </div>
                                </div>
                            @endpermission
            </div>
            </form>
        </div>
        @endforeach
        </tbody>
        </table>
    </div>
    </div>
    </div>
@endsection
