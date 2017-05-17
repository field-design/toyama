<div class="notification main-image">
    <button class="delete" onclick="((this).parentNode.remove())"></button>
    <figure class="image numbered">
        <img src="{$main_photo_url|default:''}">
    </figure>
    <input name="main_photo[]" type="hidden" value="{$main_photo_url|default:''}"/>
</div>