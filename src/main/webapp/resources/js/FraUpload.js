(function($,undefined){
    $.fn.FraUpload = function(options,param){
        var otherArgs = Array.prototype.slice.call(arguments, 1);
        if (typeof options == 'string') {
            var fn = this[0][options];
            if($.isFunction(fn)){
                return fn.apply(this, otherArgs);
            }else{
                throw ("FraUpload - No such method: " + options);
            }
        }
        if(! (typeof browserMD5File != 'undefined' && browserMD5File instanceof Function) ){
            console.error("md5 error");
            return false;
        }

        return this.each(function(){
            var para = {};
            var self = this;
            var input = null;
            var view_DOM = null;
            var view_id = null;
            var self_sortable = null;

            var defaults = {
                view        : "",
                url         : "",
                fetch       : 'img',
                debug       : false,

                onLoad          : function(e){},
                breforePort     : function (e) {},
                successPort     : function (e) {},
                errorPort       : function (e) {},
                deletePost      : function(e){},
                deletePost      : function(e){},
                sort            : function(e){},
                error           : function (e){alert(e)},
            };
            var para = $.extend(defaults,options);
            self.para = $.extend(defaults,options);


            this.files_all = {};

            this.init = function(){
                this.createHtml();
                para.onLoad(this);
            };


            this.createHtml = function(){

                var num = Math.ceil(Math.random()*10000000);
                var input_id = "input_"+num;
                view_id = "view_"+num;
                $(self).after('<input type="file" id="'+input_id+'" style="display:none" />');
                input = $("#"+input_id);

                if(para.fetch=="img" || para.fetch == "file"){
                    $(para.view).addClass("file-preview")
                    $(para.view).append('<ul id="'+view_id+'" class="FraUpload_imglist" /></ul>');
                    view_DOM = $("#"+view_id);
                }else{

                }
                this.addEvent();
            };

            this.empty = function(e){
                if(e==undefined || e==null || e==false || e==0 || e=='' || e==[] || e=={} ){
                    return true
                }else{
                    return false
                }
            }

            this.getsize = function($byte){
                $KB = 1024;
                $MB = 1024 * $KB;
                $GB = 1024 * $MB;
                $TB = 1024 * $GB;
                if(self.empty($byte)){
                    return "未知";
                }
                $byteold = $byte;
                $byte = parseInt($byte);
                if ($byte < $KB) {
                    return $byte + "B";
                } else if ($byte < $MB) {
                    return ($byte / $KB).toFixed(2) + "KB";
                } else if ($byte < $GB) {
                    return ($byte / $MB).toFixed(2) + "MB";
                } else if ($byte < $TB) {
                    return ($byte / $GB).toFixed(2) + "GB";
                } else {
                    return ($byte / $TB).toFixed(2) + "TB";
                }
            }

            this.objLength = function (obj){
                var count = 0;
                for(var i in obj){
                    count ++;
                }
                return count;
            }

            this.file_isIn = function (md5){
                var files  = self.files_all;
                for(let key in files){
                    if(files[key]['md5']==md5){
                        return true;
                    }
                }
                return false;
            }

            this.deletefile= function (e){

            }

            this.addEvent = function(){
                $(self).bind("click", function(e){
                    self.msg("this click...")
                    input.attr("multiple","multiple");//多选
                    input.click()
                });

                input.change(function () {
                    if($(this).val() != ""){
                        var files = $(this).prop('files');
                        // return false;
                        for(let key in files){
                            if(typeof files[key] == 'object'){
                                browserMD5File(files[key], function (err, md5) {
                                    if(self.file_isIn(md5)) {
                                        para.error("Chosen");
                                        return false;
                                    }
                                    var objKey = self.objLength(self.files_all);
                                    self.files_all[objKey] = {
                                        filename: files[key].name,
                                        size: files[key].size,
                                        type: files[key].type,
                                        obj: files[key],
                                        md5: md5,
                                        is_upload: '',
                                        ajax:{},
                                    }
                                    if(String(files[key].type).search("image")==0){
                                        var reader = new FileReader();
                                        reader.readAsDataURL(files[key]);
                                        reader.onload=function(e){
                                            var html =  '<li data-md5="'+md5+'">'+
                                                '<img src=""/>'+
                                                "<div class='file-tit'>"+
                                                "<div title='"+files[key].name+"'>"+files[key].name+"</div>"+
                                                "<div>"+self.getsize(files[key].size)+"</div>"+
                                                "</div>"+
                                                '</li>';
                                            $(view_DOM).append(html);
                                            $(view_DOM).find("li[data-md5='"+md5+"'] img:eq(0)").attr('src',this.result)
                                        }
                                    }else{
                                        para.error("Choose a picture");
                                        return false;
                                    }
                                    self.upLoad(self.files_all[objKey]);
                                });
                            }
                        }
                    }
                })
                $('.file-preview').on('click','.icon-delete',function(){
                    var id = $(this).parent().parent('li');
                    var this_file = {};
                    var this_id = '';
                    var md5 = id.data('md5');
                    all = self.files_all;
                    for(let key in all){
                        if(all[key]['md5']==md5){
                            this_file = all[key];
                            this_id = key;
                            break;
                        }
                    }
                    delete self.files_all[this_id];
                    id.remove();
                    para.deletePost(this_file);

                })

                if(para.fetch=="img"){
                    self.imgfetch();
                    var foo = document.getElementById(view_id);
                    Sortable.create(foo, { group: "name"
                        , onAdd: function (evt){
                            // console.log('onAdd.foo:', [evt.item, evt.from]);
                        },
                        onUpdate: function (evt){
                            // console.log('onUpdate.foo:', [evt.item, evt.from]);
                        },
                        onRemove: function (evt){
                            // console.log('onRemove.foo:', [evt.item, evt.from]);
                        },
                        onStart:function(evt){
                            // console.log('onStart.foo:', [evt.item, evt.from]);
                        },
                        onSort:function(evt){
                            // console.log('onSort.foo:', [evt.item, evt.from]);
                        },
                        onEnd: function(evt){
                            var bind_arr = [];
                            for(var i=0, len=evt.from.children.length; i<len; i++){
                                bind_arr.push($(evt.from.children[i]).data('md5'));
                            }
                            var res = {};
                            var back = self.files_all;
                            for(let key in bind_arr){
                                for(let k2 in back){
                                    if(bind_arr[key]==back[k2]['md5']){
                                        res[key] = back[k2];
                                        continue;
                                    }
                                }
                            }
                            self.files_all = res;
                            para.sort();
                        }
                    });
                }else if(para.fetch == "file"){
                    self.filefetch()
                }else{
                }
            };


            this.msg = function (e) {
                if(para.debug==true){
                    console.log(e);
                }
            }

            this.upLoad = function (file_type) {
                var data = new FormData();
                var file_one = file_type['obj'];
                data.append('file', file_one);
                self.msg("breforePort...");
                var backData = data;
                var data = para.breforePort(data);
                if(data==false){
                    return false;
                    self.msg("cancelPort...")
                }else if(data==undefined){
                    data = backData;
                }
                $.ajax({
                    url: para.url,
                    type: 'POST',
                    data: data,
                    processData: false,
                    contentType: false,
                    success: function (responseStr) {
                        self.msg("successPort...");
                        self.msg(responseStr);
                        delete file_type['ajax'];
                        file_type['ajax'] = responseStr;
                        delete file_type['is_upload'];
                        file_type['is_upload'] = '1';
                        self.setView(file_type,1,'icon-success','success');
                        para.successPort(responseStr);
                    },
                    error : function (responseStr) {
                        self.msg("errorPort...");
                        self.msg(responseStr);
                        self.setView(file_type,1,'icon-error','failed');
                        para.errorPort(responseStr);
                    }
                });
            }
            this.setView = function (file_type,times,icon,title){
                if(times>=5){
                    return false;
                }
                key = null;
                for(let i in self.files_all){
                    if(self.files_all[i]['md5'] == file_type['md5']){
                        key = i;
                        break;
                    }
                }
                if(key!==null){
                    delete self.files_all[key];
                    self.files_all[key] = file_type;
                    var md5 = file_type['md5'];
                    htm = $(view_DOM).find("li[data-md5='"+md5+"']").find('.file-tit>div:eq(1)').html();
                    if(htm==undefined){
                        setTimeout(function(){
                            console.log('sleep'+times*1000)
                            self.setView(file_type,times+2,icon,title);
                        },times*1000);
                    }else{
                        var li_dom = $(view_DOM).find("li[data-md5='"+md5+"']").find('.icon-loading');
                        li_dom.addClass(icon).attr("title",title).removeClass('icon-loading');
                        self.fetch();
                    }
                }
            }
            this.fetch = function () {
                if(para.fetch=="img"){
                    self.imgfetch();
                }else if(para.fetch == "file"){
                    self.filefetch()
                }else{
                    //不渲染
                }
            }
            this.imgfetch = function () {
            }
            this.filefetch = function () {
            }
            $.fn.FraUpload.show = function (){

                var this_val =self.files_all
                var all = {};
                for(let k in this_val){
                    all_val = {
                        ajax:this_val[k]['ajax'],
                        filename:this_val[k]['filename'],
                        is_upload:this_val[k]['is_upload'],
                        md5:this_val[k]['md5'],
                        obj:this_val[k]['obj'],
                        size:this_val[k]['size'],
                        type:this_val[k]['type'],
                    }
                    all[k] = all_val;
                }
                return all;
            }
            $.fn.FraUpload.self = function (){
                return self;
            }

            this.init();
        });
    };
})(jQuery);