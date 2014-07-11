<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * default layout
 * Location: application/views/
 */
$config['template_layout'] = 'admin/json_layout';

/**
 * default css
 */
$config['template_css'] = array(
    // 'http://reset5.googlecode.com/hg/reset.min.css' => 'screen',
    '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css' => 'screen',
    '//code.jquery.com/ui/1.11.0/themes/redmond/jquery-ui.min.css' => 'screen'
    // 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/themes/redmond/jquery-ui.min.css' => 'screen'
    // '/assets/css/index.css' => 'screen'
);

/**
 * default javascript
 * load javascript on header: FALSE
 * load javascript on footer: TRUE
 */
$config['template_js'] = array(
    '//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js' => TRUE,
    '//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js' => TRUE,
    '//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/i18n/jquery-ui-i18n.min.js' => TRUE,
    site_url('assets/js/jquery.noty.packaged.min.js') => TRUE,
    // '//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js' => TRUE,
    site_url('assets/js/common.js') => TRUE
);

/**
 * default variable
 */
$config['template_vars'] = array(
    'site_description' => 'xxxx',
    'site_keywords' => 'xxxx'
);

/**
 * default site title
 */
$config['base_title'] = 'mysite';

/**
 * default title separator
 */
$config['title_separator'] = ' | ';
