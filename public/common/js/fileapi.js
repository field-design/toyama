
function FileApi() {

    var fileSelector;
    var fileUploadType;
    var afterCheckCallback;
    var afterUploadCallback;

    /***************************
    ファイルの存在チェック
    ****************************/
    var checkFiles = function(files) {

        var fd = new FormData();

        fd.append('fileapi_check', true);
        
        var filesLength = files.length;
        for (var i = 0; i < filesLength; i++) {
            fd.append('files[]', files[i]);
        }

        $.ajax({
            url: location.pathname,
            type: 'POST',
            data: fd,
            processData: false,
            contentType: false
        }).fail(function(data) {
            console.log(data);
        }).success(function(data) {
            if(data.length > 0) {
                if(!confirm('ファイル「' + data[0] + '」を上書きしてもよろしいですか？')) {
                    $(fileSelector).val('');
                    return;
                }
            }
            uploadFiles(files);
        });

    }

    /***************************
    ファイルのアップロード処理
    ****************************/
    var uploadFiles = function(files) {

        var fd = new FormData();

        fd.append('fileapi_uploadtype', fileUploadType);
        
        var filesLength = files.length;
        for (var i = 0; i < filesLength; i++) {
            fd.append('files[]', files[i]);
        }

        $.ajax({
            url: location.pathname,
            type: 'POST',
            data: fd,
            processData: false,
            contentType: false
        }).fail(function(data) {
            console.log(data);
        }).success(function(data) {
            if(afterUploadCallback) {
                afterUploadCallback(data);
            }
        });
    };

    /***************************
    ファイルのアップロードイベント設定
    引数
      selector
        input[type=file]のセレクタ
      uploadtype
        アップロードタイプ（phpでの識別用）
      callback（任意）　
        key: aftercheck ファイルチェック後のコールバック関数
        key: afterupload ファイルアップロード後のコールバック関数
    ****************************/
    this.setUpload = function(selector, uploadtype, callback) {
        fileSelector = selector;
        fileUploadType = uploadtype
        _callback = callback || {};
        afterCheckCallback = _callback.aftercheck;
        afterUploadCallback = _callback.afterupload;

        $(fileSelector).unbind('change');
        $(fileSelector).on('change', function(){
            // ファイル情報を取得
            var files = this.files;
            checkFiles(files);
        });
    }
}

$(function(){

    //var fileapi = new FileApi();

    /***************************
    ファイルのアップロードリスナー設定
    ****************************/
    //fileapi.setUpload();

    /***************************
    ファイルアップロードイベント設定
    ****************************/
    //$('[data-uploader=image] div').on('drop', function(e){
    //    // デフォルトの挙動を停止
    //    e.preventDefault();
 
    //    // ファイル情報を取得
    //    var files = e.originalEvent.dataTransfer.files;
    //    for (var i=0; i<files.length; i++) {
    //        if (!files[i].type.match('image.*')) {
    //            alert('画像を指定して下さい。');
    //            return;
    //        }
    //    }

    //    checkFiles(files, $(this).parent());
    
    //// デフォルトの挙動を停止
    //}).on('dragenter', function(){
    //    return false;
    //}).on('dragover', function(){
    //    return false;
    //});

});