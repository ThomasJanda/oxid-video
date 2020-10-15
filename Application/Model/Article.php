<?php

namespace rs\video\Application\Model;

class Article extends Article_parent
{
    public function rsvideo_hasVideo()
    {
        if((bool) $this->oxarticles__rs_has_video->value)
        {
            $id = $this->getConfig()->getConfigParam('rs-video_main_cookie_customer_id');
            if($id!="")
            {
                return \rs\cookiemanager\Core\rs_cookie_manager::userAcceptCookieGroup($id);
            }
        }
        return false;
    }

    public function rsvideo_getVideoCode()
    {
        return $this->oxarticles__rs_video->getRawValue();
    }
}
