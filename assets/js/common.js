/*global jQuery, config, CKEDITOR, noty*/
/*jslint browser : true, devel: true, regexp: true */
jQuery(document).ready(function ($) {
    'use strict';

    $.ajaxSetup({
        type: 'POST',
        dataType: 'json',
        error: function (jqXHR) {
            if (jqXHR.status !== 200) {
                if (jqXHR.responseText === '') {
                    $.my_error(jqXHR.statusText);
                } else {
                    $.my_error(jqXHR.responseText);
                }
            }
        }
    });

    $.my_process = function (msg) {
        var message,
            n;

        message = msg || 'Process...';
        n = noty({
            layout: 'topCenter',
            type: 'information',
            modal: true,
            text: message,
            closeWith: []
        });
        return n;
    };
    // $.my_process();

    $.my_success = function (message) {
        var n = noty({
            layout: 'topCenter',
            type: 'success',
            modal: true,
            text: message,
            closeWith: []
        });
        return n;
    };
    // $.my_success('success');

    $.my_alert = function (message, tl) {
        var div = $('<div>'),
            icon = $('<span>').addClass('ui-icon ui-icon-info').css({'float': 'left', 'margin-top': 4}),
            content = $('<div>').css({'margin-left': 20}).append(message),
            title = tl || 'System message';

        div.append(icon).append(content);
        div.attr({
            'title': title
        })
            .dialog({
                modal: true,
                close: function () {
                    div.dialog('destroy').remove();
                }
            });

        return div;
    };
    // $.my_alert('test');

    $.my_error = function (message, tl) {
        var div = $('<div>').addClass('ui-state-error').css({border: 0}),
            icon = $('<span>').addClass('ui-icon ui-icon-alert').css({'float': 'left', 'margin-top': 4}),
            content = $('<div>').css({'margin-left': 20}).append(message),
            title = tl || 'System message';

        div.append(icon).append(content);
        div.attr({
            'title': title
        })
            .dialog({
                modal: true,
                close: function () {
                    div.dialog('destroy').remove();
                }
            });

        return div;
    };
    // $.my_error('test');

    $.process_ajax_response = function (result, callback) {
        if (result.error) {
            $.my_error(result.message);
        } else if (result.redirect) {
            location.href = result.redirect;
        } else if (callback) {
            callback();
        }
    };

    // warp ajax
    $.my_ajax = function (op, mask) {
        var settings = {},
            process;

        if (mask) {
            process = $.my_process();
        }

        settings.complete = function () {
            if (mask) {
                process.close();
            }
        };
        settings.success = function (result) {
            $.process_ajax_response(result);
        };

        settings = $.extend(settings, op);

        $.ajax(settings);
    };
});