/**
   接口
   imgUpload({
       inputId:'file', //input框id
       imgBox:'imgBox', //图片容器id
   });
   html结构
    <div class='upload-img'>
        <div id="inputBox">
            <input type="file" title="请选择图片" name='thumb' class="file" accept="image/png,image/jpg,image/gif,image/JPEG"/>点击选择图片
        </div>
        <div class="imgBox"></div>
    </div>
*/
var imgSrc; //图片路径
var imgFile; //文件流
var imgName; //图片名字
//选择图片
function imgUpload(obj) {
    var oInput = '.' + obj.inputId;
    $(oInput).on("change", function() {
        var fileImg = $(this)[0];
        var fileList = fileImg.files;
        var imgSrcI = getObjectURL(fileList[0]);
        var imgBox = $(this).parent('#inputBox').siblings('.imgBox');
        imgName = fileList[0].name;
        imgSrc = imgSrcI;
        imgFile = fileList[0];
        addNewContent(imgBox);
    })
}
//图片展示
function addNewContent(obj) {
    $(obj).html('<div class="imgContainer"><img alt=' + imgName + ' src=' + imgSrc + ' onclick="imgDisplay(this)"><p onclick="removeImg(this)" class="imgDelete">删除</p></div>');
}
//删除
function removeImg(obj) {
    $(obj).parent('.imgContainer').remove();
}

//图片放大
function imgDisplay(obj) {
    var src = $(obj).attr("src");
    var imgHtml = '<div style="width: 100%;height: 100vh;overflow: auto;background: rgba(0,0,0,0.5);text-align: center;position: fixed;top: 0;left: 0;z-index: 1000;"><img src=' + src + ' style="margin-top: 100px;width: 70%;margin-bottom: 100px;"/><p style="font-size: 50px;position: fixed;top: 30px;right: 30px;color: white;cursor: pointer;" onclick="closePicture(this)">×</p></div>'
    $('body').append(imgHtml);
}
//关闭
function closePicture(obj) {
    $(obj).parent("div").remove();
}

//图片预览路径
function getObjectURL(file) {
    var url = null;
    if(window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if(window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if(window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return url;
}