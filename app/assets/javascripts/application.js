//= require jquery
//= require jquery_ujs
//= require elemental

//= require base
//= require_tree ./helpers/
//= require_tree ./behaviors/
//

$(document).ready(function() {
    var audioSection = $('section#audio');
    $('a.html5').click(function() {

        var audio = $('<audio>', {
             controls : 'controls'
        });

        var url = $(this).attr('href');
        $('<source>').attr('src', url).appendTo(audio);
        audioSection.html(audio);
        return false;
    });
});
