@extends('layouts.app')

@section('content')
    <x-header title="Project" description="lorem ipsum" />
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            {{-- <a href="{{ route('project.create') }}" class="btn btn-info"><i class="fa fa-plus-circle"></i> Add New</a> --}}
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>User Name</th>
                            <th>Brand</th>
                            <th>Amount</th>
                            <th>Categroy</th>
                            <th>Status</th>
                            @if (Auth::user()->hasPermission(['messages-access', 'create-task', 'edit-project']))
                                <th>Action</th>
                            @endif
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>User Name</th>
                            <th>Brand</th>
                            <th>Amount</th>
                            <th>Categroy</th>
                            <th>Status</th>
                            @if (Auth::user()->hasPermission(['messages-access', 'create-task', 'edit-project']))
                                <th>Action</th>
                            @endif
                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach ($projects as $project)
                            <tr>
                                <td>{{ $project->id }}</td>
                                <td class="text-capitalize">{{ $project->name }}</td>
                                <td>{{ $project->client->name }}<br /> {{ $project->client->email }}</td>
                                <td><span class="btn btn-blue">{{ $project->brand->name }}</span></td>
                                <td>{{ $project->cost }}</td>
                                <td>{{ $project->project_category[0]->name }}</td>
                                <td><button
                                        class="btn btn-{{ $project->status == '1' ? 'success' : 'danger' }} ">{{ $project->status == '1' ? 'Active' : 'Deactive' }}
                                    </button>
                                </td>
                                @if (Auth::user()->hasPermission(['messages-access', 'create-task', 'edit-project']))
                                    <td>
                                        @permission('messages-access')
                                            <a href="{{ route('messages.show', $project->client_id) }}" class="btn btn-white"><i
                                                    class="fas fa-comment"></i> Messages</a>
                                        @endpermission
                                        {{-- <a href="{{ route('messages.show', $project->client_id) }}" class="btn btn-info"><i
                                            class="fas fa-copy"></i> View Form</a> --}}
                                        @permission('create-task')
                                            <a href="{{ url('taskproject/' . $project->id) }}" class="btn btn-dark"><i
                                                    class="fa fa-plus"></i> Create Task</a>
                                        @endpermission
                                        @permission('edit-project')
                                            <a href="{{ route('project.edit', $project->id) }}" class="btn btn-primary"><i
                                                    class="fa fa-pen"></i> Edit</a>
                                        @endpermission
                                    </td>
                                @endif
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
