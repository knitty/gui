void displayButtonsGUI() {

  //Dropdowns

  // knittingMachine
  int x = 190; 
  int y = 0;
  knittingMachineChooseText = new GLabel(this, x, y, 100, 20, "Knitting Machine");
  knittingMachineChooseText.setTextBold();

  knittingMachineDropListItems = new String[] {  
    "Singer", "Passap", "Frankenpassap"
  };

  knittingMachineChooseList = new GDropList(this, x, y + 20, 100, 60, knittingMachineDropListItems.length);
  //preselect KnittingMachine from setup
  knittingMachineChooseList.setItems(knittingMachineDropListItems, knittingMachine-1);
  knittingMachineChooseList.tag = "knittingMachineTag";

  // knittingTechnique
  x = 190; 
  y = 45;
  knittingTechniqueChooseText = new GLabel(this, x, y, 110, 20, "Knitting Technique");
  knittingTechniqueChooseText.setTextBold();

  knittingTechniqueDropListItems = new String[] { 
    "pattern every row", "2,3,4 colours (180-183,186-188)", "2,3,4 colours (184-185)", "lace (256)", "lace (256) double row", "Koerperbindung Frankenpassap", "Reiskorn-/Streifeneffekt Frankenpassap"
  };


  knittingTechniqueChooseList = new GDropList(this, x, y + 20, 200, 100, knittingTechniqueDropListItems.length);
  //preselect KnittingMachine from setup
  knittingTechniqueChooseList.setItems(knittingTechniqueDropListItems, knittingTechnique);
  knittingTechniqueChooseList.tag = "knittingTechniqueTag";


  // Row Counter
  x = 1000; 
  y = 55;
  btnRowCounterText = new GLabel(this, x, y, 100, 20, "Actual Row");
  btnRowCounterText.setTextBold();

  txtfieldRowCounter = new GTextField(this, x+90, y, 40, 20);
  txtfieldRowCounter.setText(str(rowCounter));

  btnSetRowCounter = new GButton(this, x+130, y, 40, 20, "Set");
  btnSetRowCounter.setLocalColorScheme(GP4colorScheme);

  // show Actual Colour

  // To do!!!


  // --------------------Buttons-------------------------

  // Connect Arduino
  btnConnectArduino = new GButton(this, 10, gridStartY+5, 100, 20, "Connect Arduino");
  btnConnectArduino.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnConnectArduino.setLocalColorScheme(GP4colorScheme);

  // Arduino SerialPort List
  x = 115; 
  y = gridStartY+5;
  // arduinoSerialportChooseText = new GLabel(this, x, y, 100, 20, "Serial Port");
  //arduinoSerialportChooseText.setTextBold();

  arduinoSerialportDropListItems =new String[Serial.list().length];

  for (int i = 0; i<Serial.list ().length; i++) {
    println(i);
    arduinoSerialportDropListItems[i] = Serial.list()[i];
  }

  arduinoSerialportChooseList = new GDropList(this, x, y, 70, 60, arduinoSerialportDropListItems.length);
  //preselect arduinoSerialport from setup
  arduinoSerialportChooseList.setItems(arduinoSerialportDropListItems, serialport);
  arduinoSerialportChooseList.tag = "arduinoSerialportTag";


  // Open File
  btnOpenPatterImageFile = new GButton(this, 10, gridStartY+30, 100, 20, "Open Image File");
  btnOpenPatterImageFile.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnOpenPatterImageFile.setLocalColorScheme(GP4colorScheme);

  // Load Settings
  btnLoadKnittySettings = new GButton(this, 10, gridStartY+55, 80, 20, "Load Settings");
  btnLoadKnittySettings.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnLoadKnittySettings.setLocalColorScheme(GP4colorScheme);

  // Save Settings
  btnSaveKnittySettings = new GButton(this, 100, gridStartY+55, 80, 20, "Save Settings");
  btnSaveKnittySettings.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnSaveKnittySettings.setLocalColorScheme(GP4colorScheme);




  // WorkingWidth

  int buttonsWorkingWidthGUIheightX = 10;
  int buttonsWorkingWidthGUIheightY = gridStartY+100;

  btnSetWorkingWidthText = new GLabel(this, buttonsWorkingWidthGUIheightX, buttonsWorkingWidthGUIheightY, 90, 20, "Working Width");
  btnSetWorkingWidthText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnSetWorkingWidthText.setTextBold();

  txtfieldWorkingWidth = new GTextField(this, buttonsWorkingWidthGUIheightX, buttonsWorkingWidthGUIheightY+20, 30, 20);
  txtfieldWorkingWidth.setText(str(workingWidth));

  btnSetWorkingWidth = new GButton(this, buttonsWorkingWidthGUIheightX+35, buttonsWorkingWidthGUIheightY+20, 40, 20, "Set");
  btnSetWorkingWidth.setLocalColorScheme(GP4colorScheme);

  // WorkingWidth offset
  btnSetWorkingWidthOffsetText = new GLabel(this, buttonsWorkingWidthGUIheightX+90, buttonsWorkingWidthGUIheightY, 100, 20, "/  Offset");
  btnSetWorkingWidthOffsetText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnSetWorkingWidthOffsetText.setTextBold();

  txtfieldWorkingWidthOffset = new GTextField(this, buttonsWorkingWidthGUIheightX+100, buttonsWorkingWidthGUIheightY+20, 30, 20);
  txtfieldWorkingWidthOffset.setText(str(workingWidthOffset));

  btnSetWorkingWidthOffset = new GButton(this, buttonsWorkingWidthGUIheightX+135, buttonsWorkingWidthGUIheightY+20, 40, 20, "Set");
  btnSetWorkingWidthOffset.setLocalColorScheme(GP4colorScheme);


  //Pattern

  // Scale Buttons

  int buttonsScaleGUIheightX = 10;
  int buttonsScaleGUIheightY = gridStartY+170;

  btnPatternText = new GLabel(this, buttonsScaleGUIheightX, buttonsScaleGUIheightY-20, 170, 20, "Pattern");
  btnPatternText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnPatternText.setTextBold();

  btnPatternScaleText = new GLabel(this, buttonsScaleGUIheightX, buttonsScaleGUIheightY, 45, 15, "Scale");
  btnPatternScaleText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);

  btnPatternScaleXplus = new GButton(this, buttonsScaleGUIheightX+30, buttonsScaleGUIheightY+30, 15, 15, "+");
  btnPatternScaleXplus.setLocalColorScheme(GP4colorScheme);

  btnPatternScaleXminus = new GButton(this, buttonsScaleGUIheightX, buttonsScaleGUIheightY+30, 15, 15, "-");
  btnPatternScaleXminus.setLocalColorScheme(GP4colorScheme);

  btnPatternScaleYplus = new GButton(this, buttonsScaleGUIheightX+15, buttonsScaleGUIheightY+15, 15, 15, "+");
  btnPatternScaleYplus.setLocalColorScheme(GP4colorScheme);

  btnPatternScaleYminus = new GButton(this, buttonsScaleGUIheightX+15, buttonsScaleGUIheightY+45, 15, 15, "-");
  btnPatternScaleYminus.setLocalColorScheme(GP4colorScheme);


  // Pattern Grid

  int buttonsPatternGridheightX = 70;
  int buttonsPatternGridGUIheightY = buttonsScaleGUIheightY;

  btnPatternGridText = new GLabel(this, buttonsPatternGridheightX, buttonsPatternGridGUIheightY, 45, 15, "Grid");
  btnPatternGridText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);

  btnPatternGridXplus = new GButton(this, buttonsPatternGridheightX+30, buttonsPatternGridGUIheightY+30, 15, 15, "+");
  btnPatternGridXplus.setLocalColorScheme(GP4colorScheme);

  btnPatternGridXminus = new GButton(this, buttonsPatternGridheightX, buttonsPatternGridGUIheightY+30, 15, 15, "-");
  btnPatternGridXminus.setLocalColorScheme(GP4colorScheme);

  btnPatternGridYplus = new GButton(this, buttonsPatternGridheightX+15, buttonsPatternGridGUIheightY+15, 15, 15, "+");
  btnPatternGridYplus.setLocalColorScheme(GP4colorScheme);

  btnPatternGridYminus = new GButton(this, buttonsPatternGridheightX+15, buttonsPatternGridGUIheightY+45, 15, 15, "-");
  btnPatternGridYminus.setLocalColorScheme(GP4colorScheme);


  // Pattern Grid Gap

  int buttonsPatternGridGapheightX = 130;
  int buttonsPatternGridGapGUIheightY = buttonsScaleGUIheightY;

  btnPatternGridGapText = new GLabel(this, buttonsPatternGridGapheightX, buttonsPatternGridGapGUIheightY, 45, 15, "Gap");
  btnPatternGridGapText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);

  btnPatternGridGapXplus = new GButton(this, buttonsPatternGridGapheightX+30, buttonsPatternGridGapGUIheightY+30, 15, 15, "+");
  btnPatternGridGapXplus.setLocalColorScheme(GP4colorScheme);

  btnPatternGridGapXminus = new GButton(this, buttonsPatternGridGapheightX, buttonsPatternGridGapGUIheightY+30, 15, 15, "-");
  btnPatternGridGapXminus.setLocalColorScheme(GP4colorScheme);

  btnPatternGridGapYplus = new GButton(this, buttonsPatternGridGapheightX+15, buttonsPatternGridGapGUIheightY+15, 15, 15, "+");
  btnPatternGridGapYplus.setLocalColorScheme(GP4colorScheme);

  btnPatternGridGapYminus = new GButton(this, buttonsPatternGridGapheightX+15, buttonsPatternGridGapGUIheightY+45, 15, 15, "-");
  btnPatternGridGapYminus.setLocalColorScheme(GP4colorScheme);



  int btnPatternButtonsHeightX = 10;
  int btnPatternButtonsHeightY = gridStartY+250;


  // Mirror Pattern
  btnPatternImageMirror = new GButton(this, btnPatternButtonsHeightX, btnPatternButtonsHeightY, 80, 20, "Mirror Pattern");
  btnPatternImageMirror.setLocalColorScheme(GP4colorScheme);

  // Mirror Pattern
  btnMirrorPatternArray1 = new GButton(this, btnPatternButtonsHeightX+90, btnPatternButtonsHeightY, 80, 20, "Mirror Array 1");
  btnMirrorPatternArray1.setLocalColorScheme(GP4colorScheme);

  // Mirror Pattern
  btnMirrorPatternArray2 = new GButton(this, btnPatternButtonsHeightX+90, btnPatternButtonsHeightY+25, 80, 20, "Mirror Array 2");
  btnMirrorPatternArray2.setLocalColorScheme(GP4colorScheme);

  // Invert Pattern
  btnInvertpattern = new GButton(this, btnPatternButtonsHeightX, btnPatternButtonsHeightY+25, 80, 20, "Invert Pattern");
  btnInvertpattern.setLocalColorScheme(GP4colorScheme);

  // Set Border
  btnSetBorder = new GButton(this, btnPatternButtonsHeightX, btnPatternButtonsHeightY+60, 80, 20, "Set Border");
  btnSetBorder.setLocalColorScheme(GP4colorScheme);

  // Set Border Toogle
  btnSetBorderToggle = new GButton(this, btnPatternButtonsHeightX+90, btnPatternButtonsHeightY+60, 80, 20, "BorderToogle");
  btnSetBorderToggle.setLocalColorScheme(GP4colorScheme);

  // Cursor

  int btnSetCursorTextHeightX = 10;
  int btnSetCursorTextHeightY = gridStartY+340;

  btnSetCursorText = new GLabel(this, btnSetCursorTextHeightX, btnSetCursorTextHeightY, 100, 20, "Set Cursor");
  btnSetCursorText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnSetCursorText.setTextBold();

  txtfieldSetCursor = new GTextField(this, btnSetCursorTextHeightX, btnSetCursorTextHeightY+20, 30, 20);
  txtfieldSetCursor.setText(str(0));

  btnSetCursor = new GButton(this, btnSetCursorTextHeightX+40, btnSetCursorTextHeightY+20, 40, 20, "Set");
  btnSetCursor.setLocalColorScheme(GP4colorScheme);


  //Knit Buttons

  int btnKnitButtonsHeightX = 10;
  int btnKnitButtonsHeightY = gridStartY+395;

  btnKnittingText = new GLabel(this, btnSetCursorTextHeightX, btnKnitButtonsHeightY, 100, 20, "Knitting");
  btnKnittingText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnKnittingText.setTextBold();

  // Start Knit
  btnKnitStart = new GButton(this, btnKnitButtonsHeightX, btnKnitButtonsHeightY+20, 100, 20, "Start Knit");
  btnKnitStart.setLocalColorScheme(GP4colorScheme);

  // Pause Knit
  btnKnitPause = new GButton(this, btnKnitButtonsHeightX, btnKnitButtonsHeightY+45, 100, 20, "Pause Knit");
  btnKnitPause.setLocalColorScheme(GP4colorSchemeActive);

  // one row back
  btnOneRowBack = new GButton(this, btnKnitButtonsHeightX, btnKnitButtonsHeightY+70, 100, 20, "One Row Back");
  btnOneRowBack.setLocalColorScheme(GP4colorScheme);


  //TestButton
  btnKnitOneRow = new GButton(this, btnKnitButtonsHeightX, 720, 100, 20, "Knit One Row");
  btnKnitOneRow.setLocalColorScheme(GP4colorScheme);


  // buttons for Frankenpassap

  btnFrankanpassapText = new GLabel(this, 10, gridStartY+495, 150, 20, "Frankenpassap");
  btnFrankanpassapText.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnFrankanpassapText.setTextBold();


  // Switch Beds
  btnFrankenpassapSwitchBeds = new GButton(this, 10, gridStartY+515, 80, 20, "Switch Bed");
  btnFrankenpassapSwitchBeds.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnFrankenpassapSwitchBeds.setLocalColorScheme(GP4colorScheme);

  // knit back invers
  btnFrankenpassapBackInvers = new GButton(this, 100, gridStartY+515, 80, 20, "Knit Invers");
  btnFrankenpassapBackInvers.setTextAlign(GAlign.MIDDLE, GAlign.MIDDLE);
  btnFrankenpassapBackInvers.setLocalColorScheme(GP4colorScheme);


  frankenpassapHideShowButtons();
}


// rectangles with pattern colours
void drawColourDefinition() {
  if (switchBedState == false) {
    if (patternImageColorList.length > 0 && knittingMachine >0) {
      for (int i = patternImageColorList.length; i >0; i--) {
        stroke(0);
        fill(patternImageColorList[i-1]);
        rect(colourRectanglesX + i*40, 55, 20, 20);

        // Buttons for colour change
        if (i >1 ) {
          fill(150);
          rect(colourRectanglesX + 25 + (i-1)*40, 60, 10, 10);
        }
      }
    }
  } else {
    if (patternImageColorListBack.length > 0 && knittingMachine > 1) {
      for (int i = patternImageColorListBack.length; i >0; i--) {
        stroke(0);
        fill(patternImageColorListBack[i-1]);
        rect(colourRectanglesX + i*40, 55, 20, 20);

        // Buttons for colour change
        if (i >1 ) {
          fill(150);
          rect(colourRectanglesX + 25 + (i-1)*40, 60, 10, 10);
        }
      }
    }
  }
}

