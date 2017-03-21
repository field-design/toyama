<div class="control box notification">
    <button class="delete" onclick="((this).parentNode.remove())"></button>
    <nav class="level">
        <!-- Left side -->
        <div class="level-left">
            <div class="level-item">
            <p class="subtitle is-5">
                <a class="button">
                    <i class="fa fa-navicon"></i>
                </a>
            </p>
            </div>
        </div>
    </nav>
    <label class="label">画像</label>
    <span class="help">横幅700px以上の画像を登録してください。</span>
    {if $photo != ''}
        {assign var='image_style' value=''}
    {else}
        {assign var='image_style' value='display:none;'}
    {/if}
    <p class="control image_btn">
        <label class="button" for="course_img{$number|default:''}">画像を選択してください</label>
        <input type="file" name="course_img{$number|default:''}" id="course_img{$number|default:''}" style="display:none;">
    </p>
    <div class="notification main-image" style="{$image_style}">
        <button class="delete" onclick="$(this).nextAll('input').val('');$(this).parent().hide();return false;"></button>
        <figure class="image">
            <img src="{$photo|default:''}">
        </figure>
        <input name="photo[]" type="hidden" value="{$photo|default:''}" />
    </div>
    <label class="label">タイトル</label>
    <p class="control">
        <input name="CourseTitle[]" class="input {if $title == ''}is-danger{/if}" type="text" placeholder="例：米騒動発祥の地" value="{$title|default:''}">
        {if isset($err_msg) && $err_msg != ''}
        <span class="error has-icon">{$err_msg}</span>
        {/if}
    </p>

    <label class="label">説明文</label>
    <p class="control">
        <textarea name="CourseDetail[]" class="textarea" placeholder="例：蜃気楼の見える道、”しんきろうロード”は、魚津市の海沿い海岸線を南北に走る道路の通称です。">{$detail|default:''}</textarea>
    </p>

    <label class="label">外部リンク<br />
        <span class="help">外部リンクを掲載する場合のみ入力してください。</span>
    </label>
    <p class="control">
        <input name="CourseRink[]" class="input" type="text" placeholder="例：http://example.com" value="{$link|default:''}">
    </p>
</div>