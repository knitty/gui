// Don't forget to place the libraries under sketchbook/libraries/G4P and sketchbook/libraries/sDrop
import g4p_controls.*;    // http://sourceforge.net/projects/g4p/
import sojamo.drop.*;    //  http://www.sojamo.de/libraries/drop/

PFont UsedFont;

JSONObject knittySettings;
String knittySettingsName = "";

PImage knittyLogoImage;
PImage patternImage;  // Declare PImage
PImage patternImageBack;  // Declare PImage
PImage patternImageWorkingSet;
PImage patternImageWorkingSetBack;
String myPattern = "";
String myPatternBack = "";
boolean switchBedState = false;


int[] patternImageColorList = new int[0]; //array that will contain all the colors in the image
int[] patternImageColorListBack = new int[0]; //array that will contain all the colors in the image

int colourActual = 0;  // actual colour
int coloursInUse = 4;    //number of used colours
int coloursInUseBack = 4;    //number of used colours
int colourCounter = 0;
int colourRectanglesX = 800;
boolean  passapSecondRowToggle = false;

int rowCounter = 1;

int GUIwidth = 1270;  //size of the GUI
int GUIheigth = 750;
int totalWidth = 180; //all needles
int workingWidth = 100; // number of working needles
int workingWidthOffset = 0;
int passapFirstNeedle = 0;
int scalingfactor = 6; //display one pixel x scalingfactor
int rows = 200;  //rows to display
int columns = totalWidth;
int displayWorkingRow = 90;
int gridStartX = 189;
int gridStartY = 90;

int knittingMachine = 1;  //1=Singer 624,  2=Passap E6000, 3=Frankenpassap
int knittingTechnique = 0;
// 0:   pattern every row
// 1: 180: 2, 3 and 4 colours (one pixel two knits)
// 2: 184: 2, 3 and 4 colours (one pixel one knit)
// 3: 256: lace      BX <- / LX      back pusher  '''''''''''''' (all down)
// 4: 256-1: lace 2   BX <- / LX      back pusher  '''''''''''''' (all down)  -> way back with row
int serialport = 1;

GLabel knittingMachineChooseText, 
knittingTechniqueChooseText, 
arduinoSerialportChooseText;
GDropList knittingMachineChooseList, 
knittingTechniqueChooseList, 
arduinoSerialportChooseList;
String[] knittingMachineDropListItems, 
knittingTechniqueDropListItems, 
arduinoSerialportDropListItems; 


String InfoText = "";

boolean  knittigInProgress = false;
boolean  fileOperationInProgress = false;
boolean  SetBorderToggle = false;
int SetBorderToggleColor = 1;

String patternImageName = "backspace_text.gif";
String patternImageNameBack = "backspace_text.gif";

<<<<<<< HEAD
=======
String patternImageName = "backspace_text.gif";
//backspace_text
>>>>>>> 5b7755fc03fcae087406194e78801df09c6f081e

//for fileoperation (json)
String patternFilename;
String patternFilenameBack;

int movePatternX = 0;
int movePatternY = 0;
int movePatternBackX = 0;
int movePatternBackY = 0;


int patternScaleX = 1;
int patternScaleY = 1;
int patternScaleBackX = 1;
int patternScaleBackY = 1;

int patternGridX = 1;
int patternGridY = 1;
int patternGridXgap = 0;
int patternGridYgap = 0;
int patternGridBackX = 1;
int patternGridBackY = 1;
int patternGridBackXgap = 0;
int patternGridBackYgap = 0;

boolean mirrorPatternArray1 = false;
boolean mirrorPatternArray2 = false;
boolean mirrorPatternArrayBack1 = false;
boolean mirrorPatternArrayBack2 = false;

int backgroundColour = 240;
int headerColour = 240;
int workingAreaColour = 200;
int displayWorkingRowColour = 170;
int blackColour = 0;

int GP4colorScheme = 6;
int GP4colorSchemeActive = 0;


