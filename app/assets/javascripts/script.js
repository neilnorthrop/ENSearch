$(document).ready(function() {
  var searchBtn = document.getElementById('btnSearch');
  var artistBtn = document.getElementById('artist_search_by_artist');
  var songBtn = document.getElementById('song_search_by_song');

  artistBtn.checked = false;
  songBtn.checked = false;

  $('[name=artist]').click(function() {
    searchBtn.disabled = false;
    songBtn.checked = false;
  });

  $('[name=song]').click(function() {
    searchBtn.disabled = false;
    artistBtn.checked = false;
  });
});