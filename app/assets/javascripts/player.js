soundManager.setup({
  url: "",
  onready: function() {
    var mySound = soundManager.createSound({
      id: "aSound",
      url: "path/to/a.mp3"
    });

    mySound.play();
  }
});
