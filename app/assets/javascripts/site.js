$(document).on('turbolinks:load ajaxSuccess', function() {
  // JavaScript in here will be loaded when the page is ready
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