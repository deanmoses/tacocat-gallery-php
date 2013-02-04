{*
 * $Revision: 1.8 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !empty($theme.imageViews)}
	{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}

<div id="left-box">
	{if !empty($theme.item.description)}
		{$theme.item.description|markup} 
	{/if}
</div>

<div id="right-box">

	<div id="nav-buttons">
	<!-- Previous button -->
		{if isset($theme.navigator.back)}
			<a href="{g->url params=$theme.navigator.back.urlParams}"><img src="http://tacocat.com/pix/img/nav-previous.gif" width="57" height="30" alt="Previous picture" border=0 /></a>
		{else}
			<img src="http://tacocat.com/pix/img/spacer.gif" width="57" height="30" border=0 />
		{/if}
		
		<!-- Index button -->
		<a href="./"><img src="http://tacocat.com/pix/img/nav-home.gif" width="57" height="30" alt="Thumbnail page" border=0 /></a>
		
		<!-- Next button -->
		{if isset($theme.navigator.next)}
			<a href="{g->url params=$theme.navigator.next.urlParams}"><img src="http://tacocat.com/pix/img/nav-next.gif"  width="57" height="30" alt="Next picture" border=0 /></a>
		{else}
			<img src="http://tacocat.com/pix/img/spacer.gif" width="57" height="30" border=0 />
		{/if}
	</div>
	
	<!-- photo -->
	{if !empty($theme.imageViews)}
		<!-- img id="the-photo" src="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}" /-->
		
		{g->image id="the-photo" item=$theme.item image=$image fallback=$smarty.capture.fallback alt=0 longdesc=0}
    {else}
        {g->text text="There is nothing to view for this item."}
    {/if}
</div>


<div style="clear:both"> </div>

{if !empty($theme.item.keywords) }
	<p style="color:#888888;">Tags:  {$theme.item.keywords}</p>
{/if}

{* Show any other photo blocks (comments, exif etc) *}
{foreach from=$theme.params.photoBlocks item=block}
  {g->block type=$block.0 params=$block.1}
{/foreach}

{* Emergency edit link, if the user removes all blocks containing edit links *}
{g->block type="core.EmergencyEditItemLink" class="gbBlock"
              checkSidebarBlocks=true
              checkPhotoBlocks=true}
      
