<div class="control notification">
    <div class="control has-addons" {if $number != 1 && $course_name == '' }style="display:none;"{/if}>
        <a class="button sortable_button">
            <i class="fa fa-navicon"></i>
        </a>
        <input name="course_name[]" class="input is-expanded" type="text" placeholder="例：午前コース" value="{$course_name|default:''}">
        <a class="button remove" onclick="if($(this).next().val() != '') { $(this).prevAll('input').val(''); $(this).parent().parent().hide(); } else { (this).parentNode.parentNode.remove(); }">
            <i class="fa fa-close"></i>
        </a>
        <input name="course_id[]" type="hidden" value="{$course_id|default:''}">
    </div>
    <div class="relation-link">
        <a class="button" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/price/setting/?ProductID={$product_id|default:''}&CourseID={$course_id|default:''}" {if !isset($course_id) || $course_id == '' }disabled{/if}>代金設定</a>
        <a class="button" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/calendar/setting/?ProductID={$product_id|default:''}&CourseID={$course_id|default:''}" {if !isset($course_id) || $course_id == '' }disabled{/if}>予約カレンダー</a>
    </div>
</div>