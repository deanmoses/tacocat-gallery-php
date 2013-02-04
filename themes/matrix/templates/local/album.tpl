{*
 * $Revision: 1.14 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<h2 style="float:left" id="albumTitle">{$theme.item.title|markup}, {g->date format="%Y" timestamp=$theme.item.originationTimestamp}</h2>

<div id="searchbox" style="text-align:right">
	<!-- Google CSE Search Box Begins -->
	<form id="searchbox_009030535003140709893:vuhlzspqp1m" action="/pix/search.html">
		<input name="cx" value="009030535003140709893:vuhlzspqp1m" type="hidden">
		<input name="q" size="20" type="text">
		<input name="sa" value="Search Site" type="submit">
		<input name="cof" value="FORID:9" type="hidden">
	</form>
	<!-- Google CSE Search Box Ends -->
</div>

<div style="clear:both"> </div>

<div class="albumSeparator"> </div>

     <div id="gsContent" class="gcBorder1">
       <div class="albumText">
               {if !empty($theme.item.description)}
               {$theme.item.description|markup}
               {/if}
       </div>

       {if !empty($theme.navigator)}
       <div class="gbBlock gcBackground2 gbNavigator">
         {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
       </div>
       {/if}

       {if !count($theme.children)}
       <div class="gbBlock giDescription gbEmptyAlbum">
         <h3 class="emptyAlbum">
    {g->text text="This album is empty."}
    {if isset($theme.permissions.core_addDataItem)}
    <br/>
             <a href="{g->url arg1="view=core.ItemAdmin" arg2="subView=core.ItemAdd" arg3="itemId=`$theme.item.id`"}"> {g->text text="Add a photo!"} </a>
    {/if}
         </h3>
       </div>
       {else}
       		<div class="thumbnails">
				{foreach from=$theme.children item=child}
					<div class="thumbnail">
	  {if isset($child.thumbnail)}
		<a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">
			{g->image item=$child image=$child.thumbnail class="giThumbnail" alt=`$child.title` longdesc=" "}
		</a>
	  {else}
	    <a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}"
	       class="giMissingThumbnail">
	      {g->text text="no thumbnail"}
	    </a>
	  {/if}

		{if !empty($child.title)}
			<p class="thumbnailTitle">
				<a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">
			  		{$child.title|markup}
				</a>
			</p>
		{/if}

               {if ($child.canContainChildren && $theme.params.showAlbumOwner) ||
                   (!$child.canContainChildren && $theme.params.showImageOwner)}
               {assign var="showOwner" value=true}
               {else}
               {assign var="showOwner" value=false}
               {/if}

             </div>
             {/foreach}
			</div>
       {/if}

       {if !empty($theme.navigator)}
       <div class="gbBlock gcBackground2 gbNavigator">
         {g->block type="core.Navigator" navigator=$theme.navigator reverseOrder=true}
       </div>
       {/if}

       {g->block type="core.GuestPreview" class="gbBlock"}

       {* Our emergency edit link, if the user removes all blocks containing edit links *}
       {g->block type="core.EmergencyEditItemLink" class="gbBlock"
                  checkSidebarBlocks=true
                  checkAlbumBlocks=true}
	
       {* Show any other album blocks (comments, etc) *}
       {foreach from=$theme.params.albumBlocks item=block}
         {g->block type=$block.0 params=$block.1}
       {/foreach}
     </div>
