<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
       $userData = [
        [
            'name' => 'Administrator',
            'username' => 'admin',
            'email' => 'admin@gmail.com',
            'kodeakses' => '1',
            'password' => bcrypt('adminaja')
        ],
        [
            'name' => 'Test User',
            'username' => '12345',
            'email' => 'tes@gmail.com',
            'kodeakses' => '8',
            'password' => bcrypt('qwerty123')
        ],
       ];

       foreach($userData as $key => $val){
        User::create($val);
       }
    }
}
