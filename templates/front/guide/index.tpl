{*****************************************************
システム名：
　旅行商品予約システム
ビュー名：
　guideページ
機能名：
  guideページ
******************************************************}
<!DOCTYPE html>
<html lang="ja">
<head>
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/meta.tpl'}

<title>サイトのご利用案内 | {$smarty.const.SITE_TITLE_FRONT}</title>
<meta name="description" content="">
<meta name="keywords" content="">
<!-- icons -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/icon.tpl'}
<!-- Stylesheet -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/stylesheet.tpl'}
<link rel="stylesheet" href="{$smarty.const.URL_ROOT_PATH}assets/css/guide.css">
<!-- Modernizr -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/modernizr.tpl'}
<!--- jQuery -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/jquery.tpl'}
<!-- DNS prefetch -->
{include file=$smarty.const.FRONT_DIR|cat:'includes/head/dns_prefetch.tpl'}
<!-- OGP -->
<meta property="og:site_name" content="サイト名">
<meta property="og:type" content="website">
<meta property="og:title" content="ページタイトル">
<meta property="og:description" content="ディスクリプション">
<meta property="og:url" content="">
<meta property="og:image" content="">
<meta property="fb:app_id" content="">
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
            <li><a href="{$smarty.const.URL_ROOT_PATH}">トップページ</a></li>
            <li>サイトのご利用案内</li>
        </ul>
    </div>
</div>

