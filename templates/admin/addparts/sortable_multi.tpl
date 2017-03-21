<p class="control has-addons">
    <a class="button is-white">
        <i class="fa fa-navicon"></i>
    </a>
    <textarea name="{$input_name|default:''}" class="textarea" {$style|default:'rows="2"'} placeholder="{$placeholder|default:''}">{$value|default:''}</textarea>
    <a class="button is-white" onclick="((this).parentNode.remove())">
        <i class="fa fa-close"></i>
    </a>
</p>