<footer class="global-footer">
    <div data-lg>
        <nav class="nav-footer">
            <table>
                <tbody>
                    <tr>
                        <td><a href="/">トップページ</a></td>
                        <td colspan="2"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">ツアーの一覧</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/">越中にいかわ観光圏</a></td>
                        <td>ジャンルでえらぶ</td>
                        <td>地域でえらぶ</td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/about/">越中にいかわ観光圏とは</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 0, 1, true))}">{current(array_slice(Constant::$aryCategory, 0, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 0, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 0, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}contact/">お問い合わせ</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 1, 1, true))}">{current(array_slice(Constant::$aryCategory, 1, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 1, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 1, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}guide/">サイトのご利用案内</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 2, 1, true))}">{current(array_slice(Constant::$aryCategory, 2, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 2, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 2, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="https://www.kanko-pro.co.jp/privacy/" target="_blank">プライバシーポリシー</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 3, 1, true))}">{current(array_slice(Constant::$aryCategory, 3, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 3, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 3, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}law/">特定商取引法に基づく表記</a></td>
                    </tr>
                </tbody>
            </table>
        </nav>
        <p class="copyright">
            サイト運営管理：<a target="_blank" href="https://www.kanko-pro.co.jp/">株式会社観光販売システムズ</a><br>
            Copyright(C) Eravel Travel All rights reserved.
        </p>
    </div>
</footer>