int mouseOffsetX = 0;
int mouseOffsetY = 0;
int mouseStartX;
int mouseStartY;
int mousePatternStartX;
int mousePatternStartY;
boolean mouseLocked = false;

boolean GUIlocked = false;

boolean FrankenpassapBackInvers = false;

GButton  btnOpenPatterImageFile, 
btnInvertpattern, 
btnPatternImageMirror, 
btnKnitStart, 
btnOneRowBack, 
btnKnitOneRow, 
btnKnitPause, 
btnPatternScaleYplus, 
btnPatternScaleYminus, 
btnPatternScaleXplus, 
btnPatternScaleXminus, 
btnPatternGridYplus, 
btnPatternGridYminus, 
btnPatternGridXplus, 
btnPatternGridXminus, 
btnPatternGridGapYplus, 
btnPatternGridGapYminus, 
btnPatternGridGapXplus, 
btnPatternGridGapXminus, 
btnSetWorkingWidth, 
btnSetWorkingWidthOffset, 
btnSetCursor, 
btnSetBorder, 
btnSetBorderToggle, 
btnConnectArduino, 
btnMirrorPatternArray1, 
btnMirrorPatternArray2, 
btnLoadKnittySettings, 
btnSaveKnittySettings, 
btnSetRowCounter, 
btnFrankenpassapSwitchBeds,
btnFrankenpassapBackInvers;


GLabel  btnPatternScaleText, 
btnPatternText, 
btnPatternGridText, 
btnPatternGridGapText, 
btnSetWorkingWidthText, 
btnSetWorkingWidthOffsetText, 
btnSetCursorText, 
btnRowCounterText,
btnKnittingText,
btnFrankanpassapText;

GTextField  txtfieldWorkingWidth, 
txtfieldWorkingWidthOffset, 
txtfieldSetCursor, 
txtfieldRowCounter;

SDrop drop;  //drop pictures

int debugZaehler = 0;

//handler to react on sketch exit
DisposeHandler dh;

void setup() {
  dh = new DisposeHandler(this);
  
  knittySettings = new JSONObject();

  size(GUIwidth, GUIheigth);

  UsedFont = createFont("Arial", 16, true); 


  //load Logo
  knittyLogoImage = loadImage("knitty_logo_80px.gif");

  displayButtonsGUI(); //GUI tab
  drop = new SDrop(this);
  //load BasicSettings
  knittySettingsName = "data/BasicKnittySettings.json";
  loadKnittySettingsFile();
  
}

