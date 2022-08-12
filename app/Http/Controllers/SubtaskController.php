<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SubTask;
use App\Models\Tasks;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class SubtaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        if (!Auth::user()->hasPermission('subtask-access')) abort(403);
        $subtasks = Subtask::all();
        return view('admin.subtask.index', compact('subtasks'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function subtaskbyid($id)
    {
        //
        if (!Auth::user()->hasPermission('create-subtask')) abort(403);
        $task = Tasks::find($id);
        $users = User::whereHas(
            'roles', function($q){
                $q->where('name', 'employee');
            }
        )->get();
        
        return view('admin.subtask.create', compact('id', 'users'));
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
            'due_date' => 'required',
            'description' => 'required',
        ]);

        SubTask::create([
            'task_id' => $request->task,
            'duedate' => $request->due_date,
            'user_id' => $request->user,
            'description' => $request->description,
        ]);
        return back()->with('success', "Insert successfully");
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
        if (!Auth::user()->hasPermission('edit-subtask')) abort(403);
        $subtask = SubTask::find($id);
        $users = User::whereHas(
            'roles', function($q){
                $q->where('name', 'employee');
            }
        )->get();
        return view('admin.subtask.edit', compact('users', 'subtask'));
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
        try{
            $subtask = SubTask::find($id);
            $subtask->description = $request->description;
            $subtask->user_id = $request->user;
            $subtask->duedate = $request->due_date;
            
            $subtask->save();
            
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
        if (!Auth::user()->hasPermission('delete-subtask')) abort(403);
        try {
            SubTask::destroy($id);
            return back()->with('success', "Delete successfully");
        } catch (\Exception $e) {
            return back()->with('error', json_encode($e->getMessage()));
        }
    }
}