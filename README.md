# Oxid Cookie Manager

## Description

You can add an embedded video from e.g. YouTube and it will display on the detail page close the the pictures. The 
video will display in an popup. You can add different videos for different languages.

This extension was created for Oxid 6.x. (Wave theme)

## Requirements

"oxid-formedit", "oxid-cookiemanager" module required.

## Install

1. Copy module into following directory
        
        source/modules/rs/video
        
2. Add following to composer.json on the shop root

        "autoload": {
            "psr-4": {
                "rs\\video\\": "./source/modules/rs/video"
            }
        },
    
3. Refresh autoloader files with composer in the oxid root directory.

        composer dump-autoload

4. Execute in Database

        ALTER TABLE `oxarticles` ADD `rs_has_video` TINYINT(1) NOT NULL DEFAULT '0';
        ALTER TABLE `oxarticles` ADD `rs_video` TEXT NOT NULL DEFAULT '';
        ALTER TABLE `oxarticles` ADD `rs_has_video_1` TINYINT(1) NOT NULL DEFAULT '0';
        ALTER TABLE `oxarticles` ADD `rs_video_1` TEXT NOT NULL DEFAULT '';
        ALTER TABLE `oxarticles` ADD `rs_has_video_2` TINYINT(1) NOT NULL DEFAULT '0';
        ALTER TABLE `oxarticles` ADD `rs_video_2` TEXT NOT NULL DEFAULT '';

    Refresh table views.

5. Add to a cookie group, where you ask the user allow videos following the customer id set up in the module settings. By default the customer id is "rsvideo"
