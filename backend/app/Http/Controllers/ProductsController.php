<?php

namespace App\Http\Controllers;

use App\Http\Controllers\API\BaseController;
use App\Http\Resources\product as ResourcesProduct;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class ProductsController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $products = Product::all();
        $data = DataTables::of($products)->toJson();
        return $data;
    }

    public function getAll(Request $request)
    {
        $products = Product::all();
        return $this->sendResponse(ResourcesProduct::collection($products), 'Products fetched !`');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'price' => 'required',
            'stock' => 'required',
            'description' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError('Error validation', $validator->errors(), 422);
        }

        DB::beginTransaction();
        try {
            $product = Product::create([
                'name' => $request['name'],
                'price' => $request['price'],
                'stock' => $request['stock'],
                'description' => $request['description'],
            ]);

            DB::commit();

            return $this->sendResponse(new ResourcesProduct($product), 'Product created successfully !');
        } catch (\Throwable $err) {
            DB::rollBack();
            return $this->sendError('Error !', $err, 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        try {
            $product = Product::find($id);
            return $this->sendResponse(new ResourcesProduct($product), 'Product successfully found !');
        } catch (\Throwable $err) {
            DB::rollBack();
            return $this->sendError('Error !', $err, 500);
        }
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Product $product)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'price' => 'required',
            'stock' => 'required',
            'description' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError('Error validation', $validator->errors(), 422);
        }

        DB::beginTransaction();
        try {
            $product->name = $request->name;
            $product->price = $request->price;
            $product->stock = $request->stock;
            $product->description = $request->description;
            $product->save();

            DB::commit();

            return $this->sendResponse(new ResourcesProduct($product), 'Product updated successfully !');
        } catch (\Throwable $err) {
            DB::rollBack();
            return $this->sendError('Error !', $err, 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Product $product)
    {
        DB::beginTransaction();
        try {
            $product->delete();
            DB::commit();

            return $this->sendResponse([], 'Product updated successfully !');
        } catch (\Throwable $err) {
            DB::rollBack();
            return $this->sendError('Error !', $err, 500);
        }
    }
}
