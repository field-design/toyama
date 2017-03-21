<?php
/**********************************************

PHP用　コンフィグ

***********************************************/
//オーナーメールアドレス
define('OWNER_MAIL', 'support@nanala-it.com');

// Spiral用
define('SPIRAL_API_TOKEN', '00011Kj13Ve97942151ad95fbdd9b5149de462e3f6e55d13fa92');
define('SPIRAL_API_SECRET', '448d8abaab325d53025555cd2275aa6c820d4c78');
define('SPIRAL_API_URL', 'https://reg18.smp.ne.jp/api/service');

// 残りわずかしきい値
define('FEW_THRESHOLD', 5);

// ベースディレクトリ定義（環境変数より取得）
define('BASE_DIR', $_SERVER['FD_SYS_DIR']);

// ディレクトリ名
define('FRONT_DIR', 'front/');
define('COMMON_DIR', 'common/');
define('ADMIN_DIR', 'admin/');

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
define('URL_ROOT_PATH_FULL', (empty($_SERVER["HTTPS"]) ? "http://" : "https://") . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"]);

// URLパス
define('URL_ROOT_PATH', '/');

define('URL_ROOT_PATH_COMMON', URL_ROOT_PATH . COMMON_DIR);
define('URL_UPL_DIR', URL_ROOT_PATH_COMMON . 'upload/');

define('URL_ROOT_PATH_ADMIN', URL_ROOT_PATH . ADMIN_DIR);

// 商品メイン画像１枚目はファイル名を固定
define('PRODUCT_MAIN_PHOTO1_NAME', 'product_main_photo.jpg');



