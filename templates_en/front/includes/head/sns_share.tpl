<div class="share">
    <ul>
        <li class="facebook">
        	<a href="http://www.facebook.com/share.php?u={$url|default:''}" onclick="window.open(this.href, 'FBwindow', 'width=650, height=450, menubar=no, toolbar=no, scrollbars=yes'); return false;">
	        	<i class="icon-facebook2"></i>
	        	<!-- <span class="count"></span> -->
                <span class="ttl">Like!</span>
	        </a>
		</li>
        <li class="twitter">
        	<a href="http://twitter.com/share?url={$url|default:''}&text={$title|default:''}" onclick="window.open(this.href, 'FBwindow', 'width=650, height=450, menubar=no, toolbar=no, scrollbars=yes'); return false;">
	        	<i class="icon-twitter"></i>
	        	<span class="ttl">Share</span>
	        </a>
		</li>
        <li class="line">
        	<a href="http://line.me/R/msg/text/?{$title|default:''}%0D%0A{$url|default:''}" target="_blank">
	        	<i class="icon-line"></i>
	        	<span class="ttl">Send LINE</span>
	        </a>
		</li>
        <li class="copy">
        	<div class="btn" data-clipboard-text="{$url|default:''}">
	        	<i class="icon-paste"></i>
	        	<span class="ttl">Copy URL</span>
	        </div>
		</li>
    </ul>
    <div class="status">
        <div class="message">
            <p><i class="icon-checkmark" style="color:#00aa71;"></i> Copied</p>
        </div>
    </div>
</div>