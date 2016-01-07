PL = {
  data: null,

  size: null,

  current_track_id: null,

  set: function(data){
    PL.data = data;
    PL.size = data.length - 1;
    PL.init();
  },

  get: function(id){
    return this.data[id];
  },

  getSongUrl: function(id){
    return this.data[id].url;
  },

  setCurrentTrackID: function(id){
    this.current_track_id = id;
  },

  setActiveRecord: function(){
    $current_record = $('#' + this.current_track_id).parent();
    $('.reactive').removeClass('reactive');
    $current_record.addClass('reactive');
    $('#current_track').html(PL.get(this.current_track_id).name);
  },

  runTrack: function(){
    audio_player.src = PL.getSongUrl(this.current_track_id);
    audio_player.play();
  },

  isPlaying: function(){ return !audio_player.paused; },

  cleanCurrentTrack: function(){
    $('.reactive .pause, .reactive .continue').replaceWith("<div id='" + PL.current_track_id + "'class='play-song'>");
  },

  defineNextTrackID: function(){
    if (PL.current_track_id == PL.size) { return 0; }
      else { return PL.current_track_id + 1; }
  },

  changePlayToPause: function(){
    $('.reactive .play-song, .reactive .continue').replaceWith("<div id='" + PL.current_track_id + "'class='pause'>");
    PL.addTrackPauseListener();
  },

  changePauseToPlay: function(){
    $('.reactive .pause').replaceWith("<div id='"+ PL.current_track_id +"'class='continue'>");
    PL.addTrackPlayListener();
  },

  addTrackPauseListener: function(){
    $('.pause').click(function(){audio_player.pause();});
  },

  addTrackPlayListener: function(){
    $('.continue').click(function(){audio_player.play();});
  },

  updatePreviousRecord: function(){
    $('.reactive .pause, .reactive .continue').replaceWith("<div id='"+ PL.current_track_id +"'class='play-song'>");
    PL.addPlayListener();
  },

  /*=============== INIT ++++++++++++++++++++*/

  init: function(){
    this.clearPlayList();
    this.drowPlayList();
    this.addPlayerListeners();
    this.addPlayListener();
    this.addEndedListener();
  },

  clearPlayList: function(){
    $('#play_list').empty();
  },

  drowPlayList: function(){
    $.each(PL.data, function(i,song){
      $('#play_list').append("<div class='record row'><div id=" + i + " class='play-song two columns'></div><div class='track_name overme six columns'>" + song.name);
      $('#' + i).next().attr('title', song.name)
    })
  },

  addPlayerListeners: function(){
    audio_player.addEventListener('pause', PL.changePauseToPlay);
    audio_player.addEventListener('play', PL.changePlayToPause);
  },

  addPlayListener: function(){
    $('.play-song').click(function(){
      if ($('.reactive .pause, .reactive .continue').length) {PL.updatePreviousRecord();}
      PL.setCurrentTrackID(parseInt(this.id));
      PL.setActiveRecord();
      PL.runTrack();
    });
  },

  addEndedListener: function(){
    audio_player.addEventListener('ended', function(){
      PL.updatePreviousRecord();
      PL.setCurrentTrackID(PL.defineNextTrackID());
      PL.setActiveRecord();
      PL.runTrack();
    });
  }
}
