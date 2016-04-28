// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/draggable
//= require jquery-ui/droppable
//= require foundation
//= require_tree .

$(function(){
  $(document).foundation();
  $( ".draggable" ).draggable({ cursor: "move",
                                revert: "invalid"
                              });


  $( ".member" ).droppable({
    accept: ".draggable",
    activate: function( event, ui ) {},
    drop: function(ev, ui) {
      var $el = $(ui.draggable);

      $el
        .detach()
        .css({top: 0,left: 0})
        .appendTo(this)
      ;

      $('<input type="hidden"/>')
        .attr({
          name: this.id,
          value: $el.text()
        })
        .insertBefore(this)
      ;
      $(this).droppable("destroy")
    }
  });

  $(".party-wrapper").submit(function submitForm(e) {
    e.preventDefault();
    var data = $('.party-wrapper').serialize();

    $.post('/parties', data);
  })
});
