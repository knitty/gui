// read pattern from screen

void superbaReadPatternFromScreen(int offset) {
  // moveRowInGUI();  ??
  duplicateDraw();
  loadPixels();

  myPattern = "";

  // println(hex(pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2)*width) + ((gridStartX+(totalWidth/2-workingWidth/2)*scalingfactor)+scalingfactor/2)]) );
  for (int i = 0; i < workingWidth; i++) {
    //    if (((pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor)*width) + ((gridStartX+(totalWidth/2-workingWidth/2)*scalingfactor)+scalingfactor/2) + i*scalingfactor] ) & 0x00FFFFFF) == 0x000000) {
    if ((pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor)*width) + ((gridStartX+(totalWidth/2-workingWidth/2)*scalingfactor)+scalingfactor/2) + i*scalingfactor] ) == patternImageColorList[0]) {

      myPattern += "0";
    } else {
      myPattern += "1";
    }
  }

  sendCommand(COM_CMD_PATTERN, myPattern);
  //movePatternY++;
  println(myPattern);
  InfoText = ("P:" + myPattern);
  println("Move Row in GUI");
  rowCounter++;
  txtfieldRowCounter.setText(str(rowCounter));
  moveRowInGUI();
}

