@extends('layouts.app')


@section('content')
    <x-header title="Project Breif" description="lorem ipsum" />
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Breif Form</h6>
            <a href="{{ route('logobreif.index') }}" class="btn btn-info"><i class="fa fa-arrow-circle-left"></i> Back</a>
        </div>
        <div class="card-body">
            {{-- @if ($invoice[0]->payment_status != 1)
          <p class="lead text-center">Invoice Not Paid</p>
        @else --}}
            <form id="formAuthentication" action="
            {{ $service == 'Logo' ?  route('logobreif.update', $brief->id) :  route('webbreif.update', $brief->id)}}" class="mb-3" action=""
                method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <h4>Details</h4>
                <div class="form-row">
                    <div class="col-md-4">
                        <x-input name="name" label="Name" type="text" placeholder="KFC"
                            value="{{ $brief->client->name }}" readonly />
                    </div>
                    <div class="col-md-4">
                        <x-input name="email" label="Email" type="email" placeholder="john@doe.com"
                            value="{{ $brief->client->email }}" readonly />
                    </div>
                    <div class="col-md-4">
                        <x-input name="phone" label="Phone" type="text" placeholder="929023900"
                            value="{{ $brief->client->contact }}" readonly />
                    </div>
                </div>
                <hr>
                @if ($service == 'Logo')
                <x-logo-form title="{{ $brief->logo_name }}" slogan="{{ $brief->slogan }}"
                    imagery="{{ $brief->imagery }}" design="{{ $brief->desired_design }}"
                    colors="{{ $brief->colors_visual }}" intended="{{ $brief->intended_use }}"
                    business="{{ $brief->business_overview }}" audience="{{ $brief->target_audience }}" />
                @else
                <x-web-form 
                title="{{ $brief->website_title }}" purpose="{{ $brief->purpose }}"
                    objective="{{ $brief->objective }}" projecttarget="{{ $brief->project_target }}"
                    brandtarget="{{ $brief->brand_target }}" desiredreaction="{{ $brief->desired_reaction }}"
                    competitor="{{ $brief->competitor }}" design="{{ $brief->design }}"
                    functionality="{{ $brief->functionality }}" positiveaspects="{{ $brief->postive_aspects }}"
                    negativeaspects="{{ $brief->negative_aspects }}" trafficlevels="{{ $brief->traffic_levels }}"
                    currentperformance="{{ $brief->current_performance }}" currrenthosting="{{ $brief->currrent_hosting }}" 
                    negativehosting="{{ $brief->negative_hosting }}"
                />
            @endif 
                <hr>
                <h4>Other Info</h4>
                <div class="form-row">
                    <div class="col-md-12">
                        <x-input name="files[]" id="inputImage" label="Attachment" type="file" multiple />
                        @php
                            $filesname = json_decode($brief->filesname);
                        @endphp
                        @if (is_array($filesname))
                            @foreach ($filesname as $file)
                                <img src="{{ url('files/' . $file) }}" class="img-fluid mb-2" width="100" height="100"
                                    alt="{{ $file }}" />
                            @endforeach
                        @else
                            <img src="{{ url('files/' . $brief->filesname) }}" class="img-fluid mb-2" width="100"
                                height="100" alt="{{ $brief->filesname }}" />
                        @endif
                    </div>

                    <div class="col-md-12">
                        <x-text-area name="additional_information" label="Additional Information"
                            placeholder="any other thing you want to say? "> {{ $brief->additional_information }}
                        </x-text-area>
                    </div>

                </div>
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
            {{-- @endif --}}

        </div>
    </div>

@endsection
