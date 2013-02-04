{*
 * $Revision: 1.11 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
  <head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    {* Let Gallery print out anything it wants to put into the <head> element *}
    {g->head}

    {* If Gallery doesn't provide a header, we use the album/photo title (or filename) *}
    {if empty($head.title)}
	{if $theme.item.canContainChildren}
      <title>The Moses Family - {$theme.item.title|default:$theme.item.pathComponent|markup:strip}, {g->date format="%Y" timestamp=$theme.item.originationTimestamp}</title>
	{else}
	<title>The Moses Family - {$theme.item.title|default:$theme.item.pathComponent|markup:strip} - {g->date format="%B %e, %Y" timestamp=$theme.parent.originationTimestamp}</title>
	{/if}
    {/if}

    {if !empty($theme.item.description)}
	<meta name="description" content="{$theme.item.description|markup:strip}" />
    {/if}
    
    <link rel="alternate" type="application/rss+xml" title="The Moses Family (RSS 2.0)" href="http://feeds.feedburner.com/mosii"/>

    {* Include this theme's style sheet *}
	{if $theme.pageType == 'admin'}
    <link rel="stylesheet" type="text/css" href="{g->theme url="admintheme.css"}"/>
	{else}
	<link rel="stylesheet" type="text/css" href="{g->theme url="theme.css"}"/>
	{/if}
	<style>
			.thumbnails {ldelim} 
				max-width: 700px;
			{rdelim}

			.thumbnail {ldelim} 
				display: inline-block;
				vertical-align: top;
				margin: 5px;
			{rdelim}
	</style>
	{include file="/home/deanmoses/includes/pix/tracking-head.inc"}
  </head>
  <body class="gallery {$theme.pageType}">
    <div {g->mainDivAttributes}>
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we
       * don't draw a header, footer, navbar, etc.  Those views are responsible for
       * drawing everything.
       *}
      {if $theme.useFullScreen}
	{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
      {else}
      <div id="gsHeader">
      </div>

      <div id="gsNavBar">
		<div class="gbBreadCrumb">
			{g->block type="core.BreadCrumb"}
		</div>
      </div>

      {* Include the appropriate content type for the page we want to draw. *}
      {if $theme.pageType == 'album'}
		{g->theme include="album.tpl"}
      {elseif $theme.pageType == 'photo'}
		{g->theme include="photo.tpl"}
      {elseif $theme.pageType == 'admin'}
		{g->theme include="admin.tpl"}
      {elseif $theme.pageType == 'module'}
		{g->theme include="module.tpl"}
      {elseif $theme.pageType == 'progressbar'}
		{g->theme include="progressbar.tpl"}
      {/if}

		{* Include the footer & login links on all pages except the photo page. *}
      	{if $theme.pageType != 'photo'}
	      <div id="gsFooter">
			<div class="gbSystemLinks">
			  {g->block type="core.SystemLinks"
				    order="core.SiteAdmin core.YourAccount core.Login core.Logout"
				    othersAt=4}
			</div>
	      </div>
	    {/if}
      
      {/if}  {* end of full screen check *}
    </div>

    {*
     * Give Gallery a chance to output any cleanup code, like javascript that
     * needs to be run at the end of the <body> tag.  If you take this out, some
     * code won't work properly.
     *}
    {g->trailer}

    {* Put any debugging output here, if debugging is enabled *}
    {g->debug}
  </body>
</html>
