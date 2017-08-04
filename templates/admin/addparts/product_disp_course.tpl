<div class="notification course">
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
    <label class="label">コース名</label>
    <div class="control">
        <div class="help counter">残り<span class="count">64</span>文字</strong></div>
        <input name="disp_course[]" class="input limited" type="text" placeholder="例：午前コース" maxlength="64" value="{$disp_course|default:''}">
    </div>

    <label class="label">代金タイトル<span class="must">必須</span></label>
    <div class="control">
        <div class="help counter">残り<span class="count">16</span>文字</strong></div>
        <input name="disp_price_title[]" class="input {if $disp_price_title == ''}is-danger{/if} limited" type="text" placeholder="例：おひとりさま" maxlength="16" value="{$disp_price_title|default:''}">
        {assign var='err_msg_disp_price_title' value='disp_price_title'|cat:$course_number}
        {if isset($err_msg.$err_msg_disp_price_title) && $err_msg.$err_msg_disp_price_title != ''}
        <span class="error has-icon">{$err_msg.$err_msg_disp_price_title}</span>
        {/if}
    </div>

    <div class="disp_price_container sortable control" data-option="{$course_number}">
        {section name=i start=0 loop=count($disp_price_type)}
            {assign var='index' value=$smarty.section.i.index}
            {if is_array($disp_price_condition) && array_key_exists($index, $disp_price_condition) }
                {assign var='condition' value=$disp_price_condition[$index]}            
            {else}
                {assign var='condition' value=array()}            
            {/if}

            {include file=$smarty.const.ADMIN_DIR|cat:'addparts/product_disp_price.tpl'
                     course_number=$course_number
                     price_number=$index
                     disp_price_type=$disp_price_type[$index]
                     disp_price_value=$disp_price_value[$index]
                     disp_price_condition=$condition
                     err_msg=$err_msg}
        {/section}
    </div>
    <div class="control add-btn add-price">
    <a class="button is-primary">
        <span class="icon">
        <i class="fa fa-plus-circle"></i>
        </span>
        <span>代金を追加</span>
    </a>
    </div>
</div>