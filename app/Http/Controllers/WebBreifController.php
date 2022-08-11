<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\WebsiteForm;

class WebBreifController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        if (!Auth::user()->hasPermission('webbreif-access')) abort(403);
        $breifs = WebsiteForm::all();
        return view('admin.breif.webbreif.index', compact('breifs'));
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        if (!Auth::user()->hasPermission('show-webbreif')) abort(403);
        $breifs = WebsiteForm::find($id);        
        return view('admin.breif.webbreif.view', compact('breifs'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        if (!Auth::user()->hasPermission('edit-webbreif')) abort(403);
        $brief = WebsiteForm::find($id);
        $service = 'Web';
        return view('admin.breif.edit', compact('brief', 'service'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $request->validate([
            'title' => 'required',
        ]);

        try {
            $webbrief = WebsiteForm::find($id);
            $webbrief->website_title = $request->title;

            $webbrief->purpose = $request->purpose;
            $webbrief->objective = $request->objective;
            $webbrief->project_target = $request->project_target;
            $webbrief->brand_target = $request->brand_target;
            $webbrief->desired_reaction = $request->desired_reaction;
            $webbrief->competitor = $request->competitor;
            $webbrief->design = $request->design;
            $webbrief->functionality = $request->functionality;
            $webbrief->postive_aspects = $request->positive_aspects;
            $webbrief->negative_aspects = $request->negative_aspects;
            $webbrief->traffic_levels = $request->traffic_levels;
            $webbrief->current_performance = $request->current_performance;
            $webbrief->currrent_hosting = $request->currrent_hosting;
            $webbrief->negative_hosting = $request->negative_hosting;
            $webbrief->user_id = Auth::id();

            $webbrief->save();            
            return back()->with('success', "Update successfully");
        } catch (\Exception $e) {
            return back()->with('error', json_encode($e->getMessage()));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}