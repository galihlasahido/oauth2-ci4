<?php 

namespace App\Controllers;

use App\Libraries\Oauth2Server as Server;

class Clientcredentials extends BaseController {


    function index(){
		@session_start();
		$server = new Server();		
        $server->client_credentials();
    }
}
