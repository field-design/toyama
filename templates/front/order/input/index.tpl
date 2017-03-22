{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　申込（お客様情報入力）ページ
機能名：
　申込（お客様情報入力）ページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>お申し込み | {$smarty.const.SITE_TITLE_FRONT}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/order.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- Twitter Card -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/twitter_card.tpl'}
</head>

<body class="drawer drawer--right" id="top">
<!-- Google Tag Manager -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/google_tag.tpl'}
<!-- End Google Tag Manager -->


{include file=$smarty.const.FRONT_DIR|cat:'includes/head/loading.tpl'}


<!-- START global-header -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/global_header.tpl'}
<!-- END global-header -->



<!-- START main -->
<main role="main">

<div class="breadcrumb">
    <div data-lg>
        <ul>
            <li><a href="/">トップページ</a></li>
            <li>お申し込み</li>
        </ul>
    </div>
</div>

{if isset($global_message)}{include file=$smarty.const.ADMIN_DIR|cat:'includes/head/global_message.tpl' global_message=$global_message}{/if}

<article>
    <div data-lg>

        <div class="steps">
            <ul>
                <li class="step"><span>人数・オプション選択</span></li>
                <li class="step current"><span>お客様情報入力</span></li>
                <li class="step"><span>ご予約内容確認</span></li>
            </ul>
        </div>

        <h2><span>お客様情報入力</span></h2>
        <section class="order-input">
            <h3 class="input-ttl">お申込者様の情報</h3>
            <div class="input-wrap">

                <div class="input-area">
                    <label class="label">お名前</label>
                    <div class="input-group">
                        <div class="input-field">
                            <input class="input" type="text" placeholder="姓">
                        </div>
                        <div class="input-field">
                            <input class="input" type="text" placeholder="名">
                        </div>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">フリガナ</label>
                    <div class="input-group">
                        <div class="input-field">
                            <input class="input" type="text" placeholder="セイ">
                        </div>
                        <div class="input-field">
                            <input class="input" type="text" placeholder="メイ">
                        </div>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">メールアドレス</label>
                    <div class="input-field">
                        <input class="input" type="email" placeholder="例：sample@example.com">
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">郵便番号</label>
                    <div class="input-group">
                        <div class="input-field">
                            <input class="input" type="number" min="0" placeholder="例：123">
                        </div>
                        <div class="input-field">
                            <input class="input" type="number" min="0" placeholder="例：4567">
                        </div>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">都道府県</label>
                    <div class="input-group">
                        <span class="select">
                          <select name="pref">
                              <option value="">都道府県</option>
                              <option value="1" >北海道</option>
                              <option value="2" >青森県</option>
                              <option value="3" >岩手県</option>
                              <option value="4" >宮城県</option>
                              <option value="5" >秋田県</option>
                              <option value="6" >山形県</option>
                              <option value="7" >福島県</option>
                              <option value="8" >茨城県</option>
                              <option value="9" >栃木県</option>
                              <option value="10" >群馬県</option>
                              <option value="11" >埼玉県</option>
                              <option value="12" >千葉県</option>
                              <option value="13" >東京都</option>
                              <option value="14" >神奈川県</option>
                              <option value="15" >新潟県</option>
                              <option value="16" >富山県</option>
                              <option value="17" >石川県</option>
                              <option value="18" >福井県</option>
                              <option value="19" >山梨県</option>
                              <option value="20" >長野県</option>
                              <option value="21" >岐阜県</option>
                              <option value="22" >静岡県</option>
                              <option value="23" >愛知県</option>
                              <option value="24" >三重県</option>
                              <option value="25" >滋賀県</option>
                              <option value="26" >京都府</option>
                              <option value="27" >大阪府</option>
                              <option value="28" >兵庫県</option>
                              <option value="29" >奈良県</option>
                              <option value="30" >和歌山県</option>
                              <option value="31" >鳥取県</option>
                              <option value="32" >島根県</option>
                              <option value="33" >岡山県</option>
                              <option value="34" >広島県</option>
                              <option value="35" >山口県</option>
                              <option value="36" >徳島県</option>
                              <option value="37" >香川県</option>
                              <option value="38" >愛媛県</option>
                              <option value="39" >高知県</option>
                              <option value="40" >福岡県</option>
                              <option value="41" >佐賀県</option>
                              <option value="42" >長崎県</option>
                              <option value="43" >熊本県</option>
                              <option value="44" >大分県</option>
                              <option value="45" >宮崎県</option>
                              <option value="46" >鹿児島県</option>
                              <option value="47" >沖縄県</option>
                          </select>
                        </span>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">市区町村、丁目・番地、ビル・マンション名等</label>
                    <div class="input-field">
                        <input name="address" class="input" type="text" placeholder="例：〇〇市〇〇 1丁目123 〇〇ビル101">
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">電話番号</label>
                    <div class="input-group">
                        <div class="input-field">
                            <input name="tel_[]" class="input" type="number" min="0" placeholder="例：123">
                        </div>
                        <div class="input-field">
                            <input name="tel_[]" class="input" type="number" min="0" placeholder="例：4567">
                        </div>
                        <div class="input-field">
                            <input name="tel_[]" class="input" type="number" min="0" placeholder="例：8901">
                        </div>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">携帯電話番号</label>
                    <div class="input-group">
                        <div class="input-field">
                            <input name="mobile_[]" class="input" type="number" min="0" placeholder="例：123">
                        </div>
                        <div class="input-field">
                            <input name="mobile_[]" class="input" type="number" min="0" placeholder="例：4567">
                        </div>
                        <div class="input-field">
                            <input name="mobile_[]" class="input" type="number" min="0" placeholder="例：8901">
                        </div>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">生年月日</label>
                    <div class="input-group">
                        <div class="input-field">
                            <span class="select">
                                <select value="1980">
                                    <option value="2017">2017</option><option value="2016">2016</option><option value="2015">2015</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983" selected="selected">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option><option value="1909">1909</option><option value="1908">1908</option><option value="1907">1907</option><option value="1906">1906</option><option value="1905">1905</option><option value="1904">1904</option><option value="1903">1903</option><option value="1902">1902</option><option value="1901">1901</option><option value="1900">1900</option>
                                </select>
                            </span>
                            <span class="notes">年</span>
                        </div>
                        <div class="input-field">
                            <span class="select">
                                <select value="01">
                                    <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8" selected="selected">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
                                </select>
                            </span>
                            <span class="notes">月</span>
                        </div>
                        <div class="input-field">
                            <span class="select">
                                <select value="01">
                                    <option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5" selected="selected">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                                </select>
                            </span>
                            <span class="notes">日</span>
                        </div>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">性別</label>
                    <div class="input-field">
                        <span class="select">
                            <select value="1">
                                <option value="1">男性</option>
                                <option value="2">女性</option>
                            </select>
                        </span>
                    </div>
                </div>

                <div class="input-area">
                    <label class="label">職業</label>
                    <div class="input-field">
                        <span class="select">
                            <select>
                                <option value="1">学生</option>
                                <option value="2">会社員</option>
                                <option value="3">自営</option>
                                <option value="4">主婦</option>
                                <option value="5">その他</option>
                            </select>
                        </span>
                    </div>
                </div>

            </div>
        </section>

        <section class="order-payment">
            <h3 class="input-ttl">お支払方法</h3>
            <div class="input-wrap">

                <div class="input-area">
                    <label class="label">決済種別</label>
                    <div class="input-field">
                        <span class="select">
                            <select value="3">
                                <option value="3">コンビニ決済</option>
                                <option value="0">クレジットカード決済</option>
                            </select>
                        </span>
                    </div>
                </div>

            </div>
        </section>

        <div class="pagenation">
            <div class="back">
                <button onclick="history.back()">戻る</button>
            </div>
            <div class="next">
                <button type="submit" id="submit">次へ</button>
            </div>
        </div>
    </div>
</article>

</main>
<!-- END main -->


<!-- START global-footer -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/global_footer.tpl'}
<!-- END global-footer -->


<!-- WEB Fonts -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/webfont.tpl'}
<!-- icon Fonts -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/iconfont.tpl'}
<!-- Common Script -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/script.tpl'}
<!-- Google map javascript api v3 -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/google_script.tpl'}


<!-- Page Script -->


{include file=$smarty.const.FRONT_DIR|cat:'includes/foot/sns_script.tpl'}

</body>
</html>