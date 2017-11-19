<?php

class User_model extends CI_Model{
	
	public function __construct() {
		parent::__construct();
		$this->load->database();
	}

	//check email is already exist
	public function valid_email($email) {
		return  $this->db->get_where('users',array('email'=> $email))->row();
	}

	//Insert user
	public function insert_user($data){
		return $this->db->insert('users',$data);
	}

	//get user data
	public function get_user($data) {
		$this->db->select('uid,name,email,fb_id as fbId,login_type as loginType');
		
		$q = $this->db->get_where('users',$data);
		if($q->num_rows() > 0)
		{
			return $q->result();
		}
		return null;
	}

	//Validate signin
	public function validate_signin($data){
		
		
		$success=$this->db->get_where('users',$data)->result_array();
		
		if(count($success) > 0)
		{
			foreach ($success as $row){
				$userid = $row['uid'];
			}
			// 			$this->session->set_userdata($userid);
			return $userid;
		}
		else{
						
			return 0;
		}
	}


}	
?>