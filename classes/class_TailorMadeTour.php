<?php
class TailorMadeTour extends dbBasic
{
    function __construct()
    {
        $this->pkey = "tailor_made_tour_id";
        $this->tbl = DB_PREFIX . "tailor_made_tour";
    }

    function getMaxId()
    {
        global $_LANG_ID, $dbconn;

        $res = $dbconn->getAll("SELECT tailor_made_tour_id FROM default_tailor_made_tour WHERE 1=1 order by tailor_made_tour_id desc");
        return intval($res[0]['tailor_made_tour_id']) + 1;
    }

    function getMaxOrderNo()
    {
        $res = $this->getAll("is_trash=0 order by order_no desc limit 0,1");
        return intval($res[0]['order_no']) + 1;
    }

    function checkRegDate($ip)
    {
        $res = $this->getAll('is_trash=0 AND ip_send = "' . $ip . '" order by order_no desc limit 0,1');
        return intval($res[0]['reg_date']);
    }

    function getArray($string)
    {
        if ($string == '' || $string == '|') {
            return array();
        }
        $string = str_replace('||', '|', $string);
        $string = str_replace(',', '|', $string);
        $string = str_replace(':', '|', $string);
        $string = str_replace(';', '|', $string);
        $string = ltrim($string, '|');
        $string = rtrim($string, '|');
        return explode('|', $string);
    }

