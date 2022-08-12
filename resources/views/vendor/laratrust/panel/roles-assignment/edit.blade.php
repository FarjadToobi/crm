@extends('laratrust::panel.layout')


@section('content')
    <x-header title="Edit User" description="lorem ipsum" />
    <div class="card shadow mb-4">
        <div class="card-header py-3 d-flex justify-content-between align-items-center">
            <h6 class="m-0 font-weight-bold text-primary">Roles Assign</h6>
            <a href="{{ route('laratrust.roles-assignment.index', ['model' => $modelKey]) }}" class="btn btn-info"><i
                    class="fa fa-arrow-circle-left"></i> Back</a>
        </div>
        <div class="card-body">
            <form id="formAuthentication" class="mb-3"
                action="{{ route('laratrust.roles-assignment.update', ['roles_assignment' => $user->getKey(), 'model' => $modelKey]) }}"
                method="POST">
                @csrf
                @method('PUT')
                <div class="form-row">
                    <div class="col-md-6">
                        <x-input name="name" label="Name" type="text" placeholder="Username"
                            value="{{ $user->name ?? 'The model doesn\'t have a `name` attribute' }}" autocomplete="off" />
                    </div>
                    <div class="col-md-6">
                        <x-input name="email" label="Email" type="email" placeholder="Email"
                            value="{{ $user->email ?? 'The model doesn\'t have a `name` attribute' }}" autocomplete="off" />
                    </div>
                    {{-- <div class="col-md-6">
                        <x-select name="role" label="Role" :collection="$roles" />
                    </div> --}}

                    
                    <div class="col-md-12">
                        <span class="block text-gray-700 mt-4">Categories</span>
                        <div class="form-check">
                            
                            @foreach ($categories as $key => $category)
                                <input type="checkbox" class="form-check-input" name="category[]" value="{{ $category->id }}"
                                    id="category_{{ $category->id }}"  
                                    @if (count($user->category->pluck('id')) > 0))
                                        @foreach ($user->category->pluck('id') as $checkcategory)
                                        {{ $checkcategory == $category->id ? 'checked' : '' }}
                                        @endforeach
                                    @endif    
                                    >
                                <label class="form-check-label mr-5" for="category_{{ $category->id }}">
                                    <span class="ml-2">
                                        {{ $category->name }}
                                    </span>
                                </label>
                            @endforeach
                        </div>
                    </div>

                    <div class="col-md-12 mb-4">
                        <span class="block text-gray-700 mt-4">Roles</span>
                        <div class="form-check">
                            @foreach ($roles as $role)
                                <input type="checkbox" class="form-check-input" name="roles[]" value="{{ $role->getKey() }}"
                                    {!! $role->assigned ? 'checked' : '' !!} id="role_{{ $role->getKey() }}">
                                <label class="form-check-label mr-5" for="role_{{ $role->getKey() }}">
                                    <span class="ml-2 {!! $role->assigned && !$role->isRemovable ? 'text-gray-600' : '' !!}">
                                        {{ $role->display_name ?? $role->name }}
                                    </span>
                                </label>
                            @endforeach
                        </div>
                    </div>
                    {{-- @if ($permissions)
                <div class="col-md-12 mb-3">
                  <span class="block text-gray-700 mt-4">Permissions</span>
                  <div class="row">
                    @foreach ($permissions as $permission)
                        <div class="col-md-2 mx-4">
                          <input
                          type="checkbox"
                          class="form-check-input"
                          name="permissions[]"
                          value="{{$permission->getKey()}}"
                          {!! $permission->assigned ? 'checked' : '' !!}
                          id="permission_{{$permission->getKey()}}"
                        >
                        <label class="form-check-label mr-5" for="permission_{{$permission->getKey()}}">
                          <span class="ml-2">{{$permission->display_name ?? $permission->name}}</span>
                        </label>
                        </div>
                    @endforeach
                  </div>
                </div>
              @endif --}}
                </div>
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>
    </div>
@endsection
