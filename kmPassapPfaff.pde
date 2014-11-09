// read pattern from screen
void passapReadColourPatternFromScreen(int offset) {

  loadPixels();

  // each PatternRow hast to be knitted twice with one color (RTL-> LTR-> colour change)

  if (passapSecondRowToggle == false) {
    //knit RTL
    //activate Colour change servos after RTL Row
    changeColour();
    //read pattern
    switch(knittingTechnique) {
    case 1: 
      passapReadColourInPattern(offset);
      break;
    case 2: 
      passapReadColourInPattern(offset);
      break;
    case 3: 
      passapReadColourInPattern256(offset);
      break;
    case 4: 
      passapReadColourInPattern256(offset);
      break;
    case 5: 
      myPatternBack = "10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101";
      passapReadColourInPattern(offset);
      break;
    case 6:
      if (myPatternBack.length()==0) {
        myPatternBack = "0";
      }
      char numberOne = 49;
      if (myPatternBack.charAt(0)==numberOne) {
        myPatternBack = "01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010";
      } else { 
        myPatternBack = "10101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101";
      }
      passapReadColourInPattern(offset);
      break;
    default:          // default: change pattern every row first colour is active
      passapReadColourInPattern(offset);
      //next row
      txtfieldRowCounter.setText(str(rowCounter));
      println("Move Row in GUI");
      rowCounter++;
      txtfieldRowCounter.setText(str(rowCounter));
      moveRowInGUI();
      break;
    }


    // activate second row
    passapSecondRowToggle = true;
  } else {
    // knit  LTR   (same pattern as before)

    //activate Colour change
    //changeColour();

    //read pattern
    switch(knittingTechnique) {
    case 1:  // 2, 3 and 4 colours (one pixel two knits)
      //do nothing -> use pattern in memory
      println("Second Row with Pattern");
      InfoText = ("Second Row with Pattern");
      break;
    case 2: // 2, 3 and 4 colours (one pixel one knit)
      passapKnitEmptyRow();
      println("Second Row without Pattern");
      InfoText = ("Second Row with Pattern");
      break;
    case 3: //     lace
      // dont knit third colour
      if (colourCounter == 1) {
        colourCounter =2;
      }
      passapKnitEmptyRow();
      println("Second Row without Pattern");
      InfoText = ("Second Row with Pattern");
      break;
    case 4: 
      // dont knit third colour
      if (colourCounter == 1) {
        colourCounter =2;
      }
      //passapKnitEmptyRow();
      println("Second Row without Pattern");
      break;
    case 5: 
      //do nothing -> use pattern in memory
      println("Second Row with Pattern");
      InfoText = ("Second Row with Pattern");
      //backbed pattern
      myPatternBack = "01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010";
      sendCommand(COM_CMD_PATTERN_BACK, myPatternBack);
      println("C:" + (colourCounter+1) + " - B:" + myPatternBack);
      break;
    case 6: 
      //do nothing -> use pattern in memory
      println("Second Row with Pattern");
      InfoText = ("Second Row with Pattern");
      break;
    default:             // default: change pattern every row - first colour is active, any other will be ignored
      passapReadColourInPattern(offset);
      colourCounter--;
      //next row
      println("Move Row in GUI");
      rowCounter++;
      txtfieldRowCounter.setText(str(rowCounter));
      moveRowInGUI();
      break;
    }

    // next colour
    colourCounter++;

    // check if all colours are done
    if (colourCounter >= patternImageColorList.length) {
      colourCounter = 0;
      // next row
      println("Move Row in GUI");
      rowCounter++;
      txtfieldRowCounter.setText(str(rowCounter));
      moveRowInGUI();
    }

    passapSecondRowToggle = false;
  }
}

void passapKnitEmptyRow() {
  myPattern = "";
  for (int i = 0; i < workingWidth; i++) {
    myPattern += "0";
  }

  sendCommand(COM_CMD_PATTERN, myPattern);
  println(myPattern);
  sendCommand(COM_CMD_PATTERN_BACK, myPattern);
  println(myPattern);
}


