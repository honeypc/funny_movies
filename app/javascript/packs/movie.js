import $ from 'jquery';

const youtube = (id) => {
  fetch('https://www.googleapis.com/youtube/v3/movies?part=id%2C+snippet+statistics&id='+ id +'&key=AIzaSyBBirrfgFjapXv1nd1TDKH1KvEAP26ptWE')
  .then(function(response) {
    return response.json();
  })
  .then(function(result){
    filledmovieInfo(result.items[0].snippet);
  })
}

const getParameterByName = (name, url) => {
  if (!url) url = window.location.href;
  name = name.replace(/[\[\]]/g, '\\$&');
  var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
      results = regex.exec(url);
  if (!results) return null;
  if (!results[2]) return '';
  return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

const filledmovieInfo = (movie) => {
  $('[name="movie\[title\]"]').val(movie.title);
  $('[name="movie\[description\]"]').val(movie.description);
  $('[name="movie\[sources\]"]').val(movie.description);
}

$(function(){
  $(document).on("change", '[name="movie\[url\]"]', (e) => {
    let id = getParameterByName('v', e.target.value);
    youtube(id);
  })
  $('#movieModal').on('shown.bs.modal', function(e) {
    var movie = $(e.relatedTarget).data();
    $('#movieTitle').text(movie.title);
    $(this).find('iframe').attr('src', 'https://www.youtube.com/embed/' + getParameterByName('v', movie.url));
  })
  $('#movieModal').on('hidden.bs.modal', function(e) {
    $(this).find('iframe').attr('src', '');
  })
})
