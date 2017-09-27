<?php
/**********************************************

PHP用　コンフィグ

***********************************************/
//フロントサイトタイトル
define('SITE_TITLE_FRONT', 'いまからえらべるTRAVELinにいかわ');
define('SITE_TITLE_ADMIN', 'いまからえらべるTRAVEL');

//メール送信API
define('EMAIL_SENDING_API_URL', 'https://sandbox.smtps.jp/api/v2/emails/send.json');
define('EMAIL_SENDING_API_USER', 'admin@just-toyama.visit-town.com');
define('EMAIL_SENDING_API_KEY', 'CVX7bQhPeh');

//オーナーメールアドレス
define('OWNER_MAIL', 'support@nanala-it.com');

//システムメールFrom
define('SYS_MAIL_FROM', 'admin@toyama-dev.field-design.jp');

// Spiral用
define('SPIRAL_API_TOKEN', '00011KE6YZ1G4779f129548fef07f6c5e51399a31df6d90682cd');
define('SPIRAL_API_SECRET', '64d88290db482fe0ed7b1f0db7965ff449a91e54');
define('SPIRAL_API_URL', 'https://reg18.smp.ne.jp/api/service');

// MySQL
define('DB_NAME', 'just_toyama_db');
define('DB_HOST', 'localhost');
define('DB_USER', 'just_toyama_db_a');
define('DB_PASS', 'db_admin');

// 残りわずかしきい値
define('FEW_THRESHOLD', 5);

// 管理サイト集合場所初期値
define('ADMIN_INIT_LAT', 36.701612);
define('ADMIN_INIT_LNG', 137.213263);

// 承認メール用ソルト
define('ORDER_ID_SALT', 'fd_sys_salt');
// 限定公開URL用ソルト
define('LIMITED_LINK_SALT', 'fd_sys_link_salt');

// ベースディレクトリ定義（環境変数より取得）
define('BASE_DIR', $_SERVER['FD_SYS_DIR']);

// ディレクトリ名
define('FRONT_DIR', 'front/');
define('COMMON_DIR', 'common/');
define('ADMIN_DIR', 'admin/');

// システムログパス定義
define('SYS_LOG_DIR', '/var/tmp/logs/');
// システムエラーパス定義
define('SYS_ERR_DIR', '/var/tmp/errors/');

// システムパス定義
define('SYS_DIR', BASE_DIR . 'system/');

define('CONF_DIR', SYS_DIR . 'configs/');
define('LIBS_DIR', SYS_DIR . 'libs/');
define('INC_DIR', SYS_DIR . 'includes/');
define('CLS_DIR', SYS_DIR . 'classes/');

define('PUB_DIR', BASE_DIR . 'public/');
define('COM_DIR', PUB_DIR . 'common/');
define('UPL_DIR', COM_DIR . 'upload/');

// URLフルパス
define('URL_ROOT_PATH_HOST', (empty($_SERVER["HTTPS"]) ? "http://" : "https://") . $_SERVER["HTTP_HOST"]);
define('URL_ROOT_PATH_FULL', URL_ROOT_PATH_HOST . $_SERVER["REQUEST_URI"]);

// URLパス
define('URL_ROOT_PATH', '/');

define('URL_ROOT_PATH_COMMON', URL_ROOT_PATH . COMMON_DIR);
define('URL_UPL_DIR', URL_ROOT_PATH_COMMON . 'upload/');

define('URL_ROOT_PATH_ADMIN', URL_ROOT_PATH . ADMIN_DIR);

// 商品メイン画像１枚目はファイル名を固定
define('PRODUCT_MAIN_PHOTO1_NAME', 'product_main_photo.jpg');

// 標準約款
define('DEFAULT_CLAUSE', 'https://www.kanko-pro.co.jp/agreement/agreement4.php');


