<?php

namespace App\Http\Controllers;

use App\Models\Projects;
use App\Models\Clients;
use App\Models\Category;
use App\Models\ProjectCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProjectsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (!Auth::user()->hasPermission('project-access')) abort(403);
        $projects = Projects::whereIn('brand_id', Auth()->user()->brand_list())->get();
        return view('admin.project.index', compact('projects'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        // $client = Clients::where('status', 1)->whereIn('brand_id', Auth()->user()->brand_list())->get();
        $invoice = Invoices::find($id);
        $category = Category::where('status', 1)->get();
        return view('admin.project.create', compact('client', 'category'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'client' => 'required',
            'description' => 'required',
            'status' => 'required',
            'category' => 'required',
        ]);
        $get_client = Clients::where('id', $request->input('client'))->first();
        $request->request->add(['brand_id' => $get_client->brand->id]);
        $request->request->add(['client_id' => $request->input('client')]);
        $request->request->add(['user_id' => auth()->user()->id]);
        $product = Projects::create($request->all());
        
        return redirect()->back()->with('success', 'Project created Successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function show(Projects $project)
    {
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!Auth::user()->hasPermission('edit-project')) abort(403);
        $clients = Clients::where('status', 1)->whereIn('brand_id', Auth()->user()->brand_list())->get();
        $project = Projects::whereIn('brand_id', Auth()->user()->brand_list())->where('id', $id)->first();
        $category = Category::where('status', 1)->get();
        return view('admin.project.edit', compact('project', 'category', 'clients'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Projects $project)
    {
        $request->validate([
            'name' => 'required',
            'client' => 'required',
            'description' => 'required',
            'status' => 'required',
            'category' => 'required',
        ]);
        $get_client = Clients::where('id', $request->input('client'))->first();
        $request->request->add(['brand_id' => $get_client->brand->id]);
        $request->request->add(['client_id' => $request->input('client')]);
        $request->request->add(['user_id' => auth()->user()->id]);
        $project->update($request->all());
        $category = $request->input('category');
        $project->project_category()->sync($category);
        return redirect()->back()->with('success', 'Project Updated Successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function destroy(Projects $project)
    {
        //
    }
}