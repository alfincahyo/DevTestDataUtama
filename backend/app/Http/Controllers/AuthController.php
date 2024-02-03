<?php

namespace App\Http\Controllers;

use App\Http\Controllers\API\BaseController;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class AuthController extends BaseController
{
    public function register(Request $request)
    {

        $registerUserData = Validator::make($request->all(), [
            'name' => 'required|string',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|min:8|confirmed',
            'password_confirmation' => 'required|'
        ]);

        if ($registerUserData->fails()) {
            return $this->sendError('Error validation', $registerUserData->errors(), 422);
        }

        DB::beginTransaction();
        try {
            $user = User::create([
                'name' => $request['name'],
                'email' => $request['email'],
                'password' => bcrypt($request['password']),
            ]);

            $success['token'] = $user->createToken($user->name . ' DATAUTAMA')->plainTextToken;
            $success['name'] = $user->name;

            DB::commit();

            return $this->sendResponse($success, 'User created successfully !');
        } catch (Throwable $err) {
            DB::rollBack();
            return $this->sendError('Error !', $err, 500);
        }
    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Error validation', $validator->errors(), 422);
        }

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            $authUser = Auth::user();
            $success['token'] =  $authUser->createToken('MyAuthApp')->plainTextToken;
            $success['name'] =  $authUser->name;

            return $this->sendResponse($success, 'User signed in');
        } else {
            return $this->sendError('Unauthorised.', ['error' => 'Unauthorised']);
        }
    }

    public function logout(Request $request)
    {
        auth('sanctum')->user()->tokens()->delete();
        return $this->sendResponse("success", 'User signed in');
    }
}
