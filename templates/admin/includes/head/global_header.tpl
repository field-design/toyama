<header class="global-header">
    <nav class="nav has-shadow" id="top">
      <div class="container">
        <div class="nav-left">
          <a class="nav-item" href="../index.html">
            <h1 class="title is-5">いまからえらべるTRAVEL</h1>
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