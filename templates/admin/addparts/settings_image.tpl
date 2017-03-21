<div class="image_wrap">
    <button class="delete" onclick="((this).parentNode.remove())"></button>
    <figure class="image">
        <img src="{$image_url|default:''}">
    </figure>
    <input name="{$input_name}" type="hidden" value="{$image_url|default:''}" />
</div>