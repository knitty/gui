void keyPressed() {
  if (key=='s') {
    startKinittingButtonKeyboard();
  }  
  if (key=='p') {
    pauseKinittingButtonKeyboard();
  }  

  if (key=='o') {
    oneRowBackKinittingButtonKeyboard();
  } 

  //nope if GUI is locked  
  if (GUIlocked == false) {
    if (key == CODED) {
      if (keyCode == UP) {
        if (switchBedState==false) {
          movePatternY--;
        } else {
          movePatternBackY--;
        }
      }
      if (keyCode == DOWN) {
        if (switchBedState==false) {
          movePatternY++;
        } else {
          movePatternBackY++;
        }
      }
      if (keyCode == LEFT) {
        if (switchBedState==false) {
          movePatternX--;
        } else {
          movePatternBackX--;
        }
      }
      if (keyCode == RIGHT) {
        if (switchBedState==false) {
          movePatternX++;
        } else {
          movePatternBackX++;
        }
      }
    }
  }
  saveBasicKnittySettings();
}

