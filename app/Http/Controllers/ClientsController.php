<?php

namespace App\Http\Controllers;

use App\Models\Clients;
use App\Models\Brands;
use App\Models\Status;
use App\Models\User;
use App\Models\Packages;
use App\Models\Services;
use App\Models\Currencies;
use Facade\FlareClient\Http\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;
use Gate;

class ClientsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        if (!Auth::user()->hasPermission('client-access')) abort(403);
        // abort_if(Gate::denies('show-client'), Response::HTTP_FORBIDDEN, '403 Forbidden');
        $clients = Clients::all();
        return view('admin.clients.index', compact('clients'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        if (!Auth::user()->hasPermission('add-client')) abort(403);
        $brands = Brands::select('id', 'name')->get();
        $status = Status::select('id', 'name')->get();
        return view('admin.clients.create', compact('brands', 'status'));
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
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email',
            'contact' => 'required',
            'brand' => 'required',
            'status' => 'required',
        ]);

        try {
            $clients = new Clients;
            $clients->name = $request->first_name;
            $clients->last_name = $request->last_name;
            $clients->contact = $request->contact;
            $clients->email = $request->email;
            $clients->brand_id = $request->brand;
            $clients->status = $request->status;
            $clients->save();
            return back()->with('success', "Insert successfully");
        } catch (\Exception $e) {
            return back()->with('error', json_encode($e->getMessage()));
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Clients  $clients
     * @return \Illuminate\Http\Response
     */
    public function show(Clients $clients, $id)
    {
        //
        if (!Auth::user()->hasPermission('show-client')) abort(403);
        $client = Clients::find($id);
        return view('admin.clients.view', compact('client'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Clients  $clients
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        if (!Auth::user()->hasPermission('edit-client')) abort(403);
        $client = Clients::find($id);
        $brands = Brands::all();
        $status = Status::select('id', 'name')->get();
        return view('admin.clients.edit', compact('status', 'brands', 'client'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Clients  $clients
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email',
            'contact' => 'required|max:16',
            'brand' => 'required',
            'status' => 'required',
        ]);

        try {
            $clients = Clients::find($id);
            $clients->name = $request->first_name;
            $clients->last_name = $request->last_name;
            $clients->contact = $request->contact;
            $clients->email = $request->email;
            $clients->brand_id = $request->brand;
            $clients->status = $request->status;
            $clients->save();
            return back()->with('success', "Update successfully");
        } catch (\Exception $e) {
            return back()->with('error', json_encode($e->getMessage()));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Clients  $clients
     * @return \Illuminate\Http\Response
     */
    public function destroy(Clients $clients)
    {
        //
    }

    public function clientregister(Request $request, $id)
    {
        if (!Auth::user()->hasPermission('register-client')) abort(403);
        $request->validate([
            'password' => 'required',
        ]);

        try {
            $client = Clients::find($id);

            $user = User::where('email', '=', $client->email)->first();
            if ($user === null) {
                $user =  new User();
                $user->name = $client->name;
                $user->email = $client->email;
                $user->password = Hash::make($request["password"]);
                $user->is_employee = '1';
                $user->save();

                $user->attachRole('client');

                return back()->with('success', "Client Password Inserted");
            }

            $user->attachRole('client');
            $user->password = Hash::make($request["password"]);
            $user->save();

            return back()->with('success', "Client Password Updated");
        } catch (\Exception $e) {
            return back()->with('error', json_encode($e->getMessage()));
        }
    }

    public function lead($id)
    {
        if (!Auth::user()->hasPermission('show-lead')) abort(403);

        $client = Clients::find($id);
        $packages = Packages::all();
        $currencies = Currencies::all();
        $services = Services::all();

        return view('admin.clients.lead', compact('packages', 'currencies', 'services', 'client'));
    }
}