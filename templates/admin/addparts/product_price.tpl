<div class="columns notification">
    <button type="button" class="delete" onclick="$(this).parent().next().remove();$(this).parent().remove();"></button>
    <div class="column">
        <label class="label">料金タイトル</label>
        <p class="control has-icon has-icon-right">
            <span class="select is-fullwidth">
                <select name="plan_title[]">
                <option value="1" {if $plan_title==1}selected{/if}>おとな</option>
                <option value="2" {if $plan_title==2}selected{/if}>こども</option>
                <option value="3" {if $plan_title==3}selected{/if}>その他</option>
                </select>
            </span>
        </p>
    </div>
    <div class="column">
        <label class="label">料金</label>
        <p class="control has-icon has-icon-right">
            <input name="plan_Fee[]" class="input {if $plan_Fee == ''}is-danger{/if}" type="text" placeholder="例：2000" value="{$plan_Fee|default:''}">
            <span class="icon is-small">
                円
            </span>
        </p>
    </div>
    <div class="column">
        <label class="label">料金種別</label>
        <p class="control has-icon has-icon-right">
            <span class="select is-fullwidth">
                <select name="plan_Kind[]">
                <option value="">未選択</option>
                <option value="1" {if $plan_Kind==1}selected{/if}>幼児</option>
                <option value="2" {if $plan_Kind==2}selected{/if}>小学生</option>
                <option value="3" {if $plan_Kind==3}selected{/if}>中学生</option>
                <option value="4" {if $plan_Kind==4}selected{/if}>1台</option>
                <option value="5" {if $plan_Kind==5}selected{/if}>1組</option>
                </select>
            </span>
        </p>
    </div>
</div>
<div></div>