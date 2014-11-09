//GP4 Events

public void handleTextEvents(GEditableTextControl textcontrol, GEvent event) {
  if (event == GEvent.ENTERED) {
    if (GUIlocked == false) {  //don't change when knitting
      // change WorkingWidth after KeyPressReturn
      if (textcontrol == txtfieldWorkingWidth) {
        calculateWorkingWidth();
      }
      if (textcontrol == txtfieldWorkingWidthOffset) {
        calculateWorkingWidthOffset();
      }
      if (textcontrol == txtfieldRowCounter) {
        rowCounter = int(txtfieldRowCounter.getText());
      }
      saveBasicKnittySettings();
    }
  }
}

public void handleDropListEvents(GDropList list, GEvent event) {
  println(list.getSelectedText());
  println(list.getSelectedIndex ());
  // choose knitting machine
  if (list == knittingMachineChooseList) {
    knittingMachine = list.getSelectedIndex ()+1;
    frankenpassapHideShowButtons();
    //to do: write in config!!
  }
  if (list == knittingTechniqueChooseList) {
    knittingTechnique = list.getSelectedIndex ();
    //to do: write in config!!
  }
  if (list == arduinoSerialportChooseList) {
    serialport = list.getSelectedIndex ();
    //to do: write in config!!
  }
  saveBasicKnittySettings();
}


