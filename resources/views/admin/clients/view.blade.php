@extends('layouts.app')


@section('content')
    <!-- Page Heading -->
    <x-header title="View Client Info" description="lorem ipsum" />
    <div class="row">
        <div class="col-md-6">
            <!-- DataTales Example -->
            <div class="card shadow">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary text-capitalize">{{ $client->name }} Detail</h6>
                </div>
                <div class="card-body">              
                    <table class="table table-bordered">
                        <tr>
                            <td><b>Name</b></td>
                            <td class="text-capitalize">{{ $client->name }}</td>
                        </tr>
                        <tr>
                            <td><b>Email</b></td>
                            <td>{{ $client->email }}</td>
                        </tr>
                        <tr>
                            <td><b>Brand</b></td>
                            <td class="text-capitalizes">{{ $client->brand->name }}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <div class="col-md-2 col-sm-6">
            <!-- DataTales Example -->
            <div class="card shadow">
                <div class="card-body text-center lead text-info">              
                    <i class="fa fa-desktop mb-3"></i>
                    <p class="text-black">Paid Invoices</p>      
                    <h4>$0 </h4>
                </div>
            </div>
        </div>
        
        <div class="col-md-2 col-sm-6">
            <!-- DataTales Example -->
            <div class="card shadow">
                <div class="card-body text-center lead text-info">              
                    <i class="fa fa-desktop mb-3"></i>
                    <p class="text-black">Paid Invoices</p>
                    <h4>$0</h4>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-md-12">
            <!-- DataTales Example -->
            <div class="card shadow">
                <div class="card-header py-3 d-flex justify-content-between align-items-center">
                    <h6 class="m-0 font-weight-bold text-primary">Invoices</h6>
                </div>
                <div class="card-body">              
                    <table class="table table-bordered" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th rowspan="1" colspan="1">ID</th>
                                <th rowspan="1" colspan="1">Package Name</th>
                                <th rowspan="1" colspan="1">User Name</th>
                                <th rowspan="1" colspan="1">Agent Name</th>
                                <th rowspan="1" colspan="1">Brand</th>
                                <th rowspan="1" colspan="1">Amount</th>
                                <th rowspan="1" colspan="1">Status</th>
                                <th rowspan="1" colspan="1">Action</th>
                            </tr>
                        </thead>
                        
                        <tfoot>
                            <tr>
                                <th rowspan="1" colspan="1">ID</th>
                                <th rowspan="1" colspan="1">Package Name</th>
                                <th rowspan="1" colspan="1">User Name</th>
                                <th rowspan="1" colspan="1">Agent Name</th>
                                <th rowspan="1" colspan="1">Brand</th>
                                <th rowspan="1" colspan="1">Amount</th>
                                <th rowspan="1" colspan="1">Status</th>
                                <th rowspan="1" colspan="1">Action</th>
                            </tr>
                        </tfoot>

                        
                        <tbody>       
                            @foreach ($client->leads as $lead)
                                <tr>
                                    <td><div class="btn btn-info"># {{ $lead->invoice_number}}</div></td>
                                    <td>{{ $lead->name }}</td>
                                    <td class="small">{{$client->name}}<br /> {{$client->email}}</td>
                                    <td class="small">{{$lead->user->name}}<br /> {{$lead->user->email}}</td>
                                    <td>{{$client->brand->name}}</td>
                                    <td>{{ $lead->currencies->sign . $lead->amount }}</td>
                                    <td>
                                        <button class="btn btn-{{ $lead->payment_status == '1' ? 'success' : 'danger' }} ">{{ $lead->payment_status == '1' ? 'Paid' : 'UnPaid' }} </button>
                                        </td>
                                    <td><a href="{{route('lead.show', $lead->id)}}" class="btn btn-secondary"><i class="fa fa-eye"></i> View</a></td>
                                </tr>
                            @endforeach                                                              
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection
