<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 自製化
 */
class MY_Controller extends CI_Controller {


    function __construct()
    {
        parent::__construct();

        // 設定header
        if(preg_match('/application\/json/i', $this->input->server('HTTP_ACCEPT'))){
            $this->output->set_content_type('application/json');
        }

        // 載入my_common
        $this->load->helper('my_common');

        // 設定語系
        set_current_language();

        // 權限檢查
        $this->permissions_check();
    }

    /**
     * 權限檢查
     * @return [type] [description]
     */
    function permissions_check()
    {
        // $this->fb->info($this->router->class);
        // $this->fb->info($this->router->method);
        // 後台首頁不檢查
        // if ()
        // {

        // }
    }
}

/**
 * 後台管理者
 */
class Admin_Controller extends MY_Controller {

    function __construct()
    {
        parent::__construct();

        // 檢查有無登入後台
        if (!$this->admin_login())
        {
            my_redirect('admin_guest/login');
        }

        // 載入jgrid fun
        $this->load->helper('jgrid');
    }

    // 檢查有無登入後台
    function admin_login()
    {
        $bool = false;

        $this->auth = new stdClass;
        $this->load->library('flexi_auth');

        if ($this->flexi_auth->is_logged_in()) {
            $bool = true;
        }

        return $bool;
    }

    // 載入預設model
    function load_default_model()
    {
        $class_name = strtolower(get_class($this));
        $model_name = str_replace('admin_', '', $class_name);
        $this->load->model($model_name . '_model', 'post');
    }
}

/**
 * 後台訪客
 */
class Admin_Guest_Controller extends MY_Controller {
    function __construct()
    {
        parent::__construct();

        if (!$this->input->is_ajax_request()) {
            // 設定後台訪客layout
            $this->template->set_layout('admin/guest_layout');
        }

        $this->template->add_css(site_url('assets/css/admin_guest.css'));

        $this->template->add_js(site_url('assets/js/admin_guest.js'), true);
    }
}

/**
 * 前台瀏覽者
 */
class Guest_Controller extends MY_Controller {
    function __construct()
    {
        parent::__construct();
    }
}

/**
 * 會員
 */
class Member_Controller extends MY_Controller {
    function __construct()
    {
        parent::__construct();
    }
}