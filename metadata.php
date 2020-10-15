<?php

$sMetadataVersion = '2.0';

$aModule = array(
    'id'          => 'rs-video',
    'title'       => '*RS Video',
    'description' => 'Display videos in the shop',
    'thumbnail'   => '',
    'version'     => '1.0.0',
    'author'      => 'Thomas Janda',
    'url'         => '',
    'email'       => '',
    'extend'           => array(
        \OxidEsales\Eshop\Application\Model\Article::class => rs\video\Application\Model\Article::class,
    ),
    'templates' => array(
        'rs/video/views/tpl/page/details/inc/morepics_rsvideo.tpl'     => 'rs/video/views/tpl/page/details/inc/morepics_rsvideo.tpl',
    ),
    'blocks'      => array(
        array(
            'template' => 'page/details/inc/productmain.tpl',
            'block'    => 'details_productmain_morepics',
            'file'     => '/views/blocks/page/details/inc/morepics__rsvideo.tpl',
        ),
    ),
    'settings'    => array(
        array(
            'group' => 'rs-video_main',
            'name'  => 'rs-video_main_cookie_customer_id',
            'type'  => 'str',
            'value' => 'rsvideo',
        ),
    ),
);
