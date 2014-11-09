//Drop pattern

Boolean isValidImageFile(String filename) {
  return (match(filename.toLowerCase(), ".(jpg|jpeg|png|gif)$") != null);
}

void dropEvent(DropEvent theDropEvent) {
  fileOperationInProgress = true;
  if ( theDropEvent.isImage() && theDropEvent.isFile() ) {
    try {
      String dropName = theDropEvent.filePath();
      if (dropName == null) {
        return;
      }

      if (isValidImageFile(dropName)) {

        if (switchBedState==false) {
          loadPatternImage(dropName);
          movePatternX = 0 + workingWidthOffset;
          movePatternY = 0;
        } else {
          loadPatternImageBack(dropName);
          movePatternBackX = 0 + workingWidthOffset;
          movePatternBackY = 0;
        }

        InfoText = (patternImageName + "\nPattern loaded");
      } else {
        InfoText = ("NOTHING loaded: no image file selected");
      }
    } 
    catch(Exception e) {
    }
  } else {
    InfoText = ("NOTHING loaded: no image file selected");
  }
  fileOperationInProgress = false;
}


void loadPatternImageFile () {
  selectInput("Select a file to process:", "fileSelected");
}

void fileSelected(File selection) {

  if (selection == null) {
    return;
  } 

  fileOperationInProgress = true;

  String loadFileName = selection.getAbsolutePath();
  if (isValidImageFile(loadFileName)) {
    loadPatternImage(loadFileName);
    movePatternX = 0 + workingWidthOffset;
    movePatternY = 0;
    InfoText = (patternImageName + "\nPattern loaded");
  }
  fileOperationInProgress = false;
}

void loadKnittySettings () {
  selectInput("Choose 'json' setting file:", "loadKnittySettingsFileSelection");
}



void loadKnittySettingsFileSelection(File selection) {

  if (selection == null) {
    return;
  }
  knittySettingsName = selection.getAbsolutePath(); 
  loadKnittySettingsFile();
}



void loadKnittySettingsFile() {

  fileOperationInProgress = true;
  println("2:"+knittySettingsName);
  if (knittySettingsName.substring(knittySettingsName.length()-5).equals(".json")) {
    knittySettings = loadJSONObject(knittySettingsName); 
    try {
      mirrorPatternArray1 = knittySettings.getBoolean("mirrorPatternArray1");
      mirrorPatternArray2 = knittySettings.getBoolean("mirrorPatternArray2");
      patternFilename = knittySettings.getString("patternImageName");  
      mirrorPatternArrayBack1 = knittySettings.getBoolean("mirrorPatternArrayBack1");
      mirrorPatternArrayBack2 = knittySettings.getBoolean("mirrorPatternArrayBack2");
      patternFilenameBack = knittySettings.getString("patternImageNameBack");  
      workingWidth = knittySettings.getInt("workingWidth");    
      workingWidthOffset = knittySettings.getInt("workingWidthOffset"); 
      patternGridX = knittySettings.getInt("patternGridX");    
      patternGridY = knittySettings.getInt("patternGridY");  
      patternGridXgap = knittySettings.getInt("patternGridXgap");    
      patternGridYgap = knittySettings.getInt("patternGridYgap"); 
      patternScaleX = knittySettings.getInt("patternScaleX");    
      patternScaleY = knittySettings.getInt("patternScaleY");  
      movePatternX = knittySettings.getInt("movePatternX");    
      movePatternY = knittySettings.getInt("movePatternY");  
      patternGridBackX = knittySettings.getInt("patternGridBackX");    
      patternGridBackY = knittySettings.getInt("patternGridBackY");  
      patternGridBackXgap = knittySettings.getInt("patternGridBackXgap");    
      patternGridBackYgap = knittySettings.getInt("patternGridBackYgap"); 
      patternScaleBackX = knittySettings.getInt("patternScaleBackX");    
      patternScaleBackY = knittySettings.getInt("patternScaleBackY");  
      movePatternBackX = knittySettings.getInt("movePatternBackX");    
      movePatternBackY = knittySettings.getInt("movePatternBackY"); 
      SetBorderToggle = knittySettings.getBoolean("SetBorderToggle");
      knittingTechnique = knittySettings.getInt("knittingTechnique");
      knittingMachine = knittySettings.getInt("knittingMachine");
      rowCounter = knittySettings.getInt("rowCounter");
      serialport = knittySettings.getInt("serialport");
      FrankenpassapBackInvers = knittySettings.getBoolean("FrankenpassapBackInvers");
    }
    catch(Exception e) {
      e.getCause();
      println("Some variables are missing!!");
      InfoText = ("Some variables are missing!!");
    }
    //set GUI
    txtfieldWorkingWidth.setText(str(workingWidth));
    txtfieldWorkingWidthOffset.setText(str(workingWidthOffset));
    knittingMachineChooseList.setItems(knittingMachineDropListItems, knittingMachine-1);
    knittingTechniqueChooseList.setItems(knittingTechniqueDropListItems, knittingTechnique);
    arduinoSerialportChooseList.setItems(arduinoSerialportDropListItems, serialport);
    frankenpassapHideShowButtons();
    txtfieldRowCounter.setText(str(rowCounter));

    loadPatternImage(patternFilename);
    loadPatternImageBack(patternFilenameBack);

    InfoText = (knittySettingsName + "\nSettings loaded");

    if (FrankenpassapBackInvers==true) {
      btnFrankenpassapBackInvers.setLocalColorScheme(GP4colorSchemeActive);
    } else {
      btnFrankenpassapBackInvers.setLocalColorScheme(GP4colorScheme);
    }
  } else {
    InfoText = ("NOTHING loaded: no 'json' file selected");
  }

  fileOperationInProgress = false;
}

