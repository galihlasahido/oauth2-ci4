<?php 

namespace App\Controllers;

use App\Libraries\Oauth2Server as Server;

class RefreshToken extends BaseController {

    function index(){
		@session_start();
		$server = new Server();		
        $server->refresh_token();
    }
}
