<p class="control has-addons">
    <a class="button">
        <i class="fa fa-navicon"></i>
    </a>
    <span class="select">
    <select name="mt_cancel_ttl[]">
        <option value="1" {if $mt_cancel_ttl == 1}selected{/if}>旅行開始後 無連絡不参加</option>
        <option value="2" {if $mt_cancel_ttl == 2}selected{/if}>当日</option>
        <option value="3" {if $mt_cancel_ttl == 3}selected{/if}>前日</option>
        <option value="4" {if $mt_cancel_ttl == 4}selected{/if}>2日前まで</option>
        <option value="5" {if $mt_cancel_ttl == 5}selected{/if}>3日前まで</option>
        <option value="6" {if $mt_cancel_ttl == 6}selected{/if}>3日から2日前まで</option>
    </select>
    </span>
    <span class="select">
    <select name="MtCancelRatio[]">
        <option value="1" {if $MtCancelRatio == 1}selected{/if}>100%</option>
        <option value="2" {if $MtCancelRatio == 2}selected{/if}>90%</option>
        <option value="3" {if $MtCancelRatio == 3}selected{/if}>80%</option>
        <option value="4" {if $MtCancelRatio == 4}selected{/if}>70%</option>
        <option value="5" {if $MtCancelRatio == 5}selected{/if}>60%</option>
        <option value="6" {if $MtCancelRatio == 6}selected{/if}>50%</option>
        <option value="7" {if $MtCancelRatio == 7}selected{/if}>40%</option>
        <option value="8" {if $MtCancelRatio == 8}selected{/if}>30%</option>
        <option value="9" {if $MtCancelRatio == 9}selected{/if}>20%</option>
        <option value="10" {if $MtCancelRatio == 10}selected{/if}>10%</option>
        <option value="11" {if $MtCancelRatio == 11}selected{/if}>なし</option>
    </select>
    </span>
    <a class="button" onclick="((this).parentNode.remove())">
    <i class="fa fa-close"></i>
    </a>
</p>