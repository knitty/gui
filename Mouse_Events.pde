// Mouse Events
void mousePressed() {

  //println(mouseX + "-" + mouseY);

  //change colour order in pattern
  //if (knittingMachine == 2 ||knittingMachine == 3) {
  int distanceColourRectangle = 40;

  // check for colour change 1 & 2
  if (mouseX > (colourRectanglesX + 60) && mouseX < (colourRectanglesX+75) && mouseY > 50 && mouseY < 75) {
    int storeColour = patternImageColorList[0];
    patternImageColorList[0] = patternImageColorList[1];
    patternImageColorList[1] = storeColour;
  }

  // check for colour change 2 & 3
  if (patternImageColorList.length > 2) {
    if (mouseX > (colourRectanglesX + 60) + distanceColourRectangle && mouseX < (colourRectanglesX+75) + distanceColourRectangle && mouseY > 50 && mouseY < 75) {
      int storeColour = patternImageColorList[1];
      patternImageColorList[1] = patternImageColorList[2];
      patternImageColorList[2] = storeColour;
    }
  }

  // check for colour change 3 & 4
  if (patternImageColorList.length > 3) {
    if (mouseX > (colourRectanglesX + 60) + distanceColourRectangle *2 && mouseX < (colourRectanglesX+75) + distanceColourRectangle *2  && mouseY > 50 && mouseY < 75) {
      int storeColour = patternImageColorList[2];
      patternImageColorList[2] = patternImageColorList[3];
      patternImageColorList[3] = storeColour;
    }
  }
  //}

  // work only on grid
  if (mouseX > gridStartX && mouseY > gridStartY) {
    mouseStartX = mouseX;
    mouseStartY = mouseY;

    if (switchBedState==false) {
      mousePatternStartX = movePatternX;
      mousePatternStartY = movePatternY;
    } else {
      mousePatternStartX = movePatternBackX;
      mousePatternStartY = movePatternBackY;
    }
  } else {
    mouseLocked = true;
  }
}


void mouseDragged() {
  if (mouseLocked == false && GUIlocked == false) {
    if (mouseX > gridStartX && mouseY > gridStartY) {
      mouseOffsetX = mouseX-mouseStartX;
      mouseOffsetY = mouseY-mouseStartY;

      if (switchBedState==false) {
        movePatternX = mousePatternStartX + mouseOffsetX/(scalingfactor);
        movePatternY = mousePatternStartY + mouseOffsetY/(scalingfactor);
      } else {
        movePatternBackX = mousePatternStartX + mouseOffsetX/(scalingfactor);
        movePatternBackY = mousePatternStartY + mouseOffsetY/(scalingfactor);
      }
    }
  }
}


void mouseReleased() {
  mouseLocked = false;
  saveBasicKnittySettings();
}

