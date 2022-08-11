<?php

namespace App\Http\Controllers\Client;

use Auth;
use App\Models\Messages;
use App\Models\MessageFiles;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class Chats extends Controller
{
    //
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $messages = Messages::where('sender_id', Auth::id())->orwhere('reciver_id', Auth::id())->latest()->get();
        return view('admin.messages.index', compact('messages'));
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
            'message' => 'required',
        ]);

        $messages = Messages::create([
            'name' => Auth::user()->name,
            'message' => $request->message,
            'sender_id' => Auth::id()
        ]);


        if ($request->file('files')) {
            $files = [];
            foreach ($request->file('files') as $key => $file) {
                $fileName = time() . rand(1, 99) . '.' . $file->extension();
                $file->move(public_path('files'), $fileName);
                $files[]['name'] = $fileName;
            }
            foreach ($files as $file) {
                foreach ($file as $f) {
                    MessageFiles::create([
                        'file' => $f,
                        'message_id' => $messages->id,
                    ]);
                }
            }
        }



        return redirect()->back()->with('success', 'Inserted Successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Messages  $messages
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $messages = Messages::where('sender_id', $id)->orwhere('reciver_id', $id)->latest()->get();
        return view('admin.messages.index', compact('messages'));
    }

}