<article>
    <h2><span>サイトのご利用案内</span></h2>
    <h3>商品検索から出発までの流れ</h3>
    <div class="flow" data-lg>
        <div class="flow-inner cf">
            <div class="flow-1">
                <div class="wrap">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img10.png" alt="プランを検索">
                        <h4>プランを検索</h4>
                        <p>ジャンルや地域から検索できます。</p>
                    </div>
                </div>
            </div>
            <div class="flow-2">
                <div class="wrap">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img11.png" alt="記事ページ">
                        <h4>記事ページ</h4>
                        <p>プランの内容や参加条件を確認。</p>
                    </div>
                </div>
            </div>
            <div class="flow-3 cf">
                <div class="wrap left blue">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img12.png" alt="即予約可能プラン">
                        <h4>即予約可能プラン</h4>
                    </div>
                </div>
                <div class="wrap right green">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img13.png" alt="リクエスト予約プラン">
                        <h4>リクエスト予約プラン</h4>
                    </div>
                </div>
            </div>
            <div class="flow-4 cf">
                <div class="wrap left"></div>
                <div class="wrap right green">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img14.png" alt="リクエスト申請">
                        <h4>リクエスト申請</h4>
                    </div>
                </div>
            </div>
            <div class="flow-5 cf">
                <div class="wrap left"></div>
                <div class="wrap right green">
                    <div class="frame">
                        <img src="//cdn.visit-town.com/common/img/guide/flow_img15.png" alt="リクエスト回答">
                        <h4>リクエスト回答</h4>
                        <p>事業者よりリクエストの可否のご連絡を致します。</p>
                    </div>
                </div>
            </div>
            <div class="flow-6 cf">
                <div class="wrap irregular-wrap left"></div>
                <div class="irregular irregular-wrap cf">
                    <div class="wrap center green">
                        <div class="frame">
                            <img src="//cdn.visit-town.com/common/img/guide/flow_img12.png" alt="予約成立">
                            <h4>予約成立</h4>
                            <p>決済メールをお送ります。</p>
                        </div>
                    </div>
                    <div class="wrap right green">
                        <div class="frame">
                            <img src="//cdn.visit-town.com/common/img/guide/flow_img16.png" alt="予約不成立">
                            <h4>予約不成立</h4>
                            <p>催行条件に満たない場合予約不成立となります。</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="flow-7">
            <div class="wrap">
                <div class="frame">
                    <img src="//cdn.visit-town.com/common/img/guide/flow_img17.png" alt="お支払">
                    <h4>お支払</h4>
                    <p>カード決済・コンビニ支払がお選びいただけます。</p>
                </div>
            </div>
        </div>
        <div class="flow-8">
            <div class="wrap">
                <div class="frame">
                    <img src="//cdn.visit-town.com/common/img/guide/flow_img18.png" alt="契約成立">
                    <h4>契約成立</h4>
                    <p>お支払完了をもって契約が成立となります。</p>
                </div>
            </div>
        </div>
    </div>
    <div class="cancel" data-lg>
        <p class="ttl">取消・変更後の返金について</p>
        <p>ご返金は、お客様の指定銀行口座に返金（振込）させていただきます。<br>クレジットカード決済をご利用されたお客様は、各カード提携会社の規則に従って解除が可能な場合のみカード利用を解除します。<br>お客様都合により返金（振込）する場合は、旅行代金から振込手数料を差し引いた金額をご返金いたします。<br>（※振込手数料はお客様のご負担となります。予めご了承くださいますようお願いいたします。）<br>お客様都合による変更・キャンセルで、クーポン券類やチケット類の交換、返品につきまして、送料等はお客様のご負担となります。</p>
    </div>
    <div class="contract">
        <h4><span>ご利用規約</span></h4>
        <p data-lg><span>「いまからえらべるTRAVEL in 富山」サイト（以下、「当サイト」とします）は、株式会社観光販売システムズ（以下、当社）が運営している、日本国内の観光オプショナルツアー・体験プログラムの検索・予約サイトです。観光商品の検索と主催会社への問い合わせ・予約・変更・キャンセルを行うことができ、無料でご利用いただけます。利用者は、当サイトを利用することによって、本規約の内容に同意したものとみなします。</span></p>
    </div>
    <div class="disclaimer">
        <h5>免責事項</h5>
        <p>　当サイトの使用と閲覧はお客様ご自身の責任で行うものとし、観光商品の情報及びその他の関連情報の内容の正確性、最新性、第三者の権利を侵害していないこと等については、当社は保証をいたしません。当サイトで提供している観光商品の情報は、主催会社から提供された情報をそのまま掲載しております。観光商品の情報に関する内容の正確性、最新性等については各主催会社が責任を負うものとし、当社は保証をいたしません。また、当サイトから取得された各種情報の利用によって生じたあらゆる損害に関して、当社は一切の責任を負いません。</p>
        <p>当社は予告なく、当サイトの情報を変更することがあります。<br>また、当サイトの全部または一部の運営を中断または中止することがあります。あらかじめご了承下さい。なお、当社は、理由の如何に関わらず、これらの情報の変更や運営の中断または中止によってユーザーに生じるいかなる損害についても責任を負うものではありません。</p>
        <h5>外部リンクの扱いについて</h5>
        <p>　当サイトから他の外部サイトへリンクをしている場合、当社はリンク先のコンテンツについては管理・監視をしておりません。リンク先のコンテンツに起因して利用者が損害や不利益を被った場合でも、当社は一切責任を負いません。</p>
        <h5>著作権について</h5>
        <p>　当サイトに含まれている記事や写真等のコンテンツ、個々の情報及び情報の集合体の著作権は、株式会社観光販売システムズ及び当該コンテンツ等を提供している提携先に帰属します。私的使用を目的とする場合を除いては、株式会社観光販売システムズ、掲載会社、広告主等に事前の文書による承諾を受けない限り、当サイトに含まれるコンテンツの一部あるいは全部を複製、公開、送信、領布、譲渡、貸与、翻訳、翻案、使用許諾、転載、再利用することはできません。</p>
        <h5>推奨環境</h5>
        <p>当サイトを快適にご覧いただくにあたり、下記の環境を推奨いたします。<br>これらの環境ではない場合、掲載されている情報の確認はできますが、一部の機能に制限が発生してしまう場合がございます。あらかじめご了承ください。<br>＜パソコンからのアクセスの場合＞<br>・Windows　Internet Explorer 11 以降　Edge 最新　Google Chrome 最新　Firefox 最新<br>・Mac　Safari 最新<br>※上記以外のブラウザ（Opera等）は、一部サービスで正常に表示されない場合があります。</p>
        <p>＜スマートフォン／タブレット端末（Android/iOS）からのアクセスの場合＞<br>・Android　Android 4.0 以降<br>・iPhone/iPad　iOS8 以降</p>
        <h5>準拠法</h5>
        <p>当サイトは株式会社観光販売システムズの管理下にあります。<br>当サイトは法律の異なる全世界の国々からアクセスすることが可能ですが、当サイトにアクセスされたお客様および株式会社観光販売システムズの両者は、かかる法律原理の違いに関わらず、当サイトの利用に関して日本国の法律に拘束されることに同意するものとします。<br>また株式会社観光販売システムズは当サイト上で、お客様の環境において当サイトのコンテンツが適切であるかなどの記述や表示は一切行いません。</p>
        <h5>クッキー（Cookie）の使用について</h5>
        <p>クッキーとは、ウェブサイトへの訪問情報などを、お客様のコンピュータ内に記憶させておく機能のことです。<br>弊社は本サービスの提供にあたり、クッキー（これに類似する技術を含みます。）を使用することがあります。<br>クッキーを通じて取得する情報には、メールアドレスや氏名などの「個人を特定できる情報」は一切含まれません。<br>ほとんどのコンピュータのブラウザは、 クッキーを受け付けられるようにセットされています。<br>ブラウザでクッキーを受け入れない設定をすることも可能ですが、その場合、一部機能は適切に作動いたしません。<br>ブラウザの設定方法は、各ソフト製造元へお問い合わせください。</p>
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