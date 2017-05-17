<p class="control has-addons">
    <a class="button sortable_button">
    <i class="fa fa-navicon"></i>
    </a>
    <input name="cancel_charge_text[]" class="input" type="text" placeholder="例：2日前" value="{$cancel_charge_text|default:''}">
    <span class="select">
        <select name="cancel_charge_rate[]">
            {foreach from=ConstantMy::$aryCancelChargeRate key=key item=val}
            <option value="{$key}" {if $cancel_charge_rate == $key}selected{/if}>{$val}</option>                                       
            {/foreach}
        </select>
    </span>
    <a class="button" onclick="((this).parentNode.remove())">
        <i class="fa fa-close"></i>
    </a>
</p>