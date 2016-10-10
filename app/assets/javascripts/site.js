$(document).on('ready page:load ajaxSuccess', function(){
    refreshRating();
    $('.image-zoom').elevateZoom();
});

var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
};