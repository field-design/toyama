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
        <label class="label">集合場所<span class="must">必須</span></label>
        <div class="control">
            <div class="help counter">残り<span class="count"></span>文字</strong></div>
            <input name="meeting_place[]" class="input {if $meeting_place == ''}is-danger{/if} limited" type="text" placeholder="例：JR富山駅 新幹線改札前　9:20集合" maxlength="64" value="{$meeting_place|default:''}">
            {if isset($err_msg_meeting_place) && $err_msg_meeting_place != ''}
            <span class="error has-icon">{$err_msg_meeting_place}</span>
            {/if}
        </div>

        <label class="label">住所</label>
        <div class="control">
            <div class="help counter">残り<span class="count"></span>文字</div>
            <input name="meeting_place_address[]" class="input limited" type="text" placeholder="例：富山県富山市明輪町1-225" maxlength="64" value="{$meeting_place_address|default:''}">
        </div>

        <label class="label">座標</label>
        <span class="help">地図のピンを動かして位置を調整してください。</span>
        <div>
            <div class="location-map">
            </div>
        </div>
        <div class="control">
            <input name="coordinate[]" class="input coordinate" type="text" value="{$coordinate|default:''}">
        </div>
    </div>
</div>