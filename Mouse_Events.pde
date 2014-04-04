// Mouse Events
void mousePressed() {
  // work only on grid
  if (mouseX > gridStartX && mouseY > gridStartY) {
    mouseStartX = mouseX;
    mouseStartY = mouseY;
    
    mousePatternStartX = movePatternX;
    mousePatternStartY = movePatternY;
  }
  else {
  mouseLocked = true;
  }
}

void mouseDragged() {
  
  if (mouseLocked == false && GUIlocked == false){
   if (mouseX > gridStartX && mouseY > gridStartY) {
    mouseOffsetX = mouseX-mouseStartX; 
    mouseOffsetY = mouseY-mouseStartY; 
    
    movePatternX = mousePatternStartX + mouseOffsetX/(scalingfactor);
    movePatternY = mousePatternStartY + mouseOffsetY/(scalingfactor);
   }
  
}
}
void mouseReleased() {
 mouseLocked = false;
}

