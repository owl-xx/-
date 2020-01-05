/**
 * Created by Administrator on 2019/8/31 0031.
 */
//弹窗
function layer_iframe(title,url,w,h,id){
    if(title==null || title==''){
        title=false;
    };
    if(url==null || url==''){
        url='404.html';
    };
    if(h==null || h==''){
        h=($(windows).hright()-50);
    };
    layer.open({
        type: 2,
        title:title,
        fix:false,
        maxmin:true,
        shadeClose: true,
        shade: 0.4,
        area: [w+'px', h+'px'],
        content:url+id,
    });

}
function layer_iframeadd(title,url,w,h){
    if(title==null || title==''){
        title=false;
    };
    if(url==null || url==''){
        url='404.html';
    };
    if(h==null || h==''){
        h=($(windows).hright()-50);
    };
    layer.open({
        type: 2,
        title:title,
        fix:false,
        maxmin:true,
        shadeClose: true,
        shade: 0.4,
        area: [w+'px', h+'px'],
        content:url,
    });

}
function confirm(title,url,id){
    layer.confirm(title, {
        btn: ['确定','取消'] //按钮
    }, function(){
        window.location.href=url+id;
          //return true;
    }, function(){
        //return false;
    });
}