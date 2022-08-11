@extends('layouts.app')


@section('content')
<x-header title="Edit Category" description="lorem ipsum" />
<div class="card shadow mb-4">
    <div class="card-header py-3 d-flex justify-content-between align-items-center">
        <h6 class="m-0 font-weight-bold text-primary">Category Form</h6>
        <a href="{{ route('category.index') }}" class="btn btn-info"><i class="fa fa-arrow-circle-left"></i> Back</a>
    </div>
    <div class="card-body">
        <form id="formAuthentication" class="mb-3" action="{{ route('category.update', $category->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="form-row">
                <div class="col-md-4">
                    <x-input name="name" label="Name" type="text" placeholder="Logo" value="{{  $category->name  }}"  />
                </div>
                <div class="col-md-4">
                    <x-select name="status" label="Status" :collection="$status"  :selected="$category->status" />
                </div>
                
            </div>
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>

@endsection