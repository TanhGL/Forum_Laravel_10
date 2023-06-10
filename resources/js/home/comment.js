$(function () {
    // js动态加载表情
    $('.b-comment').on('click', '.js-get-tuzki', function () {
        var tuzkiObj=$(this).siblings('.b-tuzki');
        if(tuzkiNumber){
            tuzkiObj.show();
            var alt=['Kiss', 'Love', 'Yeah', '啊！', '背扭', '顶', '抖胸', '88', '汗', '瞌睡', '鲁拉', '拍砖', '揉脸', '生日快乐', '摊手', '睡觉', '瘫坐', '无聊', '星星闪', '旋转', '也不行', '郁闷', '正Music', '抓墙', '撞墙至死', '歪头', '戳眼', '飘过', '互相拍砖', '砍死你', '扔桌子', '少林寺', '什么？', '转头', '我爱牛奶', '我踢', '摇晃', '晕厥', '在笼子里', '震荡'];
            var str='';
            for (var i = 1; i < 41; i++) {
                str+='<img src="http://'+window.location.host+'/statics/emote/tuzki/'+i+'.gif" title="'+alt[i-1]+'" alt="'+titleName+'">';
            };
            tuzkiObj.html(str);
            tuzkiNumber=0;
        }else{
            tuzkiObj.hide();
            tuzkiNumber=1;
        }
    })

    // 点击添加表情
    $('.b-comment').on('click','.b-tuzki img', function(event) {

        /**
         * 将光标移到编辑框的最后
         * @param contentEditableElement
         */
        function setEndOfContenteditable(contentEditableElement){
            var range,selection;
            if(document.createRange)
            {
                range = document.createRange();
                range.selectNodeContents(contentEditableElement);
                range.collapse(false);
                selection = window.getSelection();
                selection.removeAllRanges();
                selection.addRange(range);
            } else if(document.selection) {
                range = document.body.createTextRange();
                range.moveToElementText(contentEditableElement);
                range.collapse(false);
                range.select();
            }
        }

        /**
         * 在textarea光标后插入内容
         * @param  string  str 需要插入的内容
         */
        function insertHtmlAtCaret(str) {
            var sel, range;
            if(window.getSelection){
                sel = window.getSelection();
                if (sel.getRangeAt && sel.rangeCount) {
                    range = sel.getRangeAt(0);
                    range.deleteContents();
                    var el = document.createElement("div");
                    el.innerHTML = str;
                    var frag = document.createDocumentFragment(), node, lastNode;
                    while ( (node = el.firstChild) ) {
                        lastNode = frag.appendChild(node);
                    }
                    range.insertNode(frag);
                    if(lastNode){
                        range = range.cloneRange();
                        range.setStartAfter(lastNode);
                        range.collapse(true);
                        sel.removeAllRanges();
                        sel.addRange(range);
                    }
                }
            } else if (document.selection && document.selection.type != "Control") {
                document.selection.createRange().pasteHTML(str);
            }
        }

        var str=$(this).prop("outerHTML");
        setEndOfContenteditable($(this).parents('.b-box-textarea').eq(0).find('.b-box-content').get(0))
        insertHtmlAtCaret(str);
        $(this).parents('.b-tuzki').hide();
        tuzkiNumber=1;
    });

    // 点击回复按钮
    $('.b-comment').on('click', '.js-reply', function () {
        var boxTextarea = $('.b-user-comment').find('.b-box-textarea');

        if(boxTextarea.length === 1){
            boxTextarea.remove();
        }

        var article_id = $(this).attr('article_id'),
            comment_id = $(this).attr('comment_id'),
            parent_id = $(this).attr('parent_id'),
            username = $(this).attr('username'),
            depth = $(this).attr('depth') * 1 + 1;

        var html = `
            <div class="b-box-textarea b-depth-margin-${depth}">
                <div class="b-box-content js-hint" contenteditable="true">
                    ${translate.pleaseLoginToReply}
                </div>
                <ul class="b-emote-submit">
                    <li class="b-emote">
                        <i class="fa fa-smile-o js-get-tuzki"></i>
                        <input class="form-control b-email" type="text" name="email" placeholder="${translate.emailForNotifications}" value="${userEmail}">
                         <div class="b-tuzki"></div>
                    </li>
                    <li class="b-submit-button">
                        <input class="js-comment-btn" type="button" value="${translate.reply}" article_id="${article_id}" parent_id="${comment_id}" username="${username}" depth="${depth}">
                    </li>
                    <li class="b-clear-float"></li>
                </ul>
            </div>
        `;

        var lastChildObject = $(`a[parent_id='${comment_id}']`).parents('.b-user').eq(0);

        if (lastChildObject.length === 0) {
            $(this).parents('.b-user').eq(0).after(html);
        } else {
            lastChildObject.after(html);
        }
    })

    // 给拥有 contenteditable 属性的元素绑定事件
    $('body').on('focus', '[contenteditable]', function() {
        var $this = $(this);
        $this.data('before', $this.html());
        return $this;
    }).on('blur keyup paste input', '[contenteditable]', function() {
        var $this = $(this);
        if ($this.data('before') !== $this.html()) {
            $this.data('before', $this.html());
            $this.trigger('change');
        }
        return $this;
    });

    // 删除提示和样式
    $('.b-comment').on('focus', '.js-hint', function () {
        var word = $.trim($(this).text());

        if(word === translate.pleaseLoginToComment || word === translate.pleaseLoginToReply){
            $(this).text('');
            $(this).css('color', '#333');
        }
    })

    // 在本地存储评论的内容
    $('.b-comment').on('change', '.js-hint', function () {
        localStorage.setItem('comment', $(this).html());
    })

    // 从本地存储中获取评论的内容
    if (localStorage.getItem('comment') !== null) {
        $('.b-box-content').html(localStorage.getItem('comment'));
    }

    // 发布评论
    $('.b-comment').on('click', '.js-comment-btn', function () {
        var obj=$(this);
        var content = $(obj).parents('.b-box-textarea').eq(0).find('.b-box-content').html();
        if (content !== '' && content !== translate.pleaseLoginToComment) {
            var article_id = $(obj).attr('article_id'),
                parent_id = $(obj).attr('parent_id'),
                email = $(obj).parents('.b-box-textarea').eq(0).find("input[name='email']").val(),
                depth = $(this).attr('depth'),
                postData = {
                    "article_id": article_id,
                    "parent_id": parent_id,
                    'content': content,
                    'email': email
                };
            // 显示loading
            layer.load(1);
            // ajax评论
            $.ajax({
                type: 'POST',
                url: ajaxCommentUrl,
                data: postData,
                success: (data, status) => {
                    localStorage.removeItem('comment');
                    var newCommentId = data.id;
                    var replyName = $(obj).attr('username');
                    var now = new Date();
                    // 获取当前时间
                    var date = now.getFullYear() + "-" + ((now.getMonth() + 1) < 10 ? "0" : "") + (now.getMonth() + 1) + "-" + (now.getDate() < 10 ? "0" : "") + now.getDate() + '&emsp;' + (now.getHours() < 10 ? "0" : "") + now.getHours() + ':' + (now.getMinutes() < 10 ? "0" : "") + now.getMinutes() + ':' + (now.getSeconds() < 10 ? "0" : "") + now.getSeconds();
                    var headImg = $('#b-login-word .b-head_img').attr('src');
                    var nickName = $('#b-login-word .b-nickname').text();
                    if (parent_id == 0) {
                        // parent_id为0表示新增评论
                        var html = `
                            <div class="row b-user b-parent b-depth-padding-${depth}">
                                <div class="col-xs-2 col-sm-1 col-md-1 col-lg-1 b-pic-col">
                                    <img title="${titleName}" alt="${titleName}" src="${headImg}" class="b-user-pic">
                                </div>
                                <div class="col-xs-10 col-sm-11 col-md-11 col-lg-11 b-content-col">
                                    <p class="b-content">
                                        <span class="b-user-name">${nickName}</span>：${content}
                                    </p>
                                    <p class="b-date">
                                        ${date} <a class="js-reply"
                                                   href="javascript:;"
                                                   username="${nickName}"
                                                   parent_id="0"
                                                   article_id="${article_id}"
                                                   comment_id="${newCommentId}"
                                                   depth="0"
                                                   >${translate.reply}</a>
                                    </p>
                                    <div class="b-clear-float"></div>
                                </div>
                            </div>
                        `;
                        $('.b-user-comment').prepend(html);
                    } else {
                        // parent_id不为0表示是回复评论
                        var html = `
                            <div class="row b-user b-depth-padding-${depth}"">
                                <div class="col-xs-2 col-sm-1 col-md-1 col-lg-1 b-pic-col">
                                    <img title="${titleName}" alt="${titleName}" src="${headImg}" class="b-user-pic">
                                </div>
                                <ul class="col-xs-10 col-sm-11 col-md-11 col-lg-11 b-content-col">
                                    <li class="b-content">
                                        <span class="b-reply-name">${nickName}</span>
                                        <span class="b-reply">${translate.reply}</span>
                                        <span class="b-user-name">${replyName}</span>：${content}
                                    </li>
                                    <li class="b-date">
                                        ${date} <a class="js-reply"
                                                   href="javascript:;"
                                                   parent_id="${parent_id}"
                                                   article_id="${article_id}"
                                                   username="${replyName}"
                                                   comment_id="${newCommentId}"
                                                   depth="${depth}"
                                                   >${translate.reply}</a>
                                    </li>
                                    <li class="b-clear-float"></li>
                                </ul>
                            </div>
                        `;

                        $(obj).parents('.b-box-textarea').eq(0).after(html);
                        $(obj).parents('.b-box-textarea').eq(0).remove();
                    }
                    $(obj).parents('.b-box-textarea').eq(0).find('.b-box-content').html('');
                    // 关闭loading
                    layer.closeAll();
                },
                error: XMLHttpRequest => {
                    if (XMLHttpRequest.status == 422) {
                        // 关闭loading
                        layer.closeAll();
                        layer.msg(XMLHttpRequest.responseJSON.errors.content[0], {
                            icon: 5,
                            time: 2000
                        })
                    }
                }
            });
        }
    })
})
