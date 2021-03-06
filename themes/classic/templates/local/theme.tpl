{*
 * $Revision: 1.6 $
 * If you want to customize this file, do not edit it directly since future upgrades
 * may overwrite it.  Instead, copy it into a new directory called "local" and edit that
 * version.  Gallery will look for that file first and use it if it exists.
 *}
<html>
  <head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
    {* Let Gallery print out anything it wants to put into the <head> element *}
    {g->head}

    {* If Gallery doesn't provide a header, we use the album/photo title (or filename) *}
    {if empty($head.title)}
      <title>The Moses Family - {$theme.item.title|default:$theme.item.pathComponent|markup:strip}</title>
    {/if}

    {* Include this theme's style sheet *}
	{if $theme.pageType == 'admin'}
    <link rel="stylesheet" type="text/css" href="{g->theme url="admintheme.css"}"/>
	{else}
	<link rel="stylesheet" type="text/css" href="{g->theme url="theme.css"}"/>
	{/if}
	<link rel="alternate" type="application/rss+xml" title="The Moses Family (RSS 2.0)" href="http://feeds.feedburner.com/mosii"/>
	{include file="/home/deanmoses/includes/pix/tracking-head.inc"}
  </head>
  <body class="year{$theme.item.title|markup:strip} gallery">
    <div {g->mainDivAttributes}>
      {*
       * Some module views (eg slideshow) want the full screen.  So for those, we
       * don't draw a header, footer, navbar, etc.  Those views are responsible for
       * drawing everything.
       *}
      {if $theme.useFullScreen}
	{include file="gallery:`$theme.moduleTemplate`" l10Domain=$theme.moduleL10Domain}
	    </div>
      {else}

      <div id="gsNavBar">
		<h1>Dean, Lucie, Felix and Milo<span> Moses</span></h1>

		<div id="searchbox">
			<!-- Google CSE Search Box Begins -->
			<form id="searchbox_009030535003140709893:vuhlzspqp1m" action="http://tacocat.com/pix/search.html">
			  <input type="hidden" name="cx" value="009030535003140709893:vuhlzspqp1m" />
			  <input name="q" type="text" size="20" />

			  <input type="submit" name="sa" value="Search Site" />
			  <input type="hidden" name="cof" value="FORID:9" />
			</form>
			<!-- Google CSE Search Box Ends -->
		</div>

		<div id="previousYears">
			{capture name=banner assign=year}{$theme.item.title}{/capture}
				<a {if $year eq "2013"}class="currentYear"{/if}href="/pictures/v/2013/">2013</a>
				| <a {if $year eq "2012"}class="currentYear"{/if}href="/pictures/v/2012/">2012</a>
				| <a {if $year eq "2011"}class="currentYear"{/if}href="/pictures/v/2011/">2011</a>
				| <a {if $year eq "2010"}class="currentYear"{/if}href="/pictures/v/2010/">2010</a>
				| <a {if $year eq "2009"}class="currentYear"{/if}href="/pictures/v/2009/">2009</a>
				| <a {if $year eq "2008"}class="currentYear"{/if}href="/pictures/v/2008/">2008</a>
				| <a {if $year eq "2007"}class="currentYear"{/if}href="/pictures/v/2007/">2007</a>
				| <a href="/pix/2006/index.php">2006</a>
				| <a href="/pix/2005/index.php">2005</a>
				| <a href="/pix/2004/index.php">2004</a>
				| <a href="/pix/2003/index.php">2003</a>
				| <a href="/pix/2002/index.php">2002</a>
				| <a href="/pix/2001/index.php">2001</a>
				| <a href="/pix/1973/dean/index.php">1973</a>
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

    </div>
      <div id="gsFooter">
		<div class="gbSystemLinks" style="float:left;">
		  {g->block type="core.SystemLinks"
			    order="core.SiteAdmin core.YourAccount core.Login core.Logout"
			    othersAt=4}		
		</div>
		<div style="width:100%;text-align:right;">
			<a href="http://feeds.feedburner.com/mosii" title="Subscribe to the Moses site" rel="alternate" type="application/rss+xml"><img src="http://tacocat.com/pix/img/feed-icon-orange16x16.png" alt="" style="border: 0pt none ;"></a>
		<div>
		<div style="clear:both;"></div>
      </div>
      {/if}  {* end of full screen check *}

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
