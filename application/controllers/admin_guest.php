<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin_Guest extends Admin_Guest_Controller {

    function __construct()
    {
        parent::__construct();

        $this->auth = new stdClass;

        $this->load->library('flexi_auth');

    }
    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *      http://example.com/index.php/welcome
     *  - or -
     *      http://example.com/index.php/welcome/index
     *  - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */
    public function index()
    {
        $this->load->view('welcome_message');
    }

    public function login()
    {
        // $this->load->view('welcome_message');
        $this->template->render('admin/login');
    }

    public function login_action()
    {
        $this->load->model('flexi_auth_lite_model');
        $this->load->model('flexi_auth_model');

        $remember_user = ((int)$this->input->post('remember_me') === 1);

        $this->flexi_auth_model->login($this->input->post('login_identity'), $this->input->post('login_password'), $remember_user);

        // die($this->flexi_auth->is_logged_in());

        $is_logged_in = $this->flexi_auth->is_logged_in();

        $error = true;
        $message = null;
        if ($is_logged_in) {
            $error = false;
        } else {
            $message = '您所輸入的資料有誤！';
        }

        $result = array(
                'error' => $error,
                'is_logged_in' => $is_logged_in,
                'message' => $message,
                'next_url' => base_url('admin')
            );
        $data = array(
                'result' => $result
            );

        $this->template->render('json', $data);
    }
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */