void changeColour(){

     println("Change Colour: " + str(colourCounter+1));
     
     sendCommand(COM_CMD_SERVO, "6");  //activate servos
  
  
     sendCommand(COM_CMD_SERVO, str(colourCounter+1));
  
  
  //old   
//     colourActual = colourActual+1;  // next colour
//      sendCommand(COM_CMD_SERVO, str(colourActual));
//     
//     if (colourActual >= coloursInUse) {
//         colourActual = 0;
//       }

    
}


void disableServos(){

     println("Disable Servo");
     sendCommand(COM_CMD_SERVO, "0"); 
     sendCommand(COM_CMD_SERVO, "5");  //deactivate servos
   
}