void draw() {

//  InfoText = (str(debugZaehler));
//  debugZaehler++;


  parserSerialStream();

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


void drawPattern() {

  //don't draw while loading/saving settings
  if (fileOperationInProgress == true) {
    return;
  }

  // loop array
  for (int j=0; j < patternGridY; j++) {
    for ( int i=0; i < patternGridX; i++ ) {


      //mirror pattern in array
      if (mirrorPatternArray1 == true) {
        if (i % 2 == 0) {
          if (j % 2 == 0) {
            mirrorPatternImageX();
          }
          if (j % 2 != 0 && mirrorPatternArray2 == true) {
            mirrorPatternImageX();
          }
        } else {
          if (j % 2 != 0 && mirrorPatternArray2 == false) {
            mirrorPatternImageX();
          }
        }
      }

      //place pattern in array
      pushMatrix();
      translate((movePatternX+i*patternGridXgap)*scalingfactor+((i*patternImage.width*scalingfactor+scalingfactor)*patternScaleX), ((movePatternY-j*patternGridYgap)*scalingfactor-((j*patternImage.height*scalingfactor+scalingfactor)*patternScaleY)));
      image(patternImage, gridStartX+(totalWidth/2-patternImage.width/2+1)*scalingfactor, gridStartY+(displayWorkingRow-patternImage.height+2)*scalingfactor, patternImage.width*scalingfactor*patternScaleX, patternImage.height*scalingfactor*patternScaleY);
      noSmooth();
      popMatrix();

      //demirror pattern in array
      if (mirrorPatternArray1 == true) {
        if (i % 2 == 0) {
          if (j % 2 == 0) {
            mirrorPatternImageX();
          }
          if (j % 2 != 0 && mirrorPatternArray2 == true) {
            mirrorPatternImageX();
          }
        } else {
          if (j % 2 != 0 && mirrorPatternArray2 == false) {
            mirrorPatternImageX();
          }
        }
      }
    }
  }
}

void drawPatternBack() {
   //don't draw while loading/saving settings
  if (fileOperationInProgress == true) {
    return;
  }

  // loop array
  for (int j=0; j < patternGridBackY; j++) {
    for ( int i=0; i < patternGridBackX; i++ ) {


      //mirror pattern in array
      if (mirrorPatternArrayBack1 == true) {
        if (i % 2 == 0) {
          if (j % 2 == 0) {
            mirrorPatternImageBackX();
          }
          if (j % 2 != 0 && mirrorPatternArrayBack2 == true) {
            mirrorPatternImageBackX();
          }
        } else {
          if (j % 2 != 0 && mirrorPatternArrayBack2 == false) {
            mirrorPatternImageBackX();
          }
        }
      }

      //place pattern in array
      pushMatrix();
      translate((movePatternBackX+i*patternGridBackXgap)*scalingfactor+((i*patternImageBack.width*scalingfactor+scalingfactor)*patternScaleBackX), ((movePatternBackY-j*patternGridBackYgap)*scalingfactor-((j*patternImageBack.height*scalingfactor+scalingfactor)*patternScaleBackY)));
      image(patternImageBack, gridStartX+(totalWidth/2-patternImageBack.width/2+1)*scalingfactor, gridStartY+(displayWorkingRow-patternImageBack.height+2)*scalingfactor, patternImageBack.width*scalingfactor*patternScaleBackX, patternImageBack.height*scalingfactor*patternScaleBackY);
      noSmooth();
      popMatrix();

      //demirror pattern in array
      if (mirrorPatternArrayBack1 == true) {
        if (i % 2 == 0) {
          if (j % 2 == 0) {
            mirrorPatternImageBackX();
          }
          if (j % 2 != 0 && mirrorPatternArrayBack2 == true) {
            mirrorPatternImageBackX();
          }
        } else {
          if (j % 2 != 0 && mirrorPatternArrayBack2 == false) {
            mirrorPatternImageBackX();
          }
        }
      }
    }
  }
  
  
//  pushMatrix();
//  translate(movePatternBackX*scalingfactor, movePatternBackY*scalingfactor);
//  image(patternImageBack, gridStartX+(totalWidth/2-patternImageBack.width/2+1)*scalingfactor, gridStartY+(displayWorkingRow-patternImageBack.height+2)*scalingfactor, patternImageBack.width*scalingfactor, patternImageBack.height*scalingfactor);
//  noSmooth();
//  popMatrix();
}


void drawWorkingArea() {
  //draw workingArea
  pushMatrix();
  translate (gridStartX+(workingWidthOffset+(totalWidth/2-workingWidth/2))*scalingfactor, gridStartY);

  fill(patternImageColorList[0]);
//  //draw background in colour0 if knittingmachine = 2 and 3
//  if (patternImageColorList.length > 0 && knittingMachine >1) {
//    fill(patternImageColorList[0]);
//  } else {
//    fill(workingAreaColour);
//  }
  rect(0, 0, workingWidth*scalingfactor, rows*scalingfactor);
  popMatrix();
}


void drawGrid() {

  //  //draw HelpGrid
  //  pushMatrix();
  //  translate (gridStartX, gridStartY);
  //
  //  for (int x=0; x<totalWidth+1; x+=10) {
  //    fill(displayWorkingRowColour, 50);
  //    rect(x*scalingfactor, 0, scalingfactor, rows*scalingfactor);
  //  }
  //  for (int y=0; y<rows+1; y+=10) {
  //    fill(displayWorkingRowColour, 50);
  //    rect(0, y*scalingfactor, columns*scalingfactor, scalingfactor);
  //  }
  //  popMatrix();



  //clear left side
  pushMatrix();
  translate (0, gridStartY);
  fill(backgroundColour);
  // rect(0,0,gridStartX,rows*scalingfactor);
  rect(0, 0, gridStartX+(workingWidthOffset+(totalWidth/2-workingWidth/2))*scalingfactor, rows*scalingfactor);
  popMatrix();

  //clear right side
  pushMatrix();
  translate (gridStartX+(workingWidthOffset+((totalWidth/2-workingWidth/2)+workingWidth))*scalingfactor, gridStartY);
  fill(backgroundColour);
  // rect(0,0,gridStartX,rows*scalingfactor);
  rect(0, 0, (totalWidth/2-workingWidth/2+10)*scalingfactor, rows*scalingfactor);
  popMatrix();

  // clear header
  fill(headerColour);
  rect(0, 0, width, gridStartY);


  //Draw Border
  if (SetBorderToggle == true) {
    //draw Border left
    pushMatrix();
    translate (gridStartX+(workingWidthOffset+(totalWidth/2-workingWidth/2))*scalingfactor, gridStartY);
    //draw border in colour1 
    fill(patternImageColorList[SetBorderToggleColor]);
    rect(0, 0, scalingfactor, rows*scalingfactor);
    popMatrix();

    // draw Border right
    pushMatrix();
    translate (gridStartX+(workingWidthOffset+((totalWidth/2-workingWidth/2-1)+workingWidth))*scalingfactor, gridStartY);
    //draw border in colour1 
    fill(patternImageColorList[SetBorderToggleColor]);
    rect(0, 0, scalingfactor, rows*scalingfactor);
    popMatrix();
  }

  // draw working row transparent
  if (knittigInProgress == false) {
    //draw displayWorkingRow
    pushMatrix();
    translate (gridStartX+(workingWidthOffset*scalingfactor), gridStartY+displayWorkingRow*scalingfactor);
    fill(displayWorkingRowColour, 90);
    rect(0, 0, totalWidth*scalingfactor, scalingfactor);
    popMatrix();
  }


  //draw displayWorkingRow left
  pushMatrix();
  translate (gridStartX, gridStartY+displayWorkingRow*scalingfactor);
  fill(displayWorkingRowColour);
  //rect(0,0,totalWidth*scalingfactor,scalingfactor);
  rect(0, 0, (totalWidth/2-workingWidth/2+workingWidthOffset)*scalingfactor, scalingfactor);
  popMatrix();

  //draw displayWorkingRow right
  pushMatrix();
  translate (gridStartX+(workingWidthOffset+((totalWidth/2-workingWidth/2)+workingWidth))*scalingfactor, gridStartY+displayWorkingRow*scalingfactor);
  fill(displayWorkingRowColour);
  //rect(0,0,totalWidth*scalingfactor,scalingfactor);
  rect(0, 0, (totalWidth/2-workingWidth/2)*scalingfactor, scalingfactor);
  popMatrix();

  //draw Grid
  pushMatrix();
  translate (gridStartX, gridStartY);

  for (int x=0; x<totalWidth+1; x++) {
    stroke(0);
    line(x*scalingfactor, 0, x*scalingfactor, rows*scalingfactor);
  }
  for (int y=0; y<rows+1; y++) {
    stroke(0);
    line(0, y*scalingfactor, columns*scalingfactor, y*scalingfactor);
  }
  popMatrix();

  //draw Logo
  image(knittyLogoImage, 5, 5, knittyLogoImage.width, knittyLogoImage.height);
}

void displayInfoText() {
  fill(255);
  rect(300, 0, 900, 50);
  fill(0);
  textAlign(LEFT);
  text(InfoText, 303, 12);
}

//code to react on sketch exit
public class DisposeHandler {
   
  DisposeHandler(PApplet pa)
  {
    pa.registerMethod("dispose", this);
  }
   
  public void dispose()
  {     
    println("Closing sketch");
    saveBasicKnittySettings();
    // Place here the code you want to execute on exit
  }
}
