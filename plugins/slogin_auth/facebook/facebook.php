<?php
defined('_JEXEC') or die;

class plgSlogin_authFacebook extends JPlugin
{
    public function onAuth($url)
    {
        $redirect = JURI::base().'?option=com_slogin&task=check&plugin=facebook';

        $params = array(
            'client_id=' . $this->params->get('id'),
            'redirect_uri=' . urlencode($redirect),
            'scope=email'
        );
        $params = implode('&', $params);

        $url = 'http://www.facebook.com/dialog/oauth?' . $params;
        return $url;
    }

    public function onCheck()
    {
        require_once JPATH_COMPONENT_SITE.'/controller.php';

        $controller = new SLoginController();

        $input = JFactory::getApplication()->input;

        $request = null;

        $code = $input->get('code', null, 'STRING');

        $returnRequest = new SloginRequest();

        if ($code) {

            $redirect = urlencode(JURI::base().'?option=com_slogin&task=check&plugin=facebook');
            //подключение к API
            $params = array(
                'client_id=' . $this->params->get('id'),
                'client_secret=' . $this->params->get('password'),
                'code=' . $code,
                'redirect_uri='. $redirect
            );
            $params = implode('&', $params);
            $url = 'https://graph.facebook.com/oauth/access_token?' . $params;
            $data = $controller->open_http($url);
            parse_str($data, $data_array);

            if(empty($data_array['access_token'])){
                echo 'Error - empty access tocken';
                exit;
            }

// 			Получение данных о пользователе
// 			id, name, first_name, last_name, link, gender, timezone, locale, verified, updated_time
// 			email смотреть параметр scope в методе auth()!

             $ResponseUrl = 'https://graph.facebook.com/me?access_token='.$data_array['access_token'];
             $request_json = $controller->open_http($ResponseUrl);

           // $request_json = '{"id":"391389254371703","email":"sruutuna\u0040gmail.com","first_name":"Niita","gender":"female","last_name":"Bibilashvili","link":"https:\/\/www.facebook.com\/app_scoped_user_id\/391389254371703\/","locale":"en_US","name":"Niita Bibilashvili","timezone":4,"updated_time":"2014-12-25T12:55:58+0000","verified":true}';

            $request = json_decode($request_json);

            if(!empty($request->error)){
                echo 'Error - '. $request->error;
                exit;
            }

            $returnRequest->first_name  = $request->first_name;
            $returnRequest->last_name   = $request->last_name;
            $returnRequest->email       = $request->email;
            $returnRequest->id          = $request->id;
            $returnRequest->real_name   = $request->first_name.' '.$request->last_name;
            $returnRequest->sex         = $request->gender;
            $returnRequest->display_name = $request->name;
            $returnRequest->all_request  = $request;
        }
        return $returnRequest;
    }
    public function onCreateLink( &$links, $add = '')
    {
    	
		
			
        $i = count($links);
        $links[$i]['link'] = 'index.php?option=com_slogin&task=auth&plugin=facebook' . $add;
        $links[$i]['class'] = 'facebookslogin';
        $links[$i]['plugin_name'] = 'facebook';
		return 'OK';
    }
}
