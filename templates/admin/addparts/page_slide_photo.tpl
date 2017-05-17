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
    <div class="control image_btn">
        <label class="button" for="slide_img{$number|default:''}">画像を選択してください</label>
        <input type="file" name="slide_img{$number|default:''}" id="slide_img{$number|default:''}" style="display:none;">
    </div>
    {if $photo != ''}
        {assign var='image_style' value=''}
    {else}
        {assign var='image_style' value='display:none;'}
    {/if}
    <div class="main-image" style="{$image_style}">
        <figure class="image">
            <img src="{$photo|default:''}">
        </figure>
        <input name="slide_photo[]" type="hidden" value="{$photo|default:''}" />
    </div>
</div>