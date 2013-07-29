$(function() {
  $('#artist-artist').click(function() {
    $('#song-song').toggleClass('.radio');
  });
  $('#song-song').click(function() {
    $('#artist-artist').toggleClass('.radio');
  });
});