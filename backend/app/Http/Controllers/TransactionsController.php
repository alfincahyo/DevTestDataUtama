<?php

namespace App\Http\Controllers;

use App\Http\Controllers\API\BaseController;
use App\Http\Resources\Transaction as ResourcesTransaction;
use App\Models\Product;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\DataTables;

class TransactionsController extends BaseController
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Transaction::with(['product']);
        $data = DataTables::of($products)->toJson();
        return $data;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'price' => 'required',
            'payment_amount' => 'required',
            'quantity' => 'required',
            'product_id' => 'required'
        ]);

        if ($validator->fails()) {
            return $this->sendError('Error validation', $validator->errors(), 422);
        }

        if ($request->price * $request->quantity != $request->payment_amount) {
            return $this->sendError('Error validation', ["payment_amount" => ["Payment amount wrong"]], 422);
        }

        $getProduct = Product::find($request->product_id);
        $checkStock = $getProduct->stock;
        if ($request->quantity > $checkStock) {
            return $this->sendError('Error validation', ["quantity" => ["Purchase quantity exceeds stock"]], 422);
        }

        $getReferenceAPI = Http::withHeaders([
            'X-API-KEY' => 'DATAUTAMA',
            'X-SIGNATURE' => '8796a8cefcd8b6b00f028751f1f21df1f706e3fa08e8651ad3d32f7b85f9975e'
        ])
            ->acceptJson()
            ->post('http://tes-skill.datautama.com/test-skill/api/v1/transactions', [
                'quantity' => $request->quantity,
                'price' => $request->price,
                'payment_amount' => $request->payment_amount,
            ]);

        if ($getReferenceAPI->failed() || $getReferenceAPI->serverError()) {
            return $this->sendError('Error when getting reference number', [], 500);
        }

        $referenceNumber = (json_decode($getReferenceAPI->getBody()->getContents()))->data->reference_no;

        DB::beginTransaction();
        try {
            $transaction = Transaction::create([
                'reference_no' => $referenceNumber,
                'quantity' => $request['quantity'],
                'price' => $request['price'],
                'payment_amount' => $request['payment_amount'],
                'product_id' => $request['product_id'],
            ]);

            $getProduct->update([
                'stock' => $getProduct->stock - $request->quantity,
            ]);



            DB::commit();

            return $this->sendResponse(new ResourcesTransaction($transaction), 'Transaction created successfully !');
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