void handleButtonEvents(GButton button, GEvent event) {
  if (event == GEvent.CLICKED) {

    if (GUIlocked == false) {  //Lock Gui when knitting

      if (button == btnSetRowCounter) {
        rowCounter = int(txtfieldRowCounter.getText());
      }

      if (button == btnConnectArduino) {
        initSerialCommunication();
      }

      if (button == btnOpenPatterImageFile) {
        loadPatternImageFile();
      }

      if (button == btnLoadKnittySettings) {
        loadKnittySettings();
      }

      if (button == btnSaveKnittySettings) {
        saveKnittySettings();
      }



      if (button == btnSetWorkingWidth) {
        calculateWorkingWidth();
      }

      if (button == btnSetWorkingWidthOffset) {
        calculateWorkingWidthOffset();
      }


      // operate Button on front or back bed 
      if (switchBedState == false) {
        //scale
        if (button == btnPatternScaleYplus) {
          patternScaleY++;
        }

        if (button == btnPatternScaleYminus) {
          patternScaleY--;
          if (patternScaleY==0) {
            patternScaleY=1;
          }
        }

        if (button == btnPatternScaleXplus) {
          patternScaleX++;
        }

        if (button == btnPatternScaleXminus) {
          patternScaleX--;
          if (patternScaleX==0) {
            patternScaleX=1;
          }
        }

        // Pattern Grid
        if (button == btnPatternGridXplus) {
          patternGridX++;
        }

        if (button == btnPatternGridXminus) {
          patternGridX--;
          if (patternGridX==0) {
            patternGridX=1;
          }
        }
        if (button == btnPatternGridYplus) {
          patternGridY++;
        }

        if (button == btnPatternGridYminus) {
          patternGridY--;
          if (patternGridY==0) {
            patternGridY=1;
          }
        }

        // Pattern Grid Gap
        if (button == btnPatternGridGapXplus) {
          patternGridXgap++;
        }

        if (button == btnPatternGridGapXminus) {
          patternGridXgap--;
          if (patternGridXgap==-1) {
            patternGridXgap=0;
          }
        }

        if (button == btnPatternGridGapYplus) {
          patternGridYgap++;
        }

        if (button == btnPatternGridGapYminus) {
          patternGridYgap--;
          if (patternGridYgap==-1) {
            patternGridYgap=0;
          }
        }


        // Mirror Pattern
        if (button == btnPatternImageMirror) {
          mirrorPatternImageX();
        }


        // Mirror Array
        if (button == btnMirrorPatternArray1) {
          if (mirrorPatternArray2 == false) {
            mirrorPatternArray1 = !mirrorPatternArray1;
          }

          mirrorPatternArray2 = false;
        }

        if (button == btnMirrorPatternArray2) {
          mirrorPatternArray2 = !mirrorPatternArray2;
          mirrorPatternArray1 = mirrorPatternArray2;
        }


        if (button == btnInvertpattern) {
          inversePatternImage();
        }
      }


      //change back bed
      else {
        //scale
        if (button == btnPatternScaleYplus) {
          patternScaleBackY++;
        }

        if (button == btnPatternScaleYminus) {
          patternScaleBackY--;
          if (patternScaleBackY==0) {
            patternScaleBackY=1;
          }
        }

        if (button == btnPatternScaleXplus) {
          patternScaleBackX++;
        }

        if (button == btnPatternScaleXminus) {
          patternScaleBackX--;
          if (patternScaleBackX==0) {
            patternScaleBackX=1;
          }
        }

        // Pattern Grid
        if (button == btnPatternGridXplus) {
          patternGridBackX++;
        }

        if (button == btnPatternGridXminus) {
          patternGridBackX--;
          if (patternGridBackX==0) {
            patternGridBackX=1;
          }
        }
        if (button == btnPatternGridYplus) {
          patternGridBackY++;
        }

        if (button == btnPatternGridYminus) {
          patternGridBackY--;
          if (patternGridBackY==0) {
            patternGridBackY=1;
          }
        }

        // Pattern Grid Gap
        if (button == btnPatternGridGapXplus) {
          patternGridBackXgap++;
        }

        if (button == btnPatternGridGapXminus) {
          patternGridBackXgap--;
          if (patternGridBackXgap==-1) {
            patternGridBackXgap=0;
          }
        }

        if (button == btnPatternGridGapYplus) {
          patternGridBackYgap++;
        }

        if (button == btnPatternGridGapYminus) {
          patternGridBackYgap--;
          if (patternGridBackYgap==-1) {
            patternGridBackYgap=0;
          }
        }


        // Mirror Pattern
        if (button == btnPatternImageMirror) {
          mirrorPatternImageBackX();
        }


        // Mirror Array
        if (button == btnMirrorPatternArray1) {
          if (mirrorPatternArrayBack2 == false) {
            mirrorPatternArrayBack1 = !mirrorPatternArrayBack1;
          }

          mirrorPatternArrayBack2 = false;
        }

        if (button == btnMirrorPatternArray2) {
          mirrorPatternArrayBack2 = !mirrorPatternArrayBack2;
          mirrorPatternArrayBack1 = mirrorPatternArrayBack2;
        }

        if (button == btnInvertpattern) {
          inversePatternImageBack();
        }
      }


      // Set Border
      if (button == btnSetBorder) {
        SetBorderToggle = !SetBorderToggle;
      }

      // Set Border Toogle color
      if (button == btnSetBorderToggle) {
        if (SetBorderToggleColor == 1) {
          SetBorderToggleColor= 0;
        } else {
          SetBorderToggleColor=1;
        }
      }


      // Set Cursor
      if (button == btnSetCursor) {
        //println(int(txtfieldSetCursor.getText()));
        sendCommand(COM_CMD_CURSOR, txtfieldSetCursor.getText());
        InfoText = ("set Cursor");
      }





      if (button == btnKnitOneRow) {
        knittigInProgress = true;
        buttonKnitRow(0);
      }

      //Frankenpassap
      if (button == btnFrankenpassapSwitchBeds) {
        switchBedState = !switchBedState;
        if (btnFrankenpassapSwitchBeds.getLocalColorScheme()==GP4colorScheme) {
          btnFrankenpassapSwitchBeds.setLocalColorScheme(GP4colorSchemeActive);
        } else {
          btnFrankenpassapSwitchBeds.setLocalColorScheme(GP4colorScheme);
        }
      }

      if (button == btnFrankenpassapBackInvers) {

        if (btnFrankenpassapBackInvers.getLocalColorScheme()==GP4colorScheme) {
          btnFrankenpassapBackInvers.setLocalColorScheme(GP4colorSchemeActive);
        } else {
          btnFrankenpassapBackInvers.setLocalColorScheme(GP4colorScheme);
        }
        FrankenpassapBackInvers = !FrankenpassapBackInvers;
      }
    } // GUI locked End

    if (button == btnOneRowBack) {
      oneRowBackKinittingButtonKeyboard();
    }


    if (button == btnKnitStart) {
      startKinittingButtonKeyboard();
    }

    if (button == btnKnitPause) {
      pauseKinittingButtonKeyboard();
    }
    //end Buttons
    saveBasicKnittySettings();
  }
}


