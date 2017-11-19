<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {

	public function index()
	{
		if(isset($_SESSION['admin_id'])){
			$count['count'] = $this->db->count_all('users');
			$count['post'] = $this->db->count_all('post');
			$this->load->view('pages/layout/Director',$count);	
		}else{
			$this->session->set_flashdata('msg','Signin to access account');
			redirect(base_url().'AdminLogin');
		}
	}
	public function Notification(){
		$this->load->view('pages/notification/notification');
	}
	public function Prizes(){
		$this->db->order_by('date_added','DESC');
		$result['prizes'] = $this->db->get('prize')->result_array();
		$this->load->view('pages/prizes/prizesview',$result);
	}

	public function Themes(){
		$this->db->order_by('created_at','DESC');
		$result['themes'] = $this->db->get('theme')->result_array();
		$this->load->view('pages/theme/themeview',$result);
	}

	public function addTheme(){
		$week = date('W_Y');
		$result = $this->db->get_where('theme',array('week'=>$week));
		if($this->db->affected_rows() > 0){
			$this->session->set_flashdata('msg',"You already added Theme for this week");
			redirect(base_url().'index.php/Dashboard/Themes');
		}else{
			$title = $_POST['title'];
			$startdate = $_POST['startdate'];	
			$enddate = $_POST['enddate'];	
			$theme_name = $_FILES['image']['name'];
			
			$theme_type = explode('.', $theme_name);
			$theme_type = strtolower(end($theme_type));
			$theme_tmpname = $_FILES['image']['tmp_name'];
			$theme_path = 'uploads/theme/'.$week.'.'.$theme_type;
			
			$finalPath =  $theme_path;
			$data['theme_name'] = $title;
			$data['theme_pic'] = $theme_path;
			$data['start_date'] = $startdate;
			$data['end_date'] = $enddate;
			
			$data['week'] = $week;
			date_default_timezone_get("Asia/Kolkata");
			//$data['date_added'] = date('Y-m-d');
			$result = $this->db->insert('theme',$data);
			if($result){
				if(move_uploaded_file($theme_tmpname, $finalPath)){
					$this->session->set_flashdata('msg',"Theme added for current week");
					redirect(base_url().'index.php/Dashboard/Themes');
				}else{
					$this->db->delete('theme',array('week'=>$week));
					$this->session->set_flashdata('msg',"Failed to add theme.");
					redirect(base_url().'index.php/Dashboard/Themes');
				}
			}else{
				echo "upload problem or query died";
			}
		}
		
	}

	public function viewThemeImage($id,$offset){
		//$result['users']=$this->db->get_where('users',array('uid' => $id))->result_array();
		$result['themed'] = $this->db->get_where('theme', array('tid' => $id))->result_array();

		$this->db->select('theme_post.tp_id,theme_post.tid,theme_post.pid,theme_post.uid,theme_post.created_at,theme.theme_name,photos.path,users.`name`');
		//$this->db->from('theme_post');
		
		 $this->db->join('theme', 'theme_post.tid = theme.tid');
		 $this->db->join('post', 'theme_post.pid = post.post_id');
		 $this->db->join('users', 'theme_post.uid = users.uid');
		 $this->db->join('photos', 'post.pid = photos.pid');
		$this->db->where('theme.tid', $id); 
	
		$result['theme'] = $this->db->get('theme_post',12, $offset)->result_array();
		$result['offset'] = $offset;
			$this->db->like('tid', $id);
			$this->db->from('theme_post');
			$result['count'] = $this->db->count_all_results();
		//$result['count'] = $this->db->count_all('theme_post');
		$this->load->view('pages/theme/themeimageview',$result);
	}

	public function deleteTheme($id){
		$prize = $this->db->get('theme',array('tid'=>$id))->result_array();
			foreach ($prize as $value) {
				$path = $value['theme_pic'];
			}
			
		if($this->db->delete('theme',array('tid'=>$id))){
			unlink($path);
			$this->session->set_flashdata('msg',"Theme deleted...");
			redirect(base_url().'index.php/Dashboard/Themes');
		}else{
			$this->session->set_flashdata('msg',"Problem while deleting theme...");
			redirect(base_url().'index.php/Dashboard/Themes');
		}

	}

	public function Users(){
		$this->db->order_by('created_at','DESC');
		$result['users'] = $this->db->get('users')->result_array();
		$this->load->view('pages/users/usersview',$result);
	}

	public function viewProfile($id){
		//$result['users']=$this->db->get_where('users',array('uid' => $id))->result_array();
		$this->db->select('users.uid,users.`name`,users.email,users.mobile,users.dob,avatar.path,users.created_at');
		$this->db->from('users');
		
		$this->db->join('avatar', 'users.uid = avatar.uid');
		$this->db->where('users.uid', $id); 
	
		$result['users'] = $this->db->get()->result_array();

		$this->db->select('photos.path,post.created_at,users.uid,post.post_id');
		$this->db->from('users');
		
		$this->db->join('post', 'users.uid = post.uid');
		$this->db->join('photos', 'post.pid = photos.pid');
		$this->db->where('users.uid', $id); 
		$this->db->order_by('post.created_at','DESC');
		$result['photos'] = $this->db->get()->result_array();

		//$result['users'] = $this->db->get('users')->result_array();
		$this->load->view('pages/users/userprofileview',$result);
	}

	public function addPrize(){
		$week = date('W_Y');
		$result = $this->db->get_where('prize',array('week'=>$week));
		if($this->db->affected_rows() > 0){
			$this->session->set_flashdata('msg',"You already added Prize for this week");
			redirect(base_url().'index.php/Dashboard/Prizes');
		}else{
			$title = $_POST['title'];	
			$prize_name = $_FILES['prize']['name'];
			
			$prize_type = explode('.', $prize_name);
			$prize_type = strtolower(end($prize_type));
			$prize_tmpname = $_FILES['prize']['tmp_name'];
			$prize_path = 'uploads/prize/'.$week.'.'.$prize_type;
			
			$finalPath =  $prize_path;
			$data['title'] = $title;
			$data['image'] = $prize_path;
			$data['week'] = $week;
			date_default_timezone_get("Asia/Kolkata");
			$data['date_added'] = date('Y-m-d');
			$result = $this->db->insert('prize',$data);
			if($result){
				if(move_uploaded_file($prize_tmpname, $finalPath)){
					$this->session->set_flashdata('msg',"Prize added for current week");
					redirect(base_url().'index.php/Dashboard/Prizes');
				}else{
					$this->db->delete('prize',array('week'=>$week));
					$this->session->set_flashdata('msg',"Failed to add prize.");
					redirect(base_url().'index.php/Dashboard/Prizes');
				}
			}else{
				echo "upload problem or query died";
			}
		}
		
	}
	public function deletePrize($id){
		$prize = $this->db->get('prize',array('prize_id'=>$id))->result_array();
			foreach ($prize as $value) {
				$path = $value['image'];
			}
			
		if($this->db->delete('prize',array('prize_id'=>$id))){
			unlink($path);
			$this->session->set_flashdata('msg',"Prize deleted...");
			redirect(base_url().'index.php/Dashboard/Prizes');
		}else{
			$this->session->set_flashdata('msg',"Problem while deleting prize...");
			redirect(base_url().'index.php/Dashboard/Prizes');
		}

	}

	public function Feedback(){
		$this->db->select('users.`name`,feedback.uid,feedback.`subject`,feedback.message,feedback.created_at');
		$this->db->from('feedback');
		
		$this->db->join('users', 'feedback.uid = users.uid');
		
	
		$result['feedback'] = $this->db->get()->result_array();


		
		$this->load->view('pages/feedback/feedbackview',$result);
	}


	public function Inventory(){
		$this->db->order_by('date','DESC');
		$result['inventory'] = $this->db->get('inventory')->result_array();
		$this->load->view('pages/inventory/inventoryview',$result);
	}

	public function addInventory(){
		
			$vender = $_POST['vender-name'];	
			$item_name = $_POST['item-name'];
			$price = $_POST['price'];
			$quantity = $_POST['quantity'];
			$date = $_POST['date'];
			
			$data['vendor'] = $vender;
			$data['item'] = $item_name;
			$data['price'] = $price;
			$data['quantity'] = $quantity;
			$data['date'] = $date;

			$result = $this->db->insert('inventory',$data);
			if($result){
				
					$this->session->set_flashdata('msg',"Entery added successfully");
					redirect(base_url().'index.php/Dashboard/Inventory');
				
			}else{
				$this->session->set_flashdata('msg',"Failed to add entery.");
					redirect(base_url().'index.php/Dashboard/Inventory');
			}
		
		
	}

	public function Winner($offset){
		$this->db->order_by('created_at','DESC');
		$result = $this->db->get('theme', 1, $offset)->result_array();
		$value = $result[0];
		$tid = $value['tid'];
		
		$theme_name = $value['theme_name'];
		

		$this->db->select('weekly_winner.uid,users.`name`,users.email,users.mobile,avatar.path,theme.theme_name,theme.theme_pic,photos.path AS post_img,weekly_winner.rank');
		$this->db->from('weekly_winner');
		$this->db->join('users', 'weekly_winner.uid = users.uid');
		$this->db->join('avatar', 'users.uid = avatar.uid');
		$this->db->join('theme', 'weekly_winner.tid = theme.tid');
		$this->db->join('post', 'weekly_winner.pid = post.post_id');
		$this->db->join('photos', 'post.pid = photos.pid');
		$this->db->where('weekly_winner.tid', $tid); 
		$this->db->order_by('weekly_winner.rank','ASC');
		$result['winner'] = $this->db->get()->result_array();
		$result['themename'] = $theme_name;
		$result['offset'] = $offset;
		$result['count'] = $this->db->count_all('theme');
		$this->load->view('pages/winner/winnerview',$result);
	}
	public function Topper(){
		$this->db->order_by('created_at','DESC');
		$result['weekly_winner'] = $this->db->get('weekly_winner')->result_array();
		$this->load->view('pages/topper/topperview',$result);
	}

	public function Sms(){
		$result['sms']=$this->db->get_where('sms',array('sid' => '1'))->result_array();
		$this->load->view('pages/sms/smsview',$result);
	}

	public function updateSms(){
		$data = array(
               'getway' => $_POST['getway'],
               'key' => $_POST['key'],
               'name' => $_POST['name']
            );

		$this->db->where('sid', '1');
		$result = $this->db->update('sms', $data); 
		if ($result) {
			$this->session->set_flashdata('msg',"SMS update successfully");
			redirect(base_url().'index.php/Dashboard/Sms');
		}else{
			$this->session->set_flashdata('msg',"Failed to update SMS.");
			redirect(base_url().'index.php/Dashboard/Sms');
		}
		
	}

	public function Fcm(){
		$result['fcm']=$this->db->get_where('fcm',array('fid' => '1'))->result_array();
		$this->load->view('pages/fcm/fcmview',$result);
	}

	public function updateFcm(){
		$data = array(
               'project_no' => $_POST['project_no'],
               'api_key' => $_POST['key'],
               'version_no' => $_POST['version']
            );

		$this->db->where('fid', '1');
		$result = $this->db->update('fcm', $data); 
		if ($result) {
			$this->session->set_flashdata('msg',"FCM update successfully");
			redirect(base_url().'index.php/Dashboard/Fcm');
		}else{
			$this->session->set_flashdata('msg',"Failed to update FCM.");
			redirect(base_url().'index.php/Dashboard/Fcm');
		}
		
	}
}
