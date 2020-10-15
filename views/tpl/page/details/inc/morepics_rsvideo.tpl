[{assign var="oConfig" value=$oViewConf->getConfig()}]
[{assign var="oDetailsProduct" value=$oView->getProduct()}]

<div class="modal fade" id="rs_video_popup" data-keyboard="false" data-backdrop="static">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header text-left">
                <h2 class="modal-title rs_cookie_manager_popup_title">[{oxmultilang ident="rs_video_popup_title"}]</h2>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div style="width:100%; height:350px; padding:10px; ">
                    [{$oDetailsProduct->rsvideo_getVideoCode()}]
                </div>
            </div>
        </div>
    </div>
</div>


[{assign var="iMorePics" value=$oView->getIcons()|@count}]
[{math equation="x + 1" x=iMorePics assign=iMorePics}]
[{if $iMorePics > 4}]
    [{oxscript include="js/libs/jquery.flexslider.min.js" priority=2}]
    [{oxstyle include="css/libs/jquery.flexslider.min.css"}]
[{/if}]


<div class="details-picture-more[{if $iMorePics > 4}] flexslider[{/if}]" id="morePicsContainer">
    <ul class="[{if $iMorePics > 4}]slides[{else}]details-picture-more-list[{/if}]">
        [{oxscript add="var aMorePic=new Array();"}]
        [{foreach from=$oView->getIcons() key="iPicNr" item="oArtIcon" name="sMorePics"}]
            [{assign var="sPictureName" value=$oPictureProduct->getPictureFieldValue("oxpic", $iPicNr)}]
            [{assign var="aPictureInfo" value=$oConfig->getMasterPicturePath("product/`$iPicNr`/`$sPictureName`")|@getimagesize}]
            <li class="details-picture-more-list-item">
                <a id="morePics_[{$smarty.foreach.sMorePics.iteration}]"  class="details-picture-more-link[{if $smarty.foreach.sMorePics.first}] selected[{/if}]" href="[{$oPictureProduct->getPictureUrl($iPicNr)}]" data-num="[{$smarty.foreach.sMorePics.iteration}]"[{if $aPictureInfo}] data-width="[{$aPictureInfo.0}]" data-height="[{$aPictureInfo.1}]"[{/if}] data-zoom-url="[{$oPictureProduct->getMasterZoomPictureUrl($iPicNr)}]">
                    <img class="details-picture-more-img" src="[{$oPictureProduct->getIconUrl($iPicNr)}]" alt="morepic-[{$smarty.foreach.sMorePics.iteration}]">
                </a>
            </li>
        [{/foreach}]
        <li class="details-picture-more-list-item">
            <span
               onClick="$('#rs_video_popup').modal('show'); "
                style="cursor:pointer; "
            >
                <img style="width:87px; height:87px; " src="[{$oViewConf->getModuleUrl("rs-video", "out/img/play.png")}]" alt="morepic-[{$iMorePics}]">
            </span>
        </li>
    </ul>
</div>

