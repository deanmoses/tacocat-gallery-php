{*
 * $Revision: 1.8 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
{if !empty($theme.imageViews)}
{assign var="image" value=$theme.imageViews[$theme.imageViewsIndex]}
{/if}

<center>
<!-- Previous button -->
{if isset($theme.navigator.back)}
<a href="{g->url params=$theme.navigator.back.urlParams}"><img src="http://tacocat.com/pix/img/nav-previous.gif" width="57" height="30" alt="Previous picture" border=0 /></a>
{else}
<img src="http://tacocat.com/pix/img/spacer.gif" width="57" height="30" border=0 />
{/if}

<!-- Index button -->
<a href="./"><img src="http://tacocat.com/pix/img/nav-home.gif" width="57" height="30" alt="Index page" border=0 /></a>

<!-- Next button -->
{if isset($theme.navigator.next)}
<a href="{g->url params=$theme.navigator.next.urlParams}"><img src="http://tacocat.com/pix/img/nav-next.gif"  width="57" height="30" alt="Next picture" border=0 /></a>
{else}
<img src="http://tacocat.com/pix/img/spacer.gif" width="57" height="30" border=0 />
{/if}

		{if !empty($theme.item.description)}
 			<div class="giDescription">
				{$theme.item.description|markup} 
            </div>
		{/if}

 
        <div id="gsImageView" class="gbBlock">
          {if !empty($theme.imageViews)}
	    {capture name="fallback"}
	    <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"
			     forceFullUrl=true forceSessionId=true}">
	      {g->text text="Download %s" arg1=$theme.sourceImage.itemTypeName.1}
	    </a>
	    {/capture}

	    {if ($image.viewInline)}
	      {if isset($theme.photoFrame)}
		{g->container type="imageframe.ImageFrame" frame=$theme.photoFrame
			      width=$image.width height=$image.height}
		  {g->image id="%ID%" item=$theme.item image=$image
			    fallback=$smarty.capture.fallback class="%CLASS%" alt=0 longdesc=0}
		{/g->container}
	      {else}
		{g->image item=$theme.item image=$image fallback=$smarty.capture.fallback alt=0 longdesc=0}
	      {/if}
	    {else}
	      {$smarty.capture.fallback}
	    {/if}
          {else}
            {g->text text="There is nothing to view for this item."}
          {/if}
        </div>

        {if !empty($theme.item.title)}
        <h2 style="margin-bottom: 1em;"> {$theme.item.title|markup} </h2>
        {/if}

        {g->block type="core.PhotoSizes" class="giInfo"}
		
        {* Download link for item in original format *}
        {if !empty($theme.sourceImage) && $theme.sourceImage.mimeType != $theme.item.mimeType}
        <div class="gbBlock">
          <a href="{g->url arg1="view=core.DownloadItem" arg2="itemId=`$theme.item.id`"}">
            {g->text text="Download %s in original format" arg1=$theme.sourceImage.itemTypeName.1}
          </a>
        </div>
        {/if}

{if !empty($theme.item.keywords) }
<p style="color:#888888;">Tags:  {$theme.item.keywords}</p>
{/if}

</center>

        {* Show any other photo blocks (comments, exif etc) *}
        {foreach from=$theme.params.photoBlocks item=block}
          {g->block type=$block.0 params=$block.1}
        {/foreach}
        
        
		{* Disqus commenting system, added by Moses Jan 2011 *}
    	<div id="disqus_thread"></div>
		<script type="text/javascript">
		    var disqus_shortname = 'tacocat';
		    var disqus_identifier = '{$theme.item.id}';
		    var disqus_url = '{g->url arg1="view=core.ShowItem"
arg2="itemId=`$theme.item.id`" forceDirect=true forceFullUrl=true forceSessionId=false}';
		    (function() {ldelim}
		        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
		        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		    {rdelim})();
		</script>


        {g->block type="core.GuestPreview" class="gbBlock"}

        {* Our emergency edit link, if the user all blocks containing edit links *}
	{g->block type="core.EmergencyEditItemLink" class="gbBlock"
                  checkSidebarBlocks=true
                  checkPhotoBlocks=true}
      </div>
