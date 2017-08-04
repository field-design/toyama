<div class="notification course-price">
    <button class="delete" onclick="((this).parentNode.remove())"></button>
    <nav class="level">
        <!-- Left side -->
        <div class="level-left">
            <div class="level-item">
            <p class="subtitle is-5">
                <a class="button sortable_button ui-sortable-handle">
                    <i class="fa fa-navicon"></i>
                </a>
            </p>
            </div>
        </div>
    </nav>
    <div class="columns">
        <div class="column">
            <label class="label">区分<span class="must">必須</span></label>
            <p class="control has-icon has-icon-right">
                <span class="select is-fullwidth">
                <select name="disp_price_type[{$course_number}][]" class="price_type">
                    {foreach from=Constant::$aryPriceType key=key item=val}
                    <option value="{$key}" {if $disp_price_type==$key}selected{/if}>{$val}</option>                                       
                    {/foreach}
                </select>
                </span>
            </p>
        </div>
        <div class="column">
            <label class="label">代金<span class="must">必須</span></label>
            <p class="control has-icon has-icon-right">
                <input name="disp_price_value[{$course_number}][]" class="input {if $disp_price_value == ''}is-danger{/if} price_value" type="text" placeholder="例：2000" value="{$disp_price_value|default:''}">
                <span class="icon is-small">
                円
                </span>
                {assign var='err_msg_disp_price_value' value='disp_price_value'|cat:$course_number|cat:$price_number}
                {if isset($err_msg.$err_msg_disp_price_value) && $err_msg.$err_msg_disp_price_value != ''}
                <span class="error has-icon">{$err_msg.$err_msg_disp_price_value}</span>
                {/if}
            </p>
        </div>
    </div>
    <div>
        <label class="label">条件
            <span class="help">最大5件まで追加可能</span>
        </label>
        <div class="control sortable disp_price_condition_container" data-option="{$course_number * 100 + $price_number}">
            {foreach from=$disp_price_condition item=val}
                {include file=$smarty.const.ADMIN_DIR|cat:'addparts/sortable_single.tpl'
                         placeholder='例：6歳以上'
                         input_name='disp_price_condition['|cat:$course_number|cat:']['|cat:$price_number|cat:'][]' value=$val}
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