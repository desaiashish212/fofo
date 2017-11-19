<?php

defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';
// use namespace
use Restserver\Libraries\REST_Controller;

class Login extends REST_Controller {
	
	function __construct(){
		parent::__construct();
		$this->load->model('api/v1/user_model');
	}

	public function loginByFacebook_post()
	{
		$email = $this->post('email');
		$name = $this->post('name');
		$loginType = $this->post('loginType');
		$fbId = $this->post('fbId');
		$profilePic = $this->post('profilePic');

		if (!$this->user_model->valid_email($email)) {
			$data=array(
					'name'=>$name,
					'email'=>$email,
					'fb_id'=>$fbId,
					'login_type'=>$loginType
			);
			$result = $this->user_model->insert_user($data);
			if ($result) {
				$data=array(
					'email'=>$email,
				);
				$user = $this->user_model->get_user($data);
				$this->response($user[0], 200);
			}
		}else{
			$data=array(
				'email'=>$email,
				'fb_id'=>$fbId
			);
			$user = $this->user_model->get_user($data);
			$this->response($user[0], 200);

		}
	}	


	public function loginByEmail_post(){
		$userResponse = array();
		 $email = $this->post('email');
		 $password = $this->post('password');

		$data=array(
			'email'=>$email,
			'password'=>$password
		);
		$result=$this->user_model->validate_signin($data);
		if($result!=0) {
			
			$user = $this->user_model->get_user($data);
			$userResponse['user'] = $user[0]; 
			$userResponse['message'] = "Login successfully";
			$userResponse['status'] = 1;
			
			$this->response($userResponse, 200);
		}else{
			$userResponse['message'] = 'Invalid Email or Password';
			$userResponse['status'] = 1;
			$this->response($userResponse, 200);
		}
		
	}

	public function register_post(){
		$response = array();
		$name = $this->post('name');
		$email = $this->post('email');
		$password = $this->post('password');
		$loginType = $this->post('loginType');
		if (!$this->user_model->valid_email($email)) {

			$data=array(
					'name'=>$name,
					'email'=>$email,
					'password'=>$password,
					'login_type'=>$loginType
			);
			$result = $this->user_model->insert_user($data);
			if ($result) {
				$data=array(
					'email'=>$email,
				);
				$user = $this->user_model->get_user($data);
				$response["user"] = $user[0];
				$response["message"] = "Registration successfully";
				$response['status']  = 1;
				$this->response($response, 200);
			}else{
				$response["message"] = "Registration unsuccessfully";
				$response['status']  = 0;
				$this->response($response, 200);
			}

		}else{
			$response["message"] = "Email is already exist";
			$response['status']  = 2;
			$this->response($response, 200);
		}	

	}

}

?>