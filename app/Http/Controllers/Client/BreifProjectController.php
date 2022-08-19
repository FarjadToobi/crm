<?php

namespace App\Http\Controllers\Client;

use Illuminate\Support\Facades\Auth;
use App\Models\LogoForm;
use App\Models\WebsiteForm;
use App\Models\Invoices;
use App\Models\Clients;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class BreifProjectController extends Controller
{
    public function index()
    {
        //
        if (!Auth::user()->hasPermission('add-breif')) abort(403);
        $client = Clients::where('email', '=', Auth::user()->email)->select('id')->first();
        $invoice = Invoices::where('client_id', '=', $client->id)->first();        
        return view('admin.breif.create', compact('invoice'));
    }


    public function create()
    {
        //
        if (!Auth::user()->hasPermission('add-breif')) abort(403);
        $client = Clients::where('email', '=', Auth::user()->email)->select('id')->first();
        $invoice = Invoices::where('client_id', '=', $client->id)->first();   
        return view('admin.breif.create', compact('invoice'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //        
        $files = [];
        if ($request->file('files')) {
            foreach ($request->file('files') as $key => $file) {
                $fileName = time() . rand(1, 99) . '.' . $file->extension();
                $file->move(public_path('files'), $fileName);
                // $files['name'] = $fileName;
                array_push($files, $fileName);
            }
        }   
        
        if ($request->service == "logoservice") {
            $request->validate([
                'title' => 'required',
                'logo_slogan' => 'required',
                'imagery' => 'required',
                'desired_design' => 'required',
                'colors_visual' => 'required',
                'intended_use' => 'required',
                'business_overview' => 'required',
                'target_audience' => 'required',
            ]);
            
            LogoForm::create([
                'logo_name' => $request->title,
                'slogan' => $request->logo_slogan,
                'imagery' => $request->imagery,
                'desired_design' => $request->desired_design,
                'colors_visual' => $request->colors_visual,
                'intended_use' => $request->intended_use,
                'business_overview' => $request->business_overview,
                'target_audience' => $request->target_audience,
                'filesname' =>  json_encode($files),
                'additional_information' => $request->additional_information,
                'user_id' => $request->client_id,
                'invoice_id' => $request->invoice_id,
                'agent_id' => $request->agent_id,
                'brand_id' => $request->brand_id
            ]);
        } else {
            $request->validate([
                'title' => 'required',
                'purpose' => 'required',
                'objective' => 'required',
            ]);
            WebsiteForm::create([
                'website_title' => $request->title,
                'purpose' => $request->purpose,
                'objective' => $request->objective,
                'project_target	' => $request->project_target,
                'brand_target' => $request->brand_target,
                'desired_reaction' => $request->desired_reaction,
                'competitor' => $request->competitor,
                'design' => $request->design,
                'functionality	' => $request->functionality,
                'postive_aspects' => $request->postive_aspects,
                'negative_aspects' => $request->negative_aspects,
                'traffic_levels' => $request->traffic_levels,
                'current_performance' => $request->current_performance,
                'currrent_hosting' => $request->currrent_hosting,
                'negative_hosting' => $request->negative_hosting,
                'filesname' =>  json_encode($files),
                'additional_information' => $request->additional_information,
                'user_id' => $request->client_id,
                'invoice_id' => $request->invoice_id,
                'brand_id' => $request->brand_id,
                'agent_id' => $request->agent_id,
            ]);

            // Project::create([
            //     'name' => $request->title,
            //     'description' => $request->description,
            //     'user_id' => $request->user_id,
            //     'cost' => $request->cost,
            //     'client_id' => $request->client_id,
            //     'brand_id' => $request->brand
            // ]);
        }
        return redirect()->back()->with('success', 'Inserted Successfully');
    }
}