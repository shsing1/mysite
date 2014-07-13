/*global jQuery, config, CKEDITOR, noty*/
/*jslint browser : true, devel: true, regexp: true */
jQuery(document).ready(function ($) {
    'use strict';
    var win = $(window),
        // content = $('#content'),
        // doc = $(document),
        handler_fun = {},
        jqgrid_handler = {},
        my = {},
        processing,
        body = $('#body'),
        jstree_panel = $('#jstree_panel'),
        main_content = $('#main_content');

    $('#logout').click(function (event) {
        event.preventDefault();
        var op = {};

        op.url = config.base_url + '/admin/logout';
        op.success = function (result) {
            $.process_ajax_response(result, function () {
                location.reload();
            });
        };

        $.my_ajax(op, true);
    });

    // 客製化jqgrid link
    $.extend($.fn.fmatter, {
        childrens_link: function (cellValue, options, rowData) {
            options.target = null;
            return '<a href="' + rowData.childrens_url + '">' + (cellValue || '&nbsp;') + '</a>';
        }
    });

    // 設定主區塊高度
    function set_body_height() {
        var nh = $('#header').height(),
            sh = $('#footer').height(),
            h = win.height() - nh - sh;

        body.height(h);
        jstree_panel.height(h);
        main_content.height(h);
    }
    // set_body_height();


    /**
     * 設定grid寬度
     */
    function set_grid_width() {
        var ew = main_content.width();
        $("#jqGrid-table").jqGrid('setGridWidth', ew);
    }
    /**
     * 資料載入後處理後續動作
     * @param  {[type]} data   [description]
     */
    jqgrid_handler.loadComplete = function () {
        $("#jqGrid-table").find('a:not([href^=http])').address();
        set_grid_width();
    };

    // 格式化資料形態
    /*jqgrid_handler.format_edittype = function (options) {
        var colModel = options.colModel;

        $.each(colModel, function () {
            console.log(1);
            // 有設定edittype
            if (this.edittype) {
                console.log(2);
                if (this.edittype === 'editor') {
                    console.log(3);
                    this.edittype = 'custom';
                    this.editoptions = this.editoptions || {};
                    this.editoptions.custom_element = function (value) {
                        var el = $('<textarea>');

                        el.attr({rows: 10, cols: 100}).val(value);
                        return el.get(0);
                    };
                    this.editoptions.custom_value = function (elem, operation, value) {
                        var el = $(elem);
                        if (operation === 'set') {
                            el.val(value);
                            // if (CKEDITOR.instances[el.attr('id')]) {
                            //     CKEDITOR.instances[el.attr('id')].destroy();
                            // }
                            CKEDITOR.replace(el.attr('id'), {
                                customConfig: config.base_url + '/assets/js/ckeditor_config.js'
                            });
                        } else if (operation === 'get') {
                            return CKEDITOR.instances[el.attr('id')].getData();
                        }
                    };
                }
            }
        });
    };*/

    // 格式化表單項目
    jqgrid_handler.my_afterShowForm = function (formid, options) {
        var form = $(formid),
            colModel = options.colModel;

        // apply editor
        $.each(form.find('.editor'), function () {
            var id = $(this).attr('id');

            CKEDITOR.replace(id, {
                customConfig: config.base_url + '/assets/js/ckeditor_config.js'
            });
        });

        // apply datepicker
        $.each(form.find('.datepicker'), function () {
            $(this).datepicker();
        });

        // apply datetimepicker
        $.each(form.find('.datetimepicker'), function () {
            $(this).datetimepicker();
        });

        // apply timepicker
        $.each(form.find('.timepicker'), function () {
            $(this).timepicker();
        });

        // apply file
        $.each(form.find('.file'), function () {
            var wrap = $('<div class="fileupload-panel" style="margin-left:5px;">' +
                            '<div class="fileupload-buttonbar">' +
                                '<span class="btn btn-success fileinput-button">' +
                                    '<i class="glyphicon glyphicon-plus"></i>' +
                                    '<span>選擇檔案...</span>' +
                                '</span>' +
                            '</div>' +
                            '<div id="progressbar" style="margin-top:5px;height:10px;display:none;"></div>' +
                            '<div id="files" class="files"></div>' +
                        '</div>'),
                progressbar,
                files;

            $(this).parent().html('').append(wrap);
            wrap.find('.fileinput-button').append($(this));
            progressbar = wrap.find("#progressbar");
            files = wrap.find("#files");

            // progressbar.progressbar({
            //     value: 0
            // });
            // $(this).before('<span>瀏覽檔案...</span>');
            // wrap.find('.fileinput-button').append($(this));
            form.fileupload({
                url: config.base_url + '/file_upload',
                paramName: 'files[]',
                dataType: 'json',
                done: function (e, data) {
                    e = e || null;
                    $.each(data.result.files, function (index, file) {
                        index = index || null;
                        files.html('').append($('<p/>').text(file.name));
                        progressbar.hide();
                    });
                },
                start: function () {
                    progressbar.show().progressbar({
                        value: false
                    });
                },
                progressall: function (e, data) {
                    var progress = parseInt(data.loaded / data.total * 100, 10);
                    e = e || null;
                    progressbar.progressbar({
                        value: progress
                    });
                }
            });
        });

        $.each(colModel, function () {
            var el = form.find('[name="' + this.name + '"]');

            // if has placeholder
            // if (this.placeholder) {
            //     el.attr({placeholder: this.placeholder});
            // }

            // if has notice
            if (this.notice) {
                el.after('<div class="notice">' + this.notice + '</div>');
            }

            // if has datepicker
            // if (this.datepicker) {
            //     el.datepicker(this.datepicker);
            // }

            // if has datetimepicker
            // if (this.datetimepicker) {
            //     el.datetimepicker(this.datetimepicker);
            // }

            // if has mask
            if (this.mask) {
                el.mask(this.mask);
            }

            // if has editor
            // if (this.editor) {
            //     CKEDITOR.replace(el.attr('id'), {
            //         customConfig: config.base_url + '/assets/js/ckeditor_config.js'
            //     });
            // }
        });
    };

    jqgrid_handler.onClose = function (tableid) {
        var table = $(tableid);

        // editor destroy
        // $.each(cke, function () {
        //     var elm = $(this).parent().children('textarea');

        //     if (CKEDITOR.instances[elm.attr('id')]) {
        //         CKEDITOR.instances[elm.attr('id')].destroy();
        //     }
        // });
        $.each(table.find('.editor'), function () {
            var el = $(this),
                id = el.attr('id');
            if (CKEDITOR.instances[id]) {
                // console.log(id);
                CKEDITOR.instances[id].destroy();
            }
        });

        table.prev().remove();
        table.remove();
        // console.log(table);
        // $.jgrid.closeModal();

        return true;
    };

    jqgrid_handler.my_afterclickPgButtons = function (whichbutton, formid, rowid) {
        var row_data = $('#jqGrid-table').jqGrid('getRowData', rowid),
            form = $(formid);

        whichbutton = whichbutton || null;
        $.each(form.find('.editor'), function () {
            var $this = $(this),
                id = $this.attr('id');

            if (CKEDITOR.instances[id]) {
                CKEDITOR.instances[id].setData(row_data[id]);
            }
        });
    };

    jqgrid_handler.my_beforeSubmit = function (postdata, formid) {
        var form = $(formid);

        postdata = postdata || null;
        $.each(form.find('.editor'), function () {
            var $this = $(this),
                id = $this.attr('id');

            if (CKEDITOR.instances[id]) {
                // console.log(CKEDITOR.instances[id].getData());
                postdata[id] = CKEDITOR.instances[id].getData();
                // $this.val(CKEDITOR.instances[id].getData());
            }

        });
        return [true, null];
    };

    jqgrid_handler.my_afterSubmit = function (response, postdata) {
        response = response || null;
        postdata = postdata || null;
        // console.log(response);
        // console.log(postdata);
        my.success('成功更新！');
        return [true, 'unknow'];
    };

    /**
     * [ 產生jqgrid列表]
     * @param  {[object]} options [設定參數]
     */
    handler_fun.jqrid = function (options) {
        var html,
            div;

        // 刪除舊有的
        $('#jqGrid-panel').remove();
        html =  '<div id="jqGrid-panel">' +
                    '<table id="jqGrid-table"></table>' +
                    '<div id="jqGrid-pager"></div>' +
                '</div>';
        div = $(html);
        div.appendTo('#main_content');

        // 格式化表單項目
        // jqgrid_handler.format_edittype(options);

        options.loadComplete = jqgrid_handler.loadComplete;
        options.gridComplete = set_grid_width;


        div.find("#jqGrid-table").jqGrid(options);
        div.find("#jqGrid-table").jqGrid('navGrid', '#jqGrid-pager',
                {}, // navGrid options
                // edit options
                {
                width: 'auto',
                resize: false,
                // viewPagerButtons : false,
                editData: options.postData,
                afterShowForm: function (formid) {
                    jqgrid_handler.my_afterShowForm(formid, options);
                },
                afterclickPgButtons: function (whichbutton, formid, rowid) {
                    jqgrid_handler.my_afterclickPgButtons(whichbutton, formid, rowid);
                },
                beforeSubmit: function (postdata, formid) {
                    processing = my.information('處理中…');
                    return jqgrid_handler.my_beforeSubmit(postdata, formid);
                },
                afterSubmit : function (response, postdata) {
                    processing.close();
                    return jqgrid_handler.my_afterSubmit(response, postdata);
                },
                onClose: function (tableid) {
                    return jqgrid_handler.onClose(tableid);
                }
            },
                // add options
                {
                width: 'auto',
                resize: false,
                // viewPagerButtons : false,
                editData: options.postData,
                afterShowForm: function (formid) {
                    jqgrid_handler.my_afterShowForm(formid, options);
                },
                afterclickPgButtons: function (whichbutton, formid, rowid) {
                    jqgrid_handler.my_afterclickPgButtons(whichbutton, formid, rowid);
                },
                beforeSubmit: function (postdata, formid) {
                    return jqgrid_handler.my_beforeSubmit(postdata, formid);
                },
                onClose: function (tableid) {
                    return jqgrid_handler.onClose(tableid);
                }
            },
                { delData: options.postData },  // del options
                {}, // search options
                {} // view options
            );
        // div.find("#jqGrid-table").jqGrid('navGrid', '#jqGrid-pager', {edit : false, add : false, del : false});
    };

    /**
     * 產生樹狀grid
     * @param  {[type]} options [description]
     * @return {[type]}         [description]
     */
    handler_fun.tree_menu = function (options) {
        var html,
            div;
        // 刪除舊有的
        $('#tree_menu-panel').remove();
        html =  '<div id="tree_menu-panel">' +
                    '<table id="tree_menu"></table>' +
                    '<div id="ptreegrid"></div>' +
                '</div>';
        div = $(html);
        div.appendTo(jstree_panel);
        // options.loadComplete = loadComplete;
        // options.gridComplete = set_grid_width;
        div.find("#tree_menu").jqGrid(options);
    };

    function ajax_handler(result) {
        $.process_ajax_response(result, function () {
            if (result.fun) {
                handler_fun[result.fun].call(this, result.options);
            }
        });
    }

    // 設定不換頁連結
    function set_address_link() {
        // Init and change handlers
        $.address.init(function () {
            $('a:not([href^=http])').address();
        }).bind('change', function (event) {
            // Identifies the page selection
            // var handler;

            /*ajax_handler = function(data) {
                $('.content').html($('.content', data).html()).parent().show();
                $.address.title(/>([^<]*)<\/title/.exec(data)[1]);
            };*/
            // Loads the page content and inserts it into the content area
            $.ajax({
                // url: config.base_url + event.path,
                url: config.base_url + event.path,
                data : event.parameters,
                success: function (result) {
                    ajax_handler(result);
                }
            });
        });
    }
    set_address_link();

    // 建立後台左方選單
    window.init_menu = function () {
        $.ajax({
            url: 'backend_menu/tree',
            success: function (result) {
                ajax_handler(result);
            }
        });
        /*treegrid.jqGrid({
            treeGrid: true,
            treeGridModel: 'adjacency',
            ExpandColumn : 'name',
            url: 'server.php?q=tree',
            datatype: "xml",
            mtype: "POST",
            colNames: ["id", "Account", "Acc Num", "Debit", "Credit", "Balance"],
            colModel: [
                {name: 'id', index: 'id', width: 1, hidden: true, key: true},
                {name: 'name', index: 'name', width: 180},
                {name: 'num', index: 'acc_num', width: 80, align: "center"},
                {name: 'debit', index: 'debit', width: 80, align: "right"},
                {name: 'credit', index: 'credit', width: 80, align: "right"},
                {name: 'balance', index: 'balance', width: 80, align: "right"}
            ],
            height: 'auto',
            pager : "#ptreegrid",
            caption: "Treegrid example"
        });*/
    };

    // 載入後台左方選單
    if (jstree_panel.length === 1) {
        // window.init_menu();
        jstree_panel.jstree({
            'core' : {
                // "themes" : { "stripes" : true, "dots" : false },
                'data' : {
                    'url' : config.base_url + '/backend_menu/tree_data/'
                }
            }
        })
            .on('select_node.jstree', function (node, seleted) {
                node.namespace = 'jstree';
                if (seleted.node) {
                    if (seleted.node.a_attr) {
                        if (seleted.node.a_attr.href) {
                            if (seleted.node.a_attr.href !== '#') {
                                $.address.value(seleted.node.a_attr.href);
                            }
                        }
                    }
                }
            });
    }

    // 視窗大小改變
    win.on('resize load', function () {
        set_body_height();
        set_grid_width();
    });
});