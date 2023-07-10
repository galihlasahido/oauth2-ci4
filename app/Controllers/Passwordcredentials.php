<?php 

namespace App\Controllers;
use App\Libraries\Oauth2Server as Server;

class Passwordcredentials extends BaseController {

    function index() {
		@session_start();
		$server = new Server();
		$server->password_credentials($this->request);
    }
}
