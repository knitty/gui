

void makePatternImageTransparent() {
     for (int i = 0; i < patternImage.width * patternImage.height; i++)
     {
          if ((patternImage.pixels[i] & 0x00FFFFFF) == 0x0000000)
          {
               //patternImage.pixels[i] = 0;
          }
          else{
               patternImage.pixels[i] = 0;
          }


     }
     patternImage.format = ARGB;
     patternImage.updatePixels();

}

void mirrorPatternImageX() {
     for( int i=0; i < patternImage.width; i++ ){
          for(int j=0; j < patternImage.height; j++){
               patternImageWorkingSet.set( patternImage.width - 1 - i, j, patternImage.get(i, j) );
          }
     }
     //zurückschreiben
     for (int i = 0; i < patternImage.width * patternImage.height; i++)
     {
          patternImage.pixels[i] = patternImageWorkingSet.pixels[i];
     }
     patternImage.updatePixels();

}

void inversePatternImage(){

     for (int i = 0; i < patternImage.width * patternImage.height; i++)
     {
          if (patternImage.pixels[i] == 0)
          {
               patternImage.pixels[i] = 0xFF000000;
          }
          else
          {
               patternImage.pixels[i] = 0;
          }
          patternImage.updatePixels();
     }
}
