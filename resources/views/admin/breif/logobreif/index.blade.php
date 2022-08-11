@extends('layouts.app')

@section('content')
    <x-header title="Brefis" description="lorem ipsum" />
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Brefis Example</h6>
            @role('client')
                <a href="{{ route('breif.create') }}" class="btn btn-info"><i class="fa fa-plus-circle"></i> Add New</a>
            @endrole
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>Invoice No.</th>
                            <th>Title</th>
                            <th>Slogan</th>
                            <th>Files</th>
                            <th>Client</th>
                            <th>Agent</th>
                            @if (Auth::user()->hasPermission(['edit-logobreif', 'show-logobreif']))
                                <th>Action</th>
                            @endif
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Invoice No.</th>
                            <th>Title</th>
                            <th>Slogan</th>
                            <th>Files</th>
                            <th>Client</th>
                            <th>Agent</th>
                            @if (Auth::user()->hasPermission(['edit-logobreif', 'show-logobreif']))
                                <th>Action</th>
                            @endif
                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach ($breifs as $breif)
                            <tr>
                                <td><span class="btn btn-dark">#{{ $breif->invoice->invoice_number }}</span></td>
                                <td class="text-capitalize">{{ $breif->logo_name }}</td>
                                <td>{{ $breif->slogan}}</td>
                                <td>
                                    @php
                                        $filesname = json_decode($breif->filesname)
                                    @endphp 
                                    @if(is_array($filesname))
                                    {{ count($filesname)}}
                                    {{-- @else
                                        1 --}}
                                    @endif   
                                </td>
                                <td>{{ $breif->client->name }}</td>
                                <td>{{ $breif->agent->name }}</td>
                                @if (Auth::user()->hasPermission(['edit-logobreif', 'show-logobreif']))
                                    <td>                                        
                                        @permission('project-assign')
                                            <button type="button" class="btn btn-info" data-toggle="modal"
                                                data-target="#assign_{{ $breif->id }}">
                                                <i class="fa fa-user"></i> Assign
                                            </button>
                                        @endpermission                                        
                                        @permission('edit-logobreif')
                                            <a href="{{ route('logobreif.edit', $breif->id) }}" class="btn btn-primary"><i
                                                    class="fas fa-pen"></i> Edit</a>
                                        @endpermission
                                        @permission('show-logobreif')
                                            <a href="{{ route('logobreif.show', $breif->id) }}" class="btn btn-dark"><i
                                                    class="fas fa-eye"></i> View</a>
                                        @endpermission
                                    </td>
                                @endif
                            </tr>
                            @permission('project-assign')
                            <!-- Modal -->
                            <div class="modal fade top-30" id="assign_{{ $breif->id }}" tabindex="-1" role="dialog"
                                aria-labelledby="assign_{{ $breif->id }}Label" aria-hidden="true">
                                <form action="{{ route("project.store") }}" method="post">
                                    @csrf
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Project: {{ $breif->logo_name }}</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="client" value="{{$breif->user_id}}" />
                                                <x-select name="assignto" label="Assign To" :collection="$users"  />
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-primary">Assign</button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        @endpermission
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