void passapReadColourInPattern(int offset) {
  switchBedState = false;
  //dirty hack to redraw the image
  duplicateDraw();
  loadPixels();

  //read front pattern
  myPattern = "";
  println("ColourToKnit:" + hex(patternImageColorList[colourCounter]));
  for (int i = 0; i < workingWidth; i++) {
    // println(hex(pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor)*width) + ((gridStartX+(totalWidth/2-workingWidth/2)*scalingfactor)+scalingfactor/2) + i*scalingfactor]) );

    if (((pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor)*width) + ((gridStartX+(totalWidth/2-workingWidth/2+workingWidthOffset)*scalingfactor)+scalingfactor/2) + i*scalingfactor] )) == patternImageColorList[colourCounter]) {
      myPattern += "1";
    } else {
      myPattern += "0";
    }
  }

  sendCommand(COM_CMD_PATTERN, myPattern);
  println("C:" + (colourCounter+1) + " - P:" + myPattern);


  //FRANKENPASSAP
  if (knittingMachine == 3) {
    if (FrankenpassapBackInvers==true) {
      frankenpassapKnitBackInvers();
    } else {
      if (knittingTechnique == 5 | knittingTechnique == 6) {
        //do nothing
      } else
      {
        // read back pattern

        switchBedState = true;
        //dirty hack to redraw the image
        duplicateDraw();
        loadPixels();

        myPatternBack = "";
        for (int i = 0; i < workingWidth; i++) {
          //println(get(((gridStartX+(totalWidth/2-workingWidth/2+workingWidthOffset)*scalingfactor)+scalingfactor/2) + i*scalingfactor,(gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor));
          if (((pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor)*width) + ((gridStartX+(totalWidth/2-workingWidth/2+workingWidthOffset)*scalingfactor)+scalingfactor/2) + i*scalingfactor] )) == patternImageColorList[colourCounter]) {
            myPatternBack += "1";
          } else {
            myPatternBack += "0";
          }
        }
        switchBedState = false;
      }
    }
    sendCommand(COM_CMD_PATTERN_BACK, myPatternBack);
    println("C:" + (colourCounter+1) + " - B:" + myPatternBack);
    InfoText = ("C:" + (colourCounter+1) + " - P:" + myPattern + "\nC:" + (colourCounter+1) + " - B:" + myPatternBack );
    // saveFrame("output2-####.tga");
  }
}




void passapReadColourInPattern256(int offset) {
  myPattern = "";
  // println("ColourToKnit:" + hex(patternImageColorList[colourCounter]));
  for (int i = 0; i < workingWidth; i++) {
    int numberPixel = (((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor)*width) + ((gridStartX+(totalWidth/2-workingWidth/2+workingWidthOffset)*scalingfactor)+scalingfactor/2) + i*scalingfactor;
    if (colourCounter == 0) {
      //use second and third colour, if no third colour use only second
      if (pixels[numberPixel]  == patternImageColorList[colourCounter+1] | pixels[numberPixel]  == patternImageColorList[patternImageColorList.length-1]) {
        myPattern += "1";
      } else {
        myPattern += "0";
      }
    } else {
      //use second colour
      if (pixels[numberPixel]  == patternImageColorList[colourCounter]) {
        myPattern += "1";
      } else {
        myPattern += "0";
      }
    }
  }

  sendCommand(COM_CMD_PATTERN, myPattern);
  println("C:" + (colourCounter+1) + " - P:" + myPattern);

  //  frankenpassapKnitBackInvers();
  //  sendCommand(COM_CMD_PATTERN_BACK, myPatternBack);
  //  println("C:" + (colourCounter+1) + " - B:" + myPatternBack);
}


void frankenpassapKnitBackInvers() {
  println(myPattern.length());
  myPatternBack="";
  //  for (int i = myPattern.length (); i > 0; i--) {
  //    myPatternBack += myPattern.charAt(i-1);
  //  }

  // invert actual row
  for (int i = 0; i < myPattern.length (); i++) {
    if (int(myPattern.charAt(i))==49) {
      myPatternBack += 0;
    } else {
      myPatternBack += 1;
    }
  }
}


void duplicateDraw() {
  background(backgroundColour);

  drawWorkingArea();
  if (switchBedState == false) {
    drawPattern();
  } else {
    drawPatternBack();
  }

  drawGrid();
  displayInfoText();
  drawColourDefinition();
  //clear when knitting
  if (GUIlocked == true) {
    // clear header
    fill(204, 0, 0);
    rect(0, gridStartY, gridStartX, height);
  }
}

