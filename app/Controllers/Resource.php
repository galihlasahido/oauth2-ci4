<?php 

namespace App\Controllers;

use App\Libraries\Oauth2Server as Server;

class Resource extends BaseController {

    public function index() {
		@session_start();
		$server = new Server();
		$server->require_scope("userinfo cloud file node");//you can require scope here 
        echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));
    }
}