void saveKnittySettings() {
  selectOutput("Select storage location for your json file", "saveKnittySettingsFileSelection");
}




void saveKnittySettingsFileSelection(File selection) {

  if (selection == null) {
    return;
  }
  knittySettingsName = selection.getAbsolutePath();
  saveKnittySettingsFile();
}



void saveKnittySettingsFile() {

  fileOperationInProgress = true;

  if (!knittySettingsName.substring(knittySettingsName.length()-5).equals(".json")) {
    knittySettingsName = knittySettingsName + ".json";
  }


  knittySettings.setString("patternImageName", patternImageName);
  knittySettings.setString("patternImageNameBack", patternImageNameBack);
  knittySettings.setInt("workingWidth", workingWidth);
  knittySettings.setInt("workingWidthOffset", workingWidthOffset);
  knittySettings.setInt("patternGridX", patternGridX);
  knittySettings.setInt("patternGridY", patternGridY);
  knittySettings.setInt("patternGridXgap", patternGridXgap);
  knittySettings.setInt("patternGridYgap", patternGridYgap);
  knittySettings.setInt("patternScaleX", patternScaleX);
  knittySettings.setInt("patternScaleY", patternScaleY);
  knittySettings.setInt("movePatternX", movePatternX);
  knittySettings.setInt("movePatternY", movePatternY); 
  knittySettings.setInt("patternGridBackX", patternGridBackX);
  knittySettings.setInt("patternGridBackY", patternGridBackY);
  knittySettings.setInt("patternGridBackXgap", patternGridBackXgap);
  knittySettings.setInt("patternGridBackYgap", patternGridBackYgap);
  knittySettings.setInt("patternScaleBackX", patternScaleBackX);
  knittySettings.setInt("patternScaleBackY", patternScaleBackY);
  knittySettings.setInt("movePatternBackX", movePatternBackX);
  knittySettings.setInt("movePatternBackY", movePatternBackY); 
  knittySettings.setBoolean("SetBorderToggle", SetBorderToggle); 
  knittySettings.setBoolean("mirrorPatternArray1", mirrorPatternArray1); 
  knittySettings.setBoolean("mirrorPatternArray2", mirrorPatternArray2);
  knittySettings.setBoolean("mirrorPatternArrayBack1", mirrorPatternArrayBack1); 
  knittySettings.setBoolean("mirrorPatternArrayBack2", mirrorPatternArrayBack2);  
  knittySettings.setInt("knittingTechnique", knittingTechnique);  
  knittySettings.setInt("knittingMachine", knittingMachine);
  knittySettings.setInt("rowCounter", rowCounter);  
  knittySettings.setInt("serialport", serialport);  
  knittySettings.setBoolean("FrankenpassapBackInvers", FrankenpassapBackInvers);  
  saveJSONObject(knittySettings, knittySettingsName);
  InfoText = (knittySettingsName + "\nSettings saved");

  fileOperationInProgress = false;
}

void  saveBasicKnittySettings() {
  knittySettingsName = "data/BasicKnittySettings.json";
  saveKnittySettingsFile();
  //println("Save Settings");
}



