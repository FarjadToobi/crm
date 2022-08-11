@extends('layouts.app')

@section('content')

    <x-header title="Invoice" description="lorem ipsum" />
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
            {{-- <a href="{{ route('clients.create') }}" class="btn btn-info"><i class="fa fa-plus-circle"></i> Add New</a> --}}
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Invoice</th>
                            <th>Package</th>
                            <th>Name</th>
                            <th>Agent</th>
                            <th>Brand</th>
                            <th>Amount</th>
                            @if(Auth::user()->hasPermission(['edit-lead','show-lead']))
                            <th>Action</th>
                            @endif
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>ID</th>
                            <th>Invoice</th>
                            <th>Package</th>
                            <th>Name</th>
                            <th>Agent</th>
                            <th>Brand</th>
                            <th>Amount</th>
                            @if(Auth::user()->hasPermission(['edit-lead','show-lead']))
                            <th>Action</th>
                            @endif
                        </tr>
                    </tfoot>
                    <tbody>
                        @foreach ($invoices as $invoice)
                                <tr>
                                    <td>{{ $invoice->id }}</td>
                                    <td><span class="btn btn-dark"># {{ $invoice->invoice_number}}</span></td>
                                    <td>{{$invoice->custom_package}}</td>
                                    <td class="small">{{ $invoice->name }} <br /> {{ $invoice->email }}</td>
                                    <td class="small">{{$invoice->user->name}}<br /> {{$invoice->user->email}}</td>                            
                                    <td><span class="btn btn-blue">{{ $invoice->brands ? $invoice->brands->name : '' }}</span></td> 
                                    <td>{{ $invoice->currencies->sign . $invoice->amount }}</td>
                                    @if(Auth::user()->hasPermission(['edit-lead','show-lead']))                            
                                    <td>
                                        @permission('edit-lead')
                                            <a href="{{route('lead.edit', $invoice->id)}}" class="btn btn-primary"><i class="fa fa-pen"></i> Edit</a>
                                        @endpermission
                                        @permission('show-lead')
                                            <a href="{{route('lead.show', $invoice->id)}}" class="btn btn-dark"><i class="fa fa-eye"></i> View</a>
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
