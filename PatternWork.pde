boolean loadPatternImage(String filename) {

  println(filename);
  patternImageName = filename;
  patternImage = loadImage(filename);  // Load the image into the program
  patternImageWorkingSet = loadImage(filename);  // Load the image into the program
  patternImageName = filename;

  //check colour of the image
  //
  //  if (createColourPalette()) {
  //    for (int k=0; k<patternImageColorList.length; k++ ) {
  //      println("Color"+ k +": " + patternImageColorList[k][0] + "     Count: " +  patternImageColorList[k][1]); //prints the colors and the number of times it is prsent in the image (you'll notice that the values are not in rgb format)
  //    }
  //  }


  // show colour palette of the pattern in serial window
  if (createColourPalette()==true) {
    for (int k=0; k<patternImageColorList.length; k++ ) {
      println("Color"+ k +": " + patternImageColorList[k]); //prints the colors (you'll notice that the values are not in rgb format)
      coloursInUse = patternImageColorList.length;
    }
  } else {
    //warning if more than 4 colours
    return false;
  }
  //change background to transparent and mirror image if it is a superba
  if (knittingMachine ==1) {
    // makePatternImageTransparent(); 
    mirrorPatternImageX();
  }
  return true;
}

boolean loadPatternImageBack(String filename) {

  println(filename);
  patternImageNameBack = filename;
  patternImageBack = loadImage(filename);  // Load the image into the program
  patternImageWorkingSetBack = loadImage(filename);  // Load the image into the program
  patternImageNameBack = filename;


  // show colour palette of the pattern in serial window
  if (createColourPaletteBack()) {
    for (int k=0; k<patternImageColorListBack.length; k++ ) {
      println("Color"+ k +": " + patternImageColorListBack[k]); //prints the colors (you'll notice that the values are not in rgb format)
    }
    //to do warning if more than 4 colours
    coloursInUseBack = patternImageColorListBack.length;
  } else {
    //warning if more than 4 colours
    return false;
  }
  return true;
}

void makePatternImageTransparent() {
  for (int i = 0; i < patternImage.width * patternImage.height; i++) {
    if ((patternImage.pixels[i] & 0x00FFFFFF) == 0x0000000) {
      //patternImage.pixels[i] = 0;
    } else {
      patternImage.pixels[i] = 0;
    }
  }
  patternImage.format = ARGB;
  patternImage.updatePixels();
}

void mirrorPatternImageX() {
  for ( int i=0; i < patternImage.width; i++ ) {
    for (int j=0; j < patternImage.height; j++) {
      patternImageWorkingSet.set( patternImage.width - 1 - i, j, patternImage.get(i, j) );
    }
  }
  //zurückschreiben
  for (int i = 0; i < patternImage.width * patternImage.height; i++) {
    patternImage.pixels[i] = patternImageWorkingSet.pixels[i];
  }
  patternImage.updatePixels();
}

void mirrorPatternImageBackX() {
  for ( int i=0; i < patternImageBack.width; i++ ) {
    for (int j=0; j < patternImageBack.height; j++) {
      patternImageWorkingSetBack.set( patternImageBack.width - 1 - i, j, patternImageBack.get(i, j) );
    }
  }
  //zurückschreiben
  for (int i = 0; i < patternImageBack.width * patternImageBack.height; i++) {
    patternImageBack.pixels[i] = patternImageWorkingSetBack.pixels[i];
  }
  patternImageBack.updatePixels();
}

/*
void mirrorPatternImageX() {
 patternImage.loadPixels();
 int k = 0;
 int patternHeight = patternImage.height;
 int patternWidth = patternImage.width;
 for ( int i=0; i < patternWidth; i++ ) {
 for (int j=0; j < patternHeight; j++) {
 // patternImage.set( patternImage.width - 1 - i, j, patternImage.get(i, j) );
 patternImage.pixels[j*patternWidth+i] = patternImage.get(patternWidth-1-i, j);
 k++;
 }
 }
 
 patternImage.updatePixels();
 }
 */


void inversePatternImage() {
  //only invert 2 colour pattern
  patternImage.loadPixels();
  if (patternImageColorList.length < 3) {
    for (int i = 0; i < patternImage.width * patternImage.height; i++) {
      //println(patternImage.pixels[i] +" -- "+ patternImageColorList[0]+" -- "+ patternImageColorList[1]);
      if (patternImage.pixels[i] == patternImageColorList[0]) {
        patternImage.pixels[i] = patternImageColorList[1];
      } else {
        patternImage.pixels[i] = patternImageColorList[0];
      }
    }
  }
  patternImage.updatePixels();
}

void inversePatternImageBack() {
  //only invert 2 colour pattern
  patternImageBack.loadPixels();
  if (patternImageColorListBack.length < 3) {
    for (int i = 0; i < patternImageBack.width * patternImageBack.height; i++) {
      if (patternImageBack.pixels[i] == patternImageColorListBack[0]) {
        patternImageBack.pixels[i] = patternImageColorListBack[1];
      } else {
        patternImageBack.pixels[i] = patternImageColorListBack[0];
      }
    }
  }
  patternImageBack.updatePixels();
}



//count colours in patternImage
boolean createColourPalette() {

  //clear array
  if (patternImageColorList.length > 0) {
    for (int i = patternImageColorList.length; i >0; i--) {
      patternImageColorList = shorten(patternImageColorList);
    }
  }
  //loop through all the pixels of the image
  for (int i = 0; i < patternImage.pixels.length; i++) {
    boolean colorExists = false; //bollean variable that checks if the color already exists in the array
    //loop through the values in the array
    for (int j = 0; j < patternImageColorList.length; j++) {
      if (patternImageColorList[j] == patternImage.pixels[i]) {

        colorExists = true; //color already exists in the array
      }
    }

    //if the color hasn't been added to the array
    if (colorExists == false) {
      //stop if more than 4 colours
      if (patternImageColorList.length >= 4) {
        InfoText = ("WARNING: The picture has more then 4 Colours!!\nIt will not be knitted properly.");

        println("WARNING: The picture has more then 4 Colours!! It will not be knitted properly.");
        return false;
      }
      patternImageColorList = (int[])append(patternImageColorList, patternImage.pixels[i]); //add it
    }
  }

  return true;
}

boolean createColourPaletteBack() {

  //clear array
  if (patternImageColorListBack.length > 0) {
    for (int i = patternImageColorListBack.length; i >0; i--) {
      patternImageColorListBack = shorten(patternImageColorListBack);
    }
  }
  //loop through all the pixels of the image
  for (int i = 0; i < patternImageBack.pixels.length; i++) {
    boolean colorExists = false; //bollean variable that checks if the color already exists in the array
    //loop through the values in the array
    for (int j = 0; j < patternImageColorListBack.length; j++) {
      if (patternImageColorListBack[j] == patternImageBack.pixels[i]) {

        colorExists = true; //color already exists in the array
      }
    }

    //if the color hasn't been added to the array
    if (colorExists == false) {
      patternImageColorListBack = (int[])append(patternImageColorListBack, patternImageBack.pixels[i]); //add it
    }
  }

  return true;
}

