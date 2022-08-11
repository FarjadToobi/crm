@extends('layouts.app')


@section('content')

    <x-header title="Packages" description="lorem ipsum" />
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Packages Table</h6>
            <a href="{{ route('package.create')}}" class="btn btn-info"><i class="fa fa-plus-circle"></i> Create Package</a>
        </div>
        <div class="card-body">              
            <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <tr>
                        <th rowspan="1" colspan="1">Sno.</th>
                        <th rowspan="1" colspan="1">Name</th>
                        <th rowspan="1" colspan="1">Brand</th>
                        <th rowspan="1" colspan="1">Service</th>
                        <th rowspan="1" colspan="1">Price</th>
                        <th rowspan="1" colspan="1">Status</th>
                        <th rowspan="1" colspan="1">Action</th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <th rowspan="1" colspan="1">Sno.</th>
                        <th rowspan="1" colspan="1">Name</th>
                        <th rowspan="1" colspan="1">Brand</th>
                        <th rowspan="1" colspan="1">Service</th>
                        <th rowspan="1" colspan="1">Price</th>
                        <th rowspan="1" colspan="1">Status</th>
                        <th rowspan="1" colspan="1">Action</th>
                    </tr>
                </tfoot>
                <tbody>    
                    
                    @foreach ($packages as $package)
                        <tr class="odd">
                            <td>{{ $package->id}}</td>
                            <td class="text-capitalize">{{ $package->name }}</td>
                            <td><span class="btn btn-blue">{{$package->brand->name}}</span></td>
                            <td class="text-capitalize">{{$package->service->name}}</td>
                            <td>{{$package->currency->sign . $package->price}}</td>
                            <td><span class="btn small {{ $package->status == '1' ? 'btn-success': 'btn-warning' }}">{{ $package->status == '1' ? 'Active' : 'Deactive'}}</span></td>
                            <td> 
                                <a href="{{route('package.edit', $package->id)}}" class="btn btn-primary">
                                    <i class="fa fa-edit"></i> Edit
                                </a>
                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delete_{{$package->id}}">
                                    <i class="fa fa-trash"></i> Delete
                                </button>
                            </td>
                        </tr>

                            <!-- Modal -->
                            <div class="modal fade top-30" id="delete_{{$package->id}}" tabindex="-1" role="dialog" aria-labelledby="delete_{{$package->id}}Label" aria-hidden="true">
                                <form action="{{route('package.destroy', $package->id)}}" method="post">
                                    @csrf
                                    @method('DELETE')
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">{{ $package->name}}</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <h5>Are You Really Want To Delete this?</h5>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    @endforeach    
                </tbody>
            </table>
        </div>
    </div>




  
@endsection
