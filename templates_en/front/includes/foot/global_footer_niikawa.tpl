<footer class="global-footer">
    <div data-lg>
        <nav class="nav-footer">
            <table>
                <tbody>
                    <tr>
                        <td><a href="/">Home</a></td>
                        <td colspan="2"><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/">List of Tours</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/">Ettyu Niikawa Kankouken</a></td>
                        <td>Choose by genre</td>
                        <td>Choose by region</td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/about/">About Ettyu Niikawa Kankouken</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 0, 1, true))}">{current(array_slice(Constant::$aryCategory, 0, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 0, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 0, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}contact/">Inquiries</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 1, 1, true))}">{current(array_slice(Constant::$aryCategory, 1, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 1, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 1, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}guide/">Site Guide</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 2, 1, true))}">{current(array_slice(Constant::$aryCategory, 2, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 2, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 2, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="https://www.kanko-pro.co.jp/privacy/" target="_blank">Privacy Policy</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?Category={key(array_slice(Constant::$aryCategory, 3, 1, true))}">{current(array_slice(Constant::$aryCategory, 3, 1, true))}</a></td>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}niikawa/list/?area={key(array_slice(Constant::$aryAreaDetail['area1'], 3, 1, true))}">{current(array_slice(Constant::$aryAreaDetail['area1'], 3, 1, true))}</a></td>
                    </tr>
                    <tr>
                        <td><a href="{$smarty.const.URL_ROOT_PATH}law/">Notation based on the Specified Commercial Transaction Act</a></td>
                    </tr>
                </tbody>
            </table>
        </nav>
        <p class="copyright">
            Website Operation Management：<a target="_blank" href="https://www.kanko-pro.co.jp/">Tourism Sales Systems Co., Ltd.</a><br>
            Copyright(C) Eravel Travel All rights reserved.
        </p>
    </div>
</footer>