<div class="notification">
    <button class="delete" onclick="((this).parentNode.remove())"></button>
    <div class="columns">
        <div class="column">
            <label class="label">区分<span class="must">必須</span></label>
            <p class="control has-icon has-icon-right">
                <span class="select is-fullwidth">
                <select name="price_type[]" class="price_type">
                    {foreach from=Constant::$aryPriceType key=key item=val}
                    <option value="{$key}" {if $price_type==$key}selected{/if}>{$val}</option>                                       
                    {/foreach}
                </select>
                </span>
                {if isset($err_msg_price_type) && $err_msg_price_type != ''}
                <span class="error has-icon">{$err_msg_price_type}</span>
                {/if}
            </p>
        </div>
        <div class="column">
            <label class="label">代金<span class="must">必須</span></label>
            <p class="control has-icon has-icon-right">
                <input name="price_value[]" class="input price_value" type="text" placeholder="例：2000" value="{$price_value|default:''}">
                <span class="icon is-small">
                円
                </span>
                {if isset($err_msg_price_value) && $err_msg_price_value != ''}
                <span class="error has-icon">{$err_msg_price_value}</span>
                {/if}
            </p>
        </div>
    </div>
    <div>
        <label class="label">条件
            <span class="help">最大5件まで追加可能</span>
        </label>
        <div class="control sortable price_condition_container" data-option="{$number}">
            {foreach from=$price_condition item=val}
                {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_single.tpl' placeholder='例：6歳以上' input_name='price_condition'|cat:$number|cat:'[]' value=$val}
            {/foreach}
        </div>
        <div class="control add-btn add-condition">
        <a class="button is-primary">
            <span class="icon">
            <i class="fa fa-plus-circle"></i>
            </span>
            <span>条件を追加</span>
        </a>
        </div>
    </div>
</div>