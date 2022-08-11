@extends('layouts.app')


@section('content')
    <x-header title="Task" description="lorem ipsum" />
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Task Table</h6>
            
        </div>
        <div class="card-body">
            <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th rowspan="1" colspan="1">Sno.</th>
                        <th rowspan="1" colspan="1">Project</th>
                        <th rowspan="1" colspan="1">Description</th>
                        <th rowspan="1" colspan="1">Added By</th>
                        <th rowspan="1" colspan="1">Due Date</th>
                        @if (Auth::user()->hasPermission(['edit-subtask', 'delete-subtask', 'view-subtask']))
                            <th rowspan="1" colspan="1">Action</th>
                        @endif
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th rowspan="1" colspan="1">Sno.</th>
                        <th rowspan="1" colspan="1">Project</th>
                        <th rowspan="1" colspan="1">Description</th>
                        <th rowspan="1" colspan="1">Added By</th>
                        <th rowspan="1" colspan="1">Due Date</th>
                        @if (Auth::user()->hasPermission(['edit-subtask', 'delete-subtask', 'view-subtask']))
                            <th rowspan="1" colspan="1">Action</th>
                        @endif
                    </tr>
                </tfoot>
                <tbody>

                    @foreach ($subtasks as $subtask)
                        <tr class="odd">
                            <td>{{ $subtask->id }}</td>
                            <td>{{ $subtask->id }}</td>
                            <td>{{ $subtask->description }}</td>
                            <td class="text-capitalize">{{ $subtask->user->name }}</td>
                            <td>{{ $subtask->duedate }}</td>
                            {{-- <td>
                                <span
                                    class="btn small {{ $task->status == '1' ? 'btn-success' : ($task->status == '2' ? 'btn-primary' : 'btn-danger') }}">
                                    {{ $task->status == '1' ? 'Complete' : ($task->status == '2' ? 'Re-Open' : 'Open') }}
                                </span>
                            </td>
                            <td>{{ $task->clientfiles ? $task->clientfiles->count : '0' }}</td> --}}
                            {{-- @if (Auth::user()->hasPermission(['edit-task', 'delete-task', 'view-task']))
                                <td>
                                    @permission('edit-task')
                                        <a href="{{ route('task.edit', $task->id) }}" class="btn btn-primary">
                                            <i class="fa fa-edit"></i> Edit
                                        </a>
                                    @endpermission
                                    @permission('view-task')
                                        <a href="{{ route('task.show', $task->id) }}" class="btn btn-info">
                                            <i class="fa fa-eye"></i> View
                                        </a>
                                    @endpermission
                                    @permission('delete-task')
                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#delete_{{ $task->id }}">
                                            <i class="fa fa-trash"></i> Delete
                                        </button>
                                    @endpermission
                                </td>
                            @endif --}}
                        </tr>

                        @permission('delete-task')
                            <!-- Modal -->
                            <div class="modal fade top-30" id="delete_{{ $task->id }}" tabindex="-1" role="dialog"
                                aria-labelledby="delete_{{ $task->id }}Label" aria-hidden="true">
                                <form action="{{ route('task.destroy', $task->id) }}" method="post">
                                    @csrf
                                    @method('DELETE')
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">{{ $task->project->name }}</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <h5>Are You Really Want To Delete this?</h5>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary"
                                                    data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        @endpermission
                        </form>
        </div>
        @endforeach
        </tbody>
        </table>
    </div>
    </div>
@endsection
