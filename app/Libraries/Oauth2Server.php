<?php 

namespace App\Libraries;

use OAuth2\Storage\Pdo;
use OAuth2\Server as Host;

date_default_timezone_set('Asia/Jakarta');

class Oauth2Server {

	private $storage;
	private $server;
	private $request;
	private $response;

	function __construct($config=array()) {
		$DBConfig = new \Config\Database();
		$driver = ($DBConfig->default['DBDriver']=="MySQLi") ? "mysql" : $DBConfig->default['DBDriver'];
		$dsn = $driver.":dbname=".$DBConfig->default['database'].";host=".$DBConfig->default['hostname'];
		$this->storage = new Pdo(array('dsn' => $dsn, 'username' => $DBConfig->default['username'], 'password' => $DBConfig->default['password']));

		$this->server = new Host($this->storage, array(
			'use_jwt_access_tokens' => true
		));

		$this->request = \OAuth2\Request::createFromGlobals();
		$this->response = new \OAuth2\Response();
	}
	

	/**
	* client_credentials, for more see: http://tools.ietf.org/html/rfc6749#section-4.3
	*/
	public function client_credentials() {
		$this->server->addGrantType(new \OAuth2\GrantType\ClientCredentials($this->storage, array(
    		"allow_credentials_in_request_body" => true
		)));
		$this->server->handleTokenRequest($this->request)->send();
	}

	/**
	* password_credentials, for more see: http://tools.ietf.org/html/rfc6749#section-4.3
	*/
	public function password_credentials($request) {
		$json = $request->getJSON();
		$this->server->addGrantType(new Oauth2UserCredentials($this->storage));
		$this->server->handleTokenRequest($this->request)->send();
	}

	/**
	* refresh_token, for more see: http://tools.ietf.org/html/rfc6749#page-74
	*/
	public function refresh_token(){
		$this->server->addGrantType(new \OAuth2\GrantType\RefreshToken($this->storage, array(
			"always_issue_new_refresh_token" => true,
			"unset_refresh_token_after_use" => true,
			"refresh_token_lifetime" => 2419200,
		)));
		$this->server->handleTokenRequest($this->request)->send();
	}

	/**
	* limit scpoe here
	* @param $scope = "node file userinfo"
	*/
	public function require_scope($scope=""){
		if (!$this->server->verifyResourceRequest($this->request, $this->response, $scope)) {
    		$this->server->getResponse()->send();
    		die;
		}
	}

	public function check_client_id(){
		if (!$this->server->validateAuthorizeRequest($this->request, $this->response)) {
    		$this->response->send();
    		die;
		}
	}

	public function authorize($is_authorized){
		$this->server->addGrantType(new \OAuth2\GrantType\AuthorizationCode($this->storage));
		$this->server->handleAuthorizeRequest($this->request, $this->response, $is_authorized);
		if ($is_authorized) {
	  		$code = substr($this->response->getHttpHeader('Location'), strpos($this->response->getHttpHeader('Location'), 'code=')+5, 40);
	  		header("Location: ".$this->response->getHttpHeader('Location'));
	  	}
		$this->response->send();
	}

	public function authorization_code(){
		$this->server->addGrantType(new \OAuth2\GrantType\AuthorizationCode($this->storage));
		$this->server->handleTokenRequest($this->request)->send();
	}

}