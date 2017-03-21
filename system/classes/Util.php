<?php
/******************************************
システム名： 
　旅行商品予約システム
クラス名：
　ユーティリティ
機能名：
　ユーティリティ
*******************************************/
class Util {
    function __construct() {
    }

    /****************************
    * ディレクトリの最終更新日取得
    *****************************/
    function dirmtime($directory) {
        $last_modified_time = 0;

        $handler = opendir($directory);

        while ($file = readdir($handler)) {
            if(is_file($directory.DIRECTORY_SEPARATOR.$file)){
                $files[] = $directory.DIRECTORY_SEPARATOR.$file;
                $filemtime = filemtime($directory.DIRECTORY_SEPARATOR.$file);
                if($filemtime>$last_modified_time) {
                    $last_modified_time = $filemtime;
                }
            }
        }

        closedir($handler);

        return $last_modified_time;
    }

    /****************************
    * ディレクトリ削除（ファイル含む）
    *****************************/
    function removeDir($dir, $expire) {
        $list = scandir($dir);
        foreach($list as $value){

            if ($value == "." || $value == "..") continue;

            $file = $dir . $value;

            if(is_file($file)) {
                $mod = filemtime( $file );
                if($mod < $expire){
                    unlink($file);
                }
            } elseif(is_dir($file)) {
                $mod = $this->dirmtime( $file );
                if($mod < $expire){
                    $this->removeDir($file . '/', $expire);
                    rmdir($file . '/');
                }
            }
        }
    }

/*** 画像リサイズ処理 ***/
function resizeImage($filename, $newFilename, &$error){
	if(!$newFilename)
		$newFilename = $filename;
	$userphoto_jpeg_compression = 100;

	$info = @getimagesize($filename);

	if(!$info || !$info[0] || !$info[1]){
		$error = __("Unable to get image dimensions.", '');
	}

	if($info[0] <= 300 && $info[1] <= 300){
		return;
	}

	//From WordPress image.php line 22
	else if (
		!function_exists( 'imagegif' ) && $info[2] == IMAGETYPE_GIF
		||
		!function_exists( 'imagejpeg' ) && $info[2] == IMAGETYPE_JPEG
		||
		!function_exists( 'imagepng' ) && $info[2] == IMAGETYPE_PNG
	) {
		$error = __( 'Filetype not supported.', '' );
	}
	else {
		// create the initial copy from the original file
		if ( $info[2] == IMAGETYPE_GIF ) {
			$image = imagecreatefromgif( $filename );
		}
		elseif ( $info[2] == IMAGETYPE_JPEG ) {
			$image = imagecreatefromjpeg( $filename );
		}
		elseif ( $info[2] == IMAGETYPE_PNG ) {
			$image = imagecreatefrompng( $filename );
		}

		if(!isset($image)){
			$error = __("Unrecognized image format.", '');
			return false;
		}

		if ( function_exists( 'imageantialias' ))
			imageantialias( $image, TRUE );

			// figure out the longest side

			if ( $info[0] > $info[1] ) {
				$image_width = $info[0];
				$image_height = $info[1];
				$image_new_width = 300;

				$image_ratio = $image_width / $image_new_width;
				$image_new_height = $image_height / $image_ratio;
				//width is > height
			} else {
				$image_width = $info[0];
				$image_height = $info[1];
				$image_new_height = 300;

				$image_ratio = $image_height / $image_new_height;
				$image_new_width = $image_width / $image_ratio;
				//height > width
			}

			$imageresized = imagecreatetruecolor( $image_new_width, $image_new_height);
			@ imagecopyresampled( $imageresized, $image, 0, 0, 0, 0, $image_new_width, $image_new_height, $info[0], $info[1] );

			// move the thumbnail to its final destination
			if ( $info[2] == IMAGETYPE_GIF ) {
				if (!imagegif( $imageresized, $newFilename ) ) {
					$error = __( "Thumbnail path invalid" );
				}
			}
			elseif ( $info[2] == IMAGETYPE_JPEG ) {
				if (!imagejpeg( $imageresized, $newFilename, $userphoto_jpeg_compression ) ) {
					$error = __( "Thumbnail path invalid" );
				}
			}
			elseif ( $info[2] == IMAGETYPE_PNG ) {
				if (!imagepng( $imageresized, $newFilename ) ) {
					$error = __( "Thumbnail path invalid" );
				}
		}
	}
	if(!empty($error))
		return false;
	return true;
}
}