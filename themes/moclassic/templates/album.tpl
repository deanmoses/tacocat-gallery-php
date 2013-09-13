{*
 * $Revision: 1.12 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<section class="firsts">
	{g->theme include="sidebar.tpl"}
		{if !empty($theme.item.title)}
			{capture name=banner assign=firstsFile}{$theme.item.title}{/capture}
			{if $firstsFile|count_characters eq 4}
	  			{include file="/home/deanmoses/includes/pix/firsts/$firstsFile.tpl"}
			{/if}
		{/if}
</section>
<section class="thumbnails">
	{foreach from=$theme.children item=child}
			<article class="thumbnail">
				<a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">{g->image item=$child image=$child.thumbnail}</a>
				<a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}" style="width:100px" class="title">{$child.originationTimestamp|date_format:"%B %e"}</a>
				<a href="{g->url arg1="view=core.ShowItem" arg2="itemId=`$child.id`"}">{$child.title|default:$child.pathComponent|markup}</a>
				 {if !empty($child.summary)}
	                <p class="summary">{$child.summary|entitytruncate:256|markup}</p>
	             {/if}

			</article>
	  {/foreach}
</section> {* end thumbnails *}

{* Emergency edit link, if the user removes all blocks containing edit links *}
{g->block type="core.EmergencyEditItemLink" class="gbBlock" checkSidebarBlocks=true checkAlbumBlocks=true}