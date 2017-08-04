<aside class="menu">

{if isset($menu_product)}
<ul class="menu-list">
  <li>
    {if $edit_type == 'new'}
    <p class="menu-label">商品追加</p>
    {else}
    <p class="menu-label">商品編集</p>
    {/if}
    <ul class="menu-product">
      <li><a href="javascript:void(0);">基本情報</a></li>
      <li><a href="javascript:void(0);">代金</a></li>
      <li><a href="javascript:void(0);">プラン詳細</a></li>
      <li><a href="javascript:void(0);">集合場所</a></li>
      <li><a href="javascript:void(0);">注意事項・その他</a></li>
      <li><a href="javascript:void(0);">取消料</a></li>
      <li><a href="javascript:void(0);">お申し込み</a></li>
      <li><a href="javascript:void(0);">プラン内容</a></li>
      <li><a href="javascript:void(0);">エリア・カテゴリ</a></li>
      <li><a href="javascript:void(0);">質問事項</a></li>
      <li><a href="javascript:void(0);">公開設定</a></li>
    </ul>
  </li>
</ul>
{/if}

  <p class="menu-label">
    一般
  </p>
  <ul class="menu-list">
    <li><a href="{$smarty.const.URL_ROOT_PATH_ADMIN}">ダッシュボード</a></li>
  </ul>
  <p class="menu-label">
    商品管理
  </p>
  <ul class="menu-list">
    <li><a class="{$product|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/">商品一覧</a></li>
    <li><a class="{$post|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/edit/">商品追加</a></li>
    <li><a class="{$price|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/price/">代金設定</a></li>
    <li><a class="{$calendar|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}product/calendar/">予約カレンダー</a></li>
    <!-- <li><a class="{$area|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}area">エリア</a></li>
    <li><a class="{$category|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}category">カテゴリ</a></li>
    <li><a class="{$standard|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}standard">規格</a></li> -->
  </ul>
  {if $is_admin}
  <p class="menu-label">
    固定ページ
  </p>
  <ul class="menu-list">
    <li><a class="{$page_toyama|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}page/top?PageID=1">in富山</a></li>
    <li><a class="{$page_toyama_en|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}page/top?PageID=3">in富山（EN）</a></li>
    <li><a class="{$page_niikawa|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}page/niikawa?PageID=2">inにいかわ</a></li>
    <li><a class="{$page_niikawa_en|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}page/niikawa?PageID=4">inにいかわ（EN）</a></li>
  </ul>
  {/if}
  <p class="menu-label">
    受注管理
  </p>
  <ul class="menu-list">
    <li><a class="{$order|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}order/">受注一覧</a></li>
  </ul>
  <p class="menu-label">
    売上管理
  </p>
  <ul class="menu-list">
    <li><a class="{$sales|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}sales/">売上一覧</a></li>
  </ul>
  <p class="menu-label">
    設定
  </p>
  <ul class="menu-list">
    <li><a class="{$users|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/">事業者一覧</a></li>
    <li><a class="{$settings|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/edit/?PersonID={$menu_person_id|default:''}">プロフィール</a></li>
    <!-- <li><a class="{$bank|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/edit/bank">口座設定</a></li> -->
    <!-- <li><a class="{$account|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/edit/account">アカウント</a></li> -->
  </ul>
  <p class="menu-label">
    その他
  </p>
  <ul class="menu-list">
    <li><a class="{$banner|default:''}" href="{$smarty.const.URL_ROOT_PATH_ADMIN}promotion/banner">バナー掲載について</a></li>
  </ul>
</aside>