    function sendMail($data)
    {
        global $core, $clsISO, $clsConfiguration, $_LANG_ID, $email_template_tailor_id;
        #
        $clsEmailTemplate = new EmailTemplate();
        $clsCountry = new _Country();
        $clsCountryEx = new Country();
        $clsTailorTourCity = new TailorTourCity();
        $clsCity = new City();
        $clsTourCategory = new TourCategory();
        $clsTailorProperty = new TailorProperty();
        #
        $email_template_id = $email_template_tailor_id;
        $HTML_TAILOR_INFO = '';
        $customer_country = $clsCountry->getTitle($data['nationality']);

        if (($data['social_media']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Social Media:</strong> ' . $data['social_media'];
        }

        if (($data['arrival_date']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Travel Date:</strong> ' . $data['arrival_date'];
        }

        if (($data['duration']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Duration:</strong> ' . $data['duration'];
        }

        if (($data['budget']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Budget per person:</strong> ' . $data['budget'];
        }

        if (($data['arrival_airport']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Arrival Airport:</strong> ' . $clsTailorProperty->getTitle($data['arrival_airport']);
        }

        if (($data['tour_guide']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Tour guide preference:</strong> ' . $clsTailorProperty->getTitle($data['tour_guide']);
        }

        if (($data['adult']) != 0 || ($data['children']) != 0 || ($data['infant']) != 0) {
            $HTML_TAILOR_INFO .= '<br><strong>Participants:</strong> ';
            $participants = '';
            $participants .= ', ' . isset($data['adult']) . " Adults ";
            $participants .= ', ' . isset($data['children']) . " Children ";
            $participants .= ', ' . isset($data['infant']) . " Infants ";
            $HTML_TAILOR_INFO .= trim($participants, ',');
        }

        if (($data['travel_style']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Travel style:</strong> ' . $clsTourCategory->getTitle($data['travel_style']);
        }

        if (($data['meals']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Meals:</strong> ' . $clsTailorProperty->getTitle($data['meals']);
        }

        if (($data['suitable']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>The most suitable time to reach you:</strong> ' . $data['suitable'];
        }

        if (($data['accommodation']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Accommodations:</strong> ' . $clsTailorProperty->getTitle($data['accommodation']);
        }

        if (($data['special']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Your Special Requirements:</strong> ' . $data['special'];
        }

        if (($data['type_room']) != '') {
            $HTML_TAILOR_INFO .= '<br><strong>Type of room you prefer:</strong> ';
            $type_room = $this->getArray($data['type_room']);
            $textRoom = array_reduce($type_room, function ($carry, $item) use ($clsTailorProperty) {
                $txt = $clsTailorProperty->getTitle($item);
                $carry .= ", " . $txt;
                return $carry;
            }, "");
            $HTML_TAILOR_INFO .= trim($textRoom, ',');
        }

        if (is_array($data['tailor_city'])) {
            foreach ($data['tailor_city'] as $key => $country) {
                $oneCity = $clsTailorTourCity->getOne($country);

                $nameCountry = $clsCountryEx->getTitle($oneCity['country_id']);

                $HTML_TAILOR_INFO .= '<br><strong>' . $nameCountry . "</strong>";
                $listCity = $this->getArray($oneCity['cities']);

                $textCity = array_reduce($listCity, function ($carry, $item) use ($clsCity) {
                    $txt = $clsCity->getTitle($item);
                    $carry .= ", " . $txt;
                    return $carry;
                }, "");

                if ($textCity != '') {
                    $HTML_TAILOR_INFO .= ": " . trim($textCity, ',');
                }
            }
        }

        header('Content-Type: text/html; charset=utf-8');
        $header_email = $clsEmailTemplate->getHeader($email_template_id);
        $body_email = $clsEmailTemplate->getContent($email_template_id);
        $footer_email = $clsEmailTemplate->getFooter($email_template_id);

        $message = '<div style="background-color: rgba(245,245,245,1);padding: 30px 0;">';
        $message .= '<div style="max-width: 620px;margin: 0 auto;border-top: 6px solid #fdd835;border-bottom: 1px solid rgba(247,247,247,1);background-color: rgba(255,255,255,1);">';
        $message .= '<div style="border-bottom: 1px solid rgba(247,247,247,1);padding: 3px 20px 0;">' . $header_email . '</div>';
        $message .= '<div style="padding:20px 20px 8px">' . $body_email . '</div>';
        $message .= '<div style="padding:15px 20px">' . $footer_email . '</div>';
        $message .= '</div></div>';


        $message = str_replace('[%PAGE_NAME%]', PAGE_NAME, $message);
        $message = str_replace('{URL}', 'http://' . $_SERVER['HTTP_HOST'], $message);

        $message = str_replace('[%CUSTOMER_TITLE%]', $data['title'], $message);
        $message = str_replace('[%CUSTOMER_FULLNAME%]', $data['name'], $message);
        $message = str_replace('[%BOOKING_CODE%]', $data['tailor_made_tour_id'], $message);
        $message = str_replace('[%CUSTOMER_COUNTRY%]', $customer_country, $message);
        $message = str_replace('[%CUSTOMER_EMAIL%]', $data['email'], $message);
        $message = str_replace('[%CUSTOMER_PHONE%]', $data['phone'], $message);
        $message = str_replace('[%PLEASE%]', '', $message);
        $message = str_replace('[%HTML_TAILOR_INFO%]', $HTML_TAILOR_INFO, $message);
        #
        $message = str_replace('[%COMPANY_EMAIL%]', $clsConfiguration->getValue('CompanyEmail'), $message);

        $message = str_replace('[%COMPANY_ADDRESS%]', $clsConfiguration->getValue('CompanyAddress_' . $_LANG_ID), $message);
        $message = str_replace('[%COMPANY_PHONE%]', $clsConfiguration->getValue('CompanyPhone'), $message);

        $message = str_replace('[%DATETIME%]', date('Y', time()), $message);
        #

        $from = $clsEmailTemplate->getFromEmail($email_template_id);
        $owner = PAGE_NAME;
        $to = $data['email'];
        $subject = $clsEmailTemplate->getSubject($email_template_id);
        $subject = str_replace('[%PAGE_NAME%]', PAGE_NAME, $subject);
        $is_send_email = $clsISO->sendEmail($from, $to, $subject, $message, $owner);
        return 1;
    }

    function doDelete($tailor_id)
    {
        $clsTailorTourCity = new TailorTourCity();
        $clsTailorTourCity->deleteByCond("tailor_made_tour_id='$tailor_id'");
        $this->deleteOne($tailor_id);
        return 1;
    }
}
