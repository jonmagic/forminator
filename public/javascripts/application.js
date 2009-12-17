$(function(){
  // dialog
  $('#dialog').dialog({
    autoOpen: false,
    modal: true,
    width: 500,
    height: 200
  });
  // list rollover
  $('.jm-list a, .jm-buttons li').live('mouseover', function(){
    $(this).addClass('ui-state-hover')
  });
  $('.jm-list a, .jm-buttons li').live('mouseout', function(){
    $(this).removeClass('ui-state-hover')
  });
  // hiljack the enter key
  $('form').live('keydown', function(e){
    if(e.keyCode == 13) {
      $('button:contains("Save")').click()
      return false;
    }
  });
});

function show_correct_form_fields(){
  if (_.include(["multiple_choice","checkboxes","list","ifthen"], $("#question_type").val())) {
    $('label[for="question_text"]').show();
    $('input#question_text').show();
    $('label[for="question_instructions"]').show();
    $('input#question_instructions').show();
    $('label[for="question_required"]').show();
    $('input#question_required').show();
    if($('div.options div').length==0){
      $('div.options').append('<div class="new"><label for="question_option">Option</label><input name="question[options][]" type="text" class="float-left" /><span class="ui-icon ui-icon-plus float-left"></span></div><div class="spacer"></div>');  
    }
    $('div.options input.first').focus();
  }else if(_.include(["text","paragraph"], $("#question_type").val())){
    $('label[for="question_text"]').show();
    $('input#question_text').show();
    $('label[for="question_instructions"]').show();
    $('input#question_instructions').show();
    $('label[for="question_required"]').show();
    $('input#question_required').show();
    $('div.options').empty();
  }else if(_.include(["title","subtitle"], $("#question_type").val())){
    $('label[for="question_text"]').show();
    $('input#question_text').show();
    $('label[for="question_instructions"]').hide();
    $('input#question_instructions').hide();
    $('label[for="question_required"]').hide();
    $('input#question_required').hide();
    $('div.options').empty();
  }else if(_.include(["divider"], $("#question_type").val())){
    $('label[for="question_text"]').hide();
    $('input#question_text').hide();
    $('label[for="question_instructions"]').hide();
    $('input#question_instructions').hide();
    $('label[for="question_required"]').hide();
    $('input#question_required').hide();
    $('div.options').empty();
  }else{
    $('div.options').empty();
  }
}

(function(){

    var special = jQuery.event.special,
        uid1 = 'D' + (+new Date()),
        uid2 = 'D' + (+new Date() + 1);

    jQuery.event.special.focus = {
        setup: function() {
            var _self = this,
                handler = function(e) {
                    e = jQuery.event.fix(e);
                    e.type = 'focus';
                    if (_self === document) {
                        jQuery.event.handle.call(_self, e);
                    }
                };

            jQuery(this).data(uid1, handler);

            if (_self === document) {
                /* Must be live() */
                if (_self.addEventListener) {
                    _self.addEventListener('focus', handler, true);
                } else {
                    _self.attachEvent('onfocusin', handler);
                }
            } else {
                return false;
            }

        },
        teardown: function() {
            var handler = jQuery(this).data(uid1);
            if (this === document) {
                if (this.removeEventListener) {
                    this.removeEventListener('focus', handler, true);
                } else {
                    this.detachEvent('onfocusin', handler);
                }
            }
        }
    };

    jQuery.event.special.blur = {
        setup: function() {
            var _self = this,
                handler = function(e) {
                    e = jQuery.event.fix(e);
                    e.type = 'blur';
                    if (_self === document) {
                        jQuery.event.handle.call(_self, e);
                    }
                };

            jQuery(this).data(uid2, handler);

            if (_self === document) {
                /* Must be live() */
                if (_self.addEventListener) {
                    _self.addEventListener('blur', handler, true);
                } else {
                    _self.attachEvent('onfocusout', handler);
                }
            } else {
                return false;
            }

        },
        teardown: function() {
            var handler = jQuery(this).data(uid2);
            if (this === document) {
                if (this.removeEventListener) {
                    this.removeEventListener('blur', handler, true);
                } else {
                    this.detachEvent('onfocusout', handler);
                }
            }
        }
    };

})();

