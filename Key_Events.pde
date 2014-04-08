void keyPressed() {
  if (GUIlocked == false){
    if (key == CODED) {
      if (keyCode == UP) 
        movePatternY--;
      if (keyCode == DOWN) 
        movePatternY++;
      if (keyCode == LEFT) 
        movePatternX--;
      if (keyCode == RIGHT) 
        movePatternX++;
    }
  }
}


