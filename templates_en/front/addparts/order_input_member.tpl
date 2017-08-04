<div class="input-wrap">
    <button class="delete-btn" onclick="((this).parentNode.remove())"></button>

    <h4 class="sub-ttl">Person</h4>

    <div class="input-area">
        <label class="label">Name</label>
        <div class="input-group">
            <div class="input-field">
                <input class="input medium" name="withSei[]" type="text" placeholder="Last name" value="{$order_data.withSei[$num]|default:''}">
            </div>
            <div class="input-field">
                <input class="input medium" name="withMei[]" type="text" placeholder="First name" value="{$order_data.withMei[$num]|default:''}">
            </div>
        </div>
        {assign var='err_msg_withSei' value='withSei'|cat:$num}
        {assign var='err_msg_withMei' value='withMei'|cat:$num}
        {if isset($err_msg.$err_msg_withSei) && $err_msg.$err_msg_withSei != ''}
        <span class="error has-icon">{$err_msg.$err_msg_withSei}</span>
        {elseif isset($err_msg.$err_msg_withMei) && $err_msg.$err_msg_withMei != ''}
        <span class="error has-icon">{$err_msg.$err_msg_withMei}</span>
        {/if}
    </div>

    <div class="input-area">
        <label class="label">Furigana</label>
        <div class="input-group">
            <div class="input-field">
                <input class="input medium" name="withKanaSei[]" type="text" placeholder="Last name" value="{$order_data.withKanaSei[$num]|default:''}">
            </div>
            <div class="input-field">
                <input class="input medium" name="withKanaMei[]" type="text" placeholder="First name" value="{$order_data.withKanaMei[$num]|default:''}">
            </div>
        </div>
        {assign var='err_msg_withKanaSei' value='withKanaSei'|cat:$num}
        {assign var='err_msg_withKanaMei' value='withKanaMei'|cat:$num}
        {if isset($err_msg.$err_msg_withKanaSei) && $err_msg.$err_msg_withKanaSei != ''}
        <span class="error has-icon">{$err_msg.$err_msg_withKanaSei}</span>
        {elseif isset($err_msg.$err_msg_withKanaMei) && $err_msg.$err_msg_withKanaMei != ''}
        <span class="error has-icon">{$err_msg.$err_msg_withKanaMei}</span>
        {/if}
    </div>

    <div class="input-area">
        <label class="label">Date of Birth</label>
        <div class="input-group">
            <div class="input-field">
                <span class="select">
                    <select name="withBirthdayYear[]" class="short">
                        {section name=i start=1900 loop=($smarty.now|date_format:'%Y')}
                        {assign var='index' value=$smarty.section.i.index}
                        <option value="{$index}" {if ($order_data.withBirthdayYear[$num]|default:1980) == $index}selected{/if}>{$index}</option>
                        {/section}
                    </select>
                </span>
                <span class="notes">/</span>
            </div>
            <div class="input-field">
                <span class="select">
                    <select name="withBirthdayMonth[]" class="short">
                        {section name=i start=1 loop=13}
                        {assign var='index' value=$smarty.section.i.index}
                        <option value="{$index}" {if ($order_data.withBirthdayMonth[$num]|default:1) == $index}selected{/if}>{$index}</option>
                        {/section}
                    </select>
                </span>
                <span class="notes">/</span>
            </div>
            <div class="input-field">
                <select name="withBirthdayDay[]" class="short">
                    {section name=i start=1 loop=32}
                    {assign var='index' value=$smarty.section.i.index}
                    <option value="{$index}" {if ($order_data.withBirthdayDay[$num]|default:1) == $index}selected{/if}>{$index}</option>
                    {/section}
                </select>
                <span class="notes"></span>
            </div>
        </div>
    </div>

    <div class="input-area">
        <label class="label">Sex</label>
        <div class="input-field">
            <input type="radio" id="withmale{$num}" name="withGender[{$num}]" value="1" {if ($order_data.withGender[$num]|default:1) == 1}checked="checked"{/if}> <label for="widthmale{$num}" class="radio">Male</label>
            <input type="radio" id="withfemale{$num}" name="withGender[{$num}]" value="2" {if ($order_data.withGender[$num]|default:1) == 2}checked="checked"{/if}> <label for="widthfemale{$num}" class="radio">Female</label>
        </div>
    </div>

</div>