//GP4 Events


public void handleTextEvents(GEditableTextControl textcontrol, GEvent event) {
    if (event == GEvent.ENTERED) {
        if (GUIlocked == false) {  //Lock Gui when knitting
            // change WorkingWidth after KeyPressReturn
            if (textcontrol == txtfieldWorkingWidth) {
                if (int(txtfieldWorkingWidth.getText()) > 0 &&  int(txtfieldWorkingWidth.getText()) < totalWidth+1) {
                    workingWidth = int(txtfieldWorkingWidth.getText());
                }
            }
        }
    }

}


void handleButtonEvents(GButton button, GEvent event) {
    if (event == GEvent.CLICKED) {

        if (GUIlocked == false) {  //Lock Gui when knitting


            if (button == btnConnectArduino) {
                initSerialCommunication();
            }

            if (button == btnOpenPatterImageFile) {
                loadPatternImageFile();
            }


            if (button == btnSetWorkingWidth) {

                if (int(txtfieldWorkingWidth.getText()) > 0 &&  int(txtfieldWorkingWidth.getText()) < totalWidth+1) {
                    workingWidth = int(txtfieldWorkingWidth.getText());
                }
            }


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



            // Set Border
            if (button == btnSetBorder) {
                SetBorderToggle = !SetBorderToggle;
            }



            // Set Cursor
            if (button == btnSetCursor) {
                //println(int(txtfieldSetCursor.getText()));
                sendCommand(COM_CMD_CURSOR, txtfieldSetCursor.getText());
                txaInformationBox.appendText("Cursor Set");
            }



            if (button == btnKnitInvers) {
                inversePatternImage();
            }

            if (button == btnKnitOneRow) {
                buttonKnitRow(0);
            }

        }

        // GUI locked End

        if (button == btnOneRowBack) {
            movePatternY--;
            buttonKnitRow(1);  // offset to load correct pattern
        }


        if (button == btnKnitStart) {
            GUIlocked = true;
            knittigInProgress = true;
            buttonKnitRow(0);
            btnKnitStart.setLocalColorScheme(GP4colorSchemeActive);
            btnKnitPause.setLocalColorScheme(GP4colorScheme);

        }

        if (button == btnKnitPause) {
            GUIlocked = false;
            knittigInProgress = false;
            btnKnitStart.setLocalColorScheme(GP4colorScheme);
            btnKnitPause.setLocalColorScheme(GP4colorSchemeActive);
            //erase last row
            sendCommand(COM_CMD_PATTERN, "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000");

        }





        //end Buttons
    }
}


void buttonKnitRow(int offset) {

    if (knittigInProgress == true) {


        loadPixels();

        myPattern = "";

        // println(hex(pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2)*width) + ((gridStartX+(totalWidth/2-workingWidth/2)*scalingfactor)+scalingfactor/2)]) );
        for (int i = 0; i < workingWidth; i++) {
            if (((pixels[(((gridStartY+displayWorkingRow*scalingfactor)+scalingfactor/2+offset*scalingfactor)*width) + ((gridStartX+(totalWidth/2-workingWidth/2)*scalingfactor)+scalingfactor/2) + i*scalingfactor] ) & 0x00FFFFFF) == 0x000000) {
                myPattern += "1";
            } else {
                myPattern += "0";
            }
        }

        sendCommand(COM_CMD_PATTERN, myPattern);
        //movePatternY++;
        println(myPattern);
    }
}

void moveRowInGUI() {
    if (knittigInProgress == true) {
        movePatternY++;
    }

}



