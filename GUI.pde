void displayButtonsGUI() {

    // --------------------Buttons-------------------------


    // Connect Arduino

    btnConnectArduino = new GButton(this, 10, gridStartY+5, 100, 20, "Connect Arduino");
    btnConnectArduino.setLocalColorScheme(GP4colorScheme);

    // Open File

    btnOpenPatterImageFile = new GButton(this, 10, gridStartY+30, 100, 20, "Open Image File");
    btnOpenPatterImageFile.setLocalColorScheme(GP4colorScheme);

    // WorkingWidth

    btnSetWorkingWidthText = new GLabel(this, 10,gridStartY+60 , 100, 20, "Working Width");
    btnSetWorkingWidthText.setTextAlign(GAlign.MIDDLE,GAlign.MIDDLE);
    btnSetWorkingWidthText.setTextBold();

    txtfieldWorkingWidth = new GTextField(this, 10, gridStartY+85, 30, 20);
    txtfieldWorkingWidth.setText(str(workingWidth));

    btnSetWorkingWidth = new GButton(this, 50, gridStartY+85, 40, 20, "Set");
    btnSetWorkingWidth.setLocalColorScheme(GP4colorScheme);


    // Scale Buttons

    int buttonsScaleGUIheightX = 10;
    int buttonsScaleGUIheightY = gridStartY+130;

    btnPatternText = new GLabel(this, buttonsScaleGUIheightX, buttonsScaleGUIheightY-20, 100, 20, "Pattern");
    btnPatternText.setTextAlign(GAlign.MIDDLE,GAlign.MIDDLE);
    btnPatternText.setTextBold();

    btnPatternScaleText = new GLabel(this, buttonsScaleGUIheightX, buttonsScaleGUIheightY, 45, 15, "Scale");
    btnPatternScaleText.setTextAlign(GAlign.MIDDLE,GAlign.MIDDLE);

    btnPatternScaleXplus = new GButton(this, buttonsScaleGUIheightX+30,buttonsScaleGUIheightY+30, 15, 15, "+");
    btnPatternScaleXplus.setLocalColorScheme(GP4colorScheme);

    btnPatternScaleXminus = new GButton(this, buttonsScaleGUIheightX, buttonsScaleGUIheightY+30, 15, 15, "-");
    btnPatternScaleXminus.setLocalColorScheme(GP4colorScheme);

    btnPatternScaleYplus = new GButton(this, buttonsScaleGUIheightX+15, buttonsScaleGUIheightY+15, 15, 15, "+");
    btnPatternScaleYplus.setLocalColorScheme(GP4colorScheme);

    btnPatternScaleYminus = new GButton(this, buttonsScaleGUIheightX+15, buttonsScaleGUIheightY+45, 15, 15, "-");
    btnPatternScaleYminus.setLocalColorScheme(GP4colorScheme);


    // Pattern Grid

    int buttonsPatternGridheightX = 10;
    int buttonsPatternGridGUIheightY = gridStartY+200;

    btnPatternGridText = new GLabel(this, buttonsPatternGridheightX, buttonsPatternGridGUIheightY, 45, 15, "Grid");
    btnPatternGridText.setTextAlign(GAlign.MIDDLE,GAlign.MIDDLE);

    btnPatternGridXplus = new GButton(this, buttonsPatternGridheightX+30,buttonsPatternGridGUIheightY+30, 15, 15, "+");
    btnPatternGridXplus.setLocalColorScheme(GP4colorScheme);

    btnPatternGridXminus = new GButton(this, buttonsPatternGridheightX, buttonsPatternGridGUIheightY+30, 15, 15, "-");
    btnPatternGridXminus.setLocalColorScheme(GP4colorScheme);

    btnPatternGridYplus = new GButton(this, buttonsPatternGridheightX+15, buttonsPatternGridGUIheightY+15, 15, 15, "+");
    btnPatternGridYplus.setLocalColorScheme(GP4colorScheme);

    btnPatternGridYminus = new GButton(this, buttonsPatternGridheightX+15, buttonsPatternGridGUIheightY+45, 15, 15, "-");
    btnPatternGridYminus.setLocalColorScheme(GP4colorScheme);


    // Pattern Grid Gap

    int buttonsPatternGridGapheightX = 65;
    int buttonsPatternGridGapGUIheightY = gridStartY+200;

    btnPatternGridGapText = new GLabel(this, buttonsPatternGridGapheightX, buttonsPatternGridGapGUIheightY, 45, 15, "Gap");
    btnPatternGridGapText.setTextAlign(GAlign.MIDDLE,GAlign.MIDDLE);

    btnPatternGridGapXplus = new GButton(this, buttonsPatternGridGapheightX+30,buttonsPatternGridGapGUIheightY+30, 15, 15, "+");
    btnPatternGridGapXplus.setLocalColorScheme(GP4colorScheme);

    btnPatternGridGapXminus = new GButton(this, buttonsPatternGridGapheightX, buttonsPatternGridGapGUIheightY+30, 15, 15, "-");
    btnPatternGridGapXminus.setLocalColorScheme(GP4colorScheme);

    btnPatternGridGapYplus = new GButton(this, buttonsPatternGridGapheightX+15, buttonsPatternGridGapGUIheightY+15, 15, 15, "+");
    btnPatternGridGapYplus.setLocalColorScheme(GP4colorScheme);

    btnPatternGridGapYminus = new GButton(this, buttonsPatternGridGapheightX+15, buttonsPatternGridGapGUIheightY+45, 15, 15, "-");
    btnPatternGridGapYminus.setLocalColorScheme(GP4colorScheme);



    int btnPatternButtonsHeightX = 10;
    int btnPatternButtonsHeightY = gridStartY+280;


    // Mirror Pattern
    btnPatternImageMirror = new GButton(this, btnPatternButtonsHeightX, btnPatternButtonsHeightY, 90, 20, "Mirror Pattern");
    btnPatternImageMirror.setLocalColorScheme(GP4colorScheme);

    // Mirror Pattern
    btnMirrorPatternArray1 = new GButton(this, btnPatternButtonsHeightX, btnPatternButtonsHeightY+25, 90, 20, "Mirror Array 1");
    btnMirrorPatternArray1.setLocalColorScheme(GP4colorScheme);

    // Mirror Pattern
    btnMirrorPatternArray2 = new GButton(this, btnPatternButtonsHeightX, btnPatternButtonsHeightY+50, 90, 20, "Mirror Array 2");
    btnMirrorPatternArray2.setLocalColorScheme(GP4colorScheme);

    // Set Border
    btnSetBorder = new GButton(this, btnPatternButtonsHeightX, btnPatternButtonsHeightY+75, 90, 20, "Set Border");
    btnSetBorder.setLocalColorScheme(GP4colorScheme);




    // Cursor

    int btnSetCursorTextHeightX = 10;
    int btnSetCursorTextHeightY = gridStartY+400;

    btnSetCursorText = new GLabel(this, btnSetCursorTextHeightX, btnSetCursorTextHeightY, 100, 20, "Set Cursor");
    btnSetCursorText.setTextAlign(GAlign.MIDDLE,GAlign.MIDDLE);
    btnSetCursorText.setTextBold();

    txtfieldSetCursor = new GTextField(this, btnSetCursorTextHeightX, btnSetCursorTextHeightY+20, 30, 20);
    txtfieldSetCursor.setText(str(0));

    btnSetCursor = new GButton(this, btnSetCursorTextHeightX+40, btnSetCursorTextHeightY+20, 40, 20, "Set");
    btnSetCursor.setLocalColorScheme(GP4colorScheme);


    //Knit Buttons

    btnOneRowBack = new GButton(this, 10, 550, 100, 20, "One Row Back");
    btnOneRowBack.setLocalColorScheme(GP4colorScheme);

    //  btnKnitOneRow = new GButton(this, 10, 580, 100, 20, "Knit One Row");
    // btnKnitOneRow.setLocalColorScheme(GP4colorScheme);

    // knit Invers

    //btnKnitInvers = new GButton(this, 10, 610, 100, 20, "Knit Invers");
    //btnKnitInvers.setLocalColorScheme(GP4colorScheme);


    // Start Knit

    btnKnitStart = new GButton(this, 10, 640, 100, 20, "Start Knit");
    btnKnitStart.setLocalColorScheme(GP4colorScheme);

    // Pause Knit

    btnKnitPause = new GButton(this, 10, 670, 100, 20, "Pause Knit");
    btnKnitPause.setLocalColorScheme(GP4colorSchemeActive);


    // Infobox

    txaInformationBox = new GTextArea(this, 900, 0, 300, gridStartY, G4P.SCROLLBARS_VERTICAL_ONLY  | G4P.SCROLLBARS_AUTOHIDE);
    txaInformationBox.setLocalColorScheme(GP4colorScheme);




}
