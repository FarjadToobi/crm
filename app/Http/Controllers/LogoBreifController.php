<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\LogoForm;
use App\Models\User;
use App\Models\Invoices;
use App\Models\Projects;
use App\Models\ProjectCategory;

class LogoBreifController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        if (!Auth::user()->hasPermission('logobreif-access')) abort(403);
        $breifs = LogoForm::all();

        $users = User::whereHas(
            'roles', function($q){
                $q->where('name', 'team lead');
            }
        )->get();
        
        return view('admin.breif.logobreif.index', compact('breifs', 'users'));
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
        if (!Auth::user()->hasPermission('show-logobreif')) abort(403);
        $logobrief = LogoForm::find($id);
        return view('admin.breif.logobreif.view', compact('logobrief'));
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
        if (!Auth::user()->hasPermission('edit-logobreif')) abort(403);
        $brief = LogoForm::find($id);
        $service = 'Logo';
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
        // dd($request->all());
        $request->validate([
            'title' => 'required',
            'logo_slogan' => 'required',
        ]);

        try {
            $logobrief = LogoForm::find($id);
            $logobrief->logo_name = $request->title;
            $logobrief->slogan = $request->logo_slogan;
            $logobrief->imagery = $request->imagery;
            $logobrief->desired_design = $request->desired_design;
            $logobrief->colors_visual = $request->colors_visual;
            $logobrief->intended_use = $request->intended_use;
            $logobrief->business_overview = $request->business_overview;
            $logobrief->target_audience = $request->target_audience;
            $logobrief->user_id = Auth::id();

            $logobrief->save();
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