<div class="control numbered">
    <div class="control box notification">
        <button class="delete" onclick="((this).parentNode.remove())"></button>
        <nav class="level">
            <!-- Left side -->
            <div class="level-left">
                <div class="level-item">
                <p class="subtitle is-5">
                    <a class="button sortable_button">
                        <i class="fa fa-navicon"></i>
                    </a>
                </p>
                </div>
            </div>
        </nav>
        <label class="label">画像</label>
        <span class="help">横幅800px以上の画像を登録してください。横長画像を推奨。</span>
        {if $photo != ''}
            {assign var='image_style' value=''}
        {else}
            {assign var='image_style' value='display:none;'}
        {/if}
        <div class="control image_btn">
            <label class="button" for="course_img{$number|default:''}">画像を選択してください</label>
            <input type="file" name="course_img{$number|default:''}" id="course_img{$number|default:''}" style="display:none;">
        </div>
        <div class="notification main-image" style="{$image_style}">
            <button class="delete" onclick="$(this).nextAll('input').val('');$(this).parent().hide();return false;"></button>
            <figure class="image">
                <img src="{$photo|default:''}">
            </figure>
            <input name="detail_photo[]" type="hidden" value="{$photo|default:''}" />
        </div>

        <label class="label">タイトル<span class="must">必須</span></label>
        <div class="control">
            <div class="help counter">残り<span class="count"></span>文字</strong></div>
            <input name="detail_title[]" class="input {if $title == ''}is-danger{/if} limited" type="text" placeholder="例：米騒動発祥の地" maxlength="64" value="{$title|default:''}">
            {if isset($err_msg_detail_title) && $err_msg_detail_title != ''}
            <span class="error has-icon">{$err_msg_detail_title}</span>
            {/if}
        </div>

        <label class="label">説明文</label>
        <div class="control">
            <div class="help counter">残り<span class="count">128</span>文字</strong></div>
            <textarea name="detail_description[]" class="textarea limited" placeholder="例：蜃気楼の見える道、”しんきろうロード”は、魚津市の海沿い海岸線を南北に走る道路の通称です。" maxlength="128">{$detail|default:''}</textarea>
        </div>

        <label class="label">外部リンク<br />
            <span class="help">外部リンクを掲載する場合のみ入力してください。</span>
        </label>
        <div class="control">
            <input name="detail_link[]" class="input" type="text" placeholder="例：http://example.com" value="{$link|default:''}">
        </div>
    </div>
</div>