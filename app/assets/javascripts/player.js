soundManager.setup({
  flashVersion: 8,

  onready: function() {
    var mySound = soundManager.createSound({
      id: "aSound",
      url: "/1/mysong.mp3",
      autoLoad: true
    });

    mySound.play();
  }
});
