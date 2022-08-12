@extends('layouts.app')
@section('content')
    <x-header title="Project Edit" description="lorem ipsum" />

    <form id="formAuthentication" class="mb-3" action="{{ route('project.update', $project->id) }}" method="POST">
        @csrf
        @method('PUT')
        <div class="card shadow mb-4">
            <div class="card-header py-2 d-flex justify-content-between align-items-center">
                <h6 class="m-0 font-weight-bold text-primary">Assign Project</h6>
                <a href="{{ route('project.index') }}" class="btn btn-info"><i class="fa fa-arrow-circle-left"></i> Back</a>
            </div>
            <div class="card-body">
                <div class="form-row">
                    <div class="col-md-4">
                        <x-input name="user_id" label="Added By" type="text" placeholder="John Doe"
                            value="{{ $project->user->name }}" readonly />
                    </div>

                    <div class="col-md-4">
                        <input name="client" type="hidden" value="{{ $project->client->id }}" readonly />
                        <x-input name="client_name" label="Client" type="text" placeholder="John Doe"
                            value="{{ $project->client->name }}" readonly />
                    </div>

                    <div class="col-md-4">
                        <x-input name="brand_id" label="Brand" type="text" placeholder="John Doe"
                            value="{{ $project->brand->name }}" readonly />
                    </div>

                    <div class="col-md-6">
                        <x-input name="name" label="Project Name" type="text" placeholder="John Doe"
                            value="{{ $project->name }}" />
                    </div>
                    <div class="col-md-6">
                        <x-input name="cost" label="Cost" type="text" placeholder="2000"
                            value="{{ $project->cost }}" />
                    </div>


                    <div class="col-md-6">
                        <x-select name="category" label="Categroy" id="category" :collection="$category" :selected="$project->project_category[0]->id" />
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-control @error('status') is-invalid @enderror" id="status" name="status"
                                autofocus="">
                                <option value="1" {{ $project->status == '1' ? 'selected' : '' }}>Complete</option>
                                <option value="0" {{ $project->status == '0' ? 'selected' : '' }}>Inprogress</option>
                            </select>

                            @error('status')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>


                    <div class="col-md-12">
                        <x-textarea name="description" label="Description" type="text" placeholder="lorem ipsum">
                            {{ $project->description }}</x-textarea>
                    </div>

                </div>

                <button type="submit" class="btn btn-primary ">
                    Update
                </button>
            </div>
        </div>


    </form>
@endsection
