<header class="global-header">
    <nav class="nav has-shadow" id="top">
      <div class="container">
        <div class="nav-left">
          <span class="nav-item" href="{$smarty.const.URL_ROOT_PATH_ADMIN}">
            <h1 class="title is-5">{$smarty.const.SITE_TITLE_ADMIN}</h1>
          </span>
          <a class="nav-item is-tab is-hidden-mobile" href="{$smarty.const.URL_ROOT_PATH}" target="_blank">
              <i class="fa fa-fw fa-external-link"></i>
              サイトを表示
          </a>
          <a class="nav-item is-tab is-hidden-mobile" href="{$smarty.const.URL_ROOT_PATH_ADMIN}">
              <i class="fa fa-fw fa-home"></i>
              HOME
          </a>
        </div>
        <span class="nav-toggle">
          <span></span>
          <span></span>
          <span></span>
        </span>
        <div class="nav-right nav-menu">
            <!-- <a class="nav-item is-tab notice" href="/order/">
                <i class="fa fa-fw fa-star"></i>
                <small>新規予約</small>
                <span class="number-style">3</span>
            </a>
            <a class="nav-item is-tab notice" href="/order/">
                <i class="fa fa-fw fa-exclamation"></i>
                <small>承認待ち</small>
                <span class="number-style">1</span>
            </a> -->
          <span class="nav-item">
              <!-- <a class="button is-light" href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/edit/">
                  <i class="fa fa-fw fa-cog"></i>
                  設定
              </a> -->
              <a class="button is-white" href="{$smarty.const.URL_ROOT_PATH_ADMIN}assets/docs/manual.pdf" target="_blank">
                  <i class="fa fa-fw fa-file-text"></i>
                  操作マニュアル
              </a>
              <a class="button is-light" href="{$smarty.const.URL_ROOT_PATH_ADMIN}admins/edit/?PersonID={$menu_person_id|default:''}">
                  <i class="fa fa-fw fa-user"></i>
                  プロフィール
              </a>
              <a class="button" href="{$smarty.const.URL_ROOT_PATH_ADMIN}login/?logout">
                <i class="fa fa-fw fa-sign-out"></i>
                ログアウト
              </a>
          </span>
        </div>
      </div>
    </nav>
</header>