void oneRowBackKinittingButtonKeyboard() {
  movePatternY--;
  buttonKnitRow(1);  // offset to load correct pattern
  InfoText = ("One Row Back");
}



void startKinittingButtonKeyboard() {
  GUIlocked = true;
  knittigInProgress = true;

  switch(knittingMachine) {
  case 1: //superba
    buttonKnitRow(0);
    break;

  case 2: 
  case 3://Passap, Frankenpassap

    // Set cursorposition of first needle of right
    passapFirstNeedle = (totalWidth/2-workingWidth/2)-workingWidthOffset+1;
    println(passapFirstNeedle);
    sendCommand(COM_CMD_FIRST_NEEDLE, str(passapFirstNeedle));


    //reset ColourCounter and row counter
    colourCounter = 0;
    //rowCounter = 0;
    passapSecondRowToggle = false;
    //beginn with empty row
    passapKnitEmptyRow();
    break;
  }

  btnKnitStart.setLocalColorScheme(GP4colorSchemeActive);
  btnKnitPause.setLocalColorScheme(GP4colorScheme);
  InfoText = ("Start Knitting");
}

void pauseKinittingButtonKeyboard() {
  GUIlocked = false;
  knittigInProgress = false;
  btnKnitStart.setLocalColorScheme(GP4colorScheme);
  btnKnitPause.setLocalColorScheme(GP4colorSchemeActive);
  //erase last row
  sendCommand(COM_CMD_PATTERN, "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");
  InfoText = ("Pause Knitting");

  disableServos();
}

void buttonKnitRow(int offset) {

  if (knittigInProgress == true) {
    switch(knittingMachine) {
    case 1:
      superbaReadPatternFromScreen(offset);
      break;

    case 2: 
    case 3:
      passapReadColourPatternFromScreen(offset);
      break;
    }
  }
}

void moveRowInGUI() {
  if (knittigInProgress == true) {
    movePatternY++;
    if (knittingMachine == 3) {
      movePatternBackY++;
    }
  }
}


void calculateWorkingWidth() {
  if (int(txtfieldWorkingWidth.getText()) > 0 &&  int(txtfieldWorkingWidth.getText()) <= ((totalWidth/2)-workingWidthOffset)*2) {
    workingWidth = int(txtfieldWorkingWidth.getText());
    // Set cursorposition of first needle of right
    passapFirstNeedle = (totalWidth/2-workingWidth/2)-workingWidthOffset+1;
    println(passapFirstNeedle);
    sendCommand(COM_CMD_FIRST_NEEDLE, str(passapFirstNeedle));
  }
}


void calculateWorkingWidthOffset() {
  if (int(txtfieldWorkingWidthOffset.getText()) >= 0 &&  int(txtfieldWorkingWidthOffset.getText()) < (totalWidth-workingWidth)/2) {
    workingWidthOffset = int(txtfieldWorkingWidthOffset.getText());
    // Set cursorposition of first needle of right
    passapFirstNeedle = (totalWidth/2-workingWidth/2)-workingWidthOffset+1;
    println(passapFirstNeedle);
    sendCommand(COM_CMD_FIRST_NEEDLE, str(passapFirstNeedle));
  }
}


void frankenpassapHideShowButtons() {
  //show/hide if Frankenpassap
  if (knittingMachine == 3) {
    btnFrankanpassapText.setVisible(true);
    btnFrankenpassapSwitchBeds.setVisible(true);
    btnFrankenpassapBackInvers.setVisible(true);
  } else {
    btnFrankanpassapText.setVisible(false);
    btnFrankenpassapSwitchBeds.setVisible(false);
    btnFrankenpassapBackInvers.setVisible(false);
  }
  //show/hide if Singer
  if (knittingMachine == 1) {
    btnSetWorkingWidthOffsetText.setVisible(false);
    txtfieldWorkingWidthOffset.setVisible(false);
    btnSetWorkingWidthOffset.setVisible(false);
    workingWidthOffset = 0;
    knittingTechniqueChooseText.setVisible(false);
    knittingTechniqueChooseList.setVisible(false);
  } else {
    btnSetWorkingWidthOffsetText.setVisible(true);
    txtfieldWorkingWidthOffset.setVisible(true);
    btnSetWorkingWidthOffset.setVisible(true);
    knittingTechniqueChooseText.setVisible(true);
    knittingTechniqueChooseList.setVisible(true);
  }
}

