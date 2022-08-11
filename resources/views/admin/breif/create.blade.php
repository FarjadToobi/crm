@extends('layouts.app')


@section('content')
    <x-header title="Project Breif" description="lorem ipsum" />
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Breif Form</h6>
            <a href="{{ route('logobreif.index') }}" class="btn btn-info"><i class="fa fa-arrow-circle-left"></i> Back</a>
        </div>
        <div class="card-body">
            @if ($invoice[0]->payment_status != 1)
                <p class="lead text-center">Invoice Not Paid</p>
            @else
                <form id="formAuthentication" class="mb-3" action="{{ route('breif.store') }}" method="POST"
                    enctype="multipart/form-data">
                    @csrf
                    <h4>Details</h4>
                    <div class="form-row">
                        <input type="hidden" name="invoice_id" id="invoice_id" value="{{ $invoice[0]->id }}" />
                        <input type="hidden" name="agent_id" id="agent_id" value="{{ $invoice[0]->sales_agent_id }}" />
                        <input type="hidden" name="client_id" id="client_id" value="{{ $invoice[0]->client_id }}" />
                        <input type="hidden" name="brand_id" id="brand_id" value="{{ $invoice[0]->brand }}" />
                        <input type="hidden" name="cost" id="cost"
                            value="{{ $invoice[0]->currencies->sign . $invoice[0]->amount }}" />
                        <div class="col-md-4">
                            <x-input name="name" label="Name" type="text" placeholder="KFC"
                                value="{{ Auth::user()->name }}" readonly />
                        </div>
                        <div class="col-md-4">
                            <x-input name="email" label="Email" type="email" placeholder="john@doe.com"
                                value="{{ Auth::user()->email }}" readonly />
                        </div>
                        <div class="col-md-4">
                            <x-input name="phone" label="Phone" type="text" placeholder="929023900"
                                value="{{ Auth::user()->contact }}" readonly />
                        </div>
                    </div>
                    <hr>
                    @if ($invoice[0]->services->name == 'Logo designing')
                        <x-logo-form />
                    @else
                        <x-web-form />
                    @endif
                    <hr>
                    <h4>Other Info</h4>
                    <div class="form-row">
                        <div class="col-md-12">
                            <x-input name="files[]" id="inputImage" label="Attachment" type="file" multiple />
                        </div>

                        <div class="col-md-12">
                            <x-text-area name="additional_information" label="Additional Information"
                                placeholder="any other thing you want to say? "
                                value="{{ old('additional_information') }}" />
                        </div>

                    </div>
                    <button type="submit" class="btn btn-primary">Create</button>
                </form>
            @endif

        </div>
    </div>

@endsection
