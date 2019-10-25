// all the key press interactions are controlled in this function
void keyPressed() {
  // the following key presses all turn some boolens on, and turns off (by assigning true and false)
  if (key =='n') {
    rotateNormal = true;
    rotateFaster = false;
    rotateFastest = false;
  } else if (key =='f') {
    rotateFaster = true;
    rotateFastest = false;
    rotateNormal = false;
  } else if (key == 'F') {
    rotateFastest = true;
    rotateFaster = false;
    rotateNormal = false;
  } else if (key == 'p') {
    pt = true;
    cont = false;
  } else if (key == 'c') {
    cont = true;
    pt = false;
  } else if (key == 'l') {
    lorenzOn = true;
    rosslerOn = false;
  } else if (key == 'r') {
    rosslerOn = true;
    lorenzOn = false;
  } else if (key == 's') { // pressing s would turn on/off the str boolean
    str = !str;
  } else if (key == 'm') { // pressing m would play/pause money, pausing gravity if gravity is playing, and turn 
    moneyOn = true;        // respective booleans on and others off
    gravityOn = false;
    micOn = false;
    if (money.isPlaying()) {
      money.pause();
    } else if (gravity.isPlaying()) {
      gravity.pause();
      money.play();
    } else money.play();
  } else if (key == 'g') { // pressing g would play/pause gravity, pausing money if money is playing, and turn respective
    gravityOn = true;      // booleans on and others off
    moneyOn = false;
    micOn = false;
    if (gravity.isPlaying()) {
      gravity.pause();
    } else if (money.isPlaying()) {
      money.pause();
      gravity.play();
    } else gravity.play();
  } else if (key == 'i') { // pressing i would pause any song that is playing and switch the mic boolean on, turning others
    micOn = true;          // off
    moneyOn = false;
    gravityOn = false;
    gravity.pause();
    money.pause();
  }
}
