<?php

namespace App\Http\Controllers;

use App\Models\Brands;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Currencies;
use App\Models\Invoices;
use App\Models\Projects;
use App\Models\UserRole;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $paidinvoice = Invoices::groupBy('currency')->where('payment_status', '=', '1')->select('currency',  \DB::raw('sum(amount) as amount'))->get();
        $unpaidinvoice = Invoices::groupBy('currency')->where('payment_status', '=', '0')->select('currency',  \DB::raw('sum(amount) as amount'))->get();

        $category = Category::where('status', '=', '1')->count();
        $brand = Brands::where('status', '=', '1')->count();
        $currency = Currencies::count();
        $projects = Projects::where('status', '=', '1')->count();
        $leads = Invoices::count();
        $paidleads = Invoices::where('payment_status', '=', '1')->count();
        $unpaidleads = Invoices::where('payment_status', '=', '0')->count();
        $sales = UserRole::groupBy('role_id')->where('role_id', '=', '2')->count();
        $production = UserRole::groupBy('role_id')->where('role_id', '=', '3')->count();

        return view('home', compact(
            'paidinvoice',
            'unpaidinvoice',
            'category',
            'brand',
            'currency',
            'projects',
            'leads',
            'paidleads',
            'unpaidleads',
            'production',
            'sales'
        ));
    }
}