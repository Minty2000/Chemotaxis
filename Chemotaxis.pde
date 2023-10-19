Min[] blue,red,yellow;
double dis = 0;
double  minBlueDistance = 500;
double minYellowDistance = 500;
double minRedDistance = 500;
void setup(){
  size (500,500);
  blue = new Min [100];
    for(int i = 0 ;i<blue.length;i++){
       blue[i] = new Min((int)(Math.random()*501),(int)(Math.random()*501),color(0,0,255)); 
    }
  red = new Min [100];
    for(int i = 0 ;i<red.length;i++){
       red[i] = new Min((int)(Math.random()*501),(int)(Math.random()*501),color(255,0,0)); 
    }
  yellow = new Min [100];
    for(int i = 0 ;i<yellow.length;i++){
       yellow[i] = new Min((int)(Math.random()*501),(int)(Math.random()*501),color(255,255,0)); 
    }


}
void draw() {
  background(0);
  
  for (int i = 0; i < blue.length; i++) {
    blue[i].show();
    blue[i].move();
    red[i].show();
    red[i].move();
    yellow[i].show();
    yellow[i].move();

   //restrictions for x axis
    if(blue[i].myX>500){blue[i].myX = 500;}
    if(blue[i].myX<0){blue[i].myX = 0;}
    if(red[i].myX >500){red[i].myX = 500;}
    if(red[i].myX <0){red[i].myX = 0;}
    if(yellow[i].myX >500){yellow[i].myX = 500;}
    if(yellow[i].myX <0){yellow[i].myX = 0;}
   //restrictions for y axis
     if (blue[i].myY>500){blue[i].myY = 500;}
     if (blue[i].myY<0){blue[i].myY = 0;}
     if(red[i].myY >500){red[i].myY = 500;}
     if(red[i].myY <0){red[i].myY = 0;}
     if(yellow[i].myY >500){yellow[i].myY = 500;}
     if(yellow[i].myY<0){yellow[i].myY = 0;}
     
    for (int j = 0; j < blue.length; j++) {
      if (j != i) {
       
        double distBlue = dist(blue[i].myX, blue[i].myY, blue[j].myX, blue[j].myY);

        
        if (distBlue < 10) {
          red[i].Color = blue[j].Color;
        }
      }

      if (j != i) {
        
        double distRed = dist(blue[i].myX, blue[i].myY, red[j].myX, red[j].myY);

      
        if (distRed < 10) {
          blue[i].Color = yellow[j].Color;
        }
      }

      if (j != i) {
       
        double distYellow = dist(blue[i].myX, blue[i].myY, yellow[j].myX, yellow[j].myY);

        
        if (distYellow < 10) {
          yellow[i].Color = red[j].Color;
        }
      }
    }
       //start, blue chase red
    if (red[i].myX >blue[i].myX){
       blue[i].myX = blue[i].myX + (int)(Math.random()*5)-1;
       
   }else{
       blue[i].myX = blue[i].myX + (int)(Math.random()*5)-3;
   }
   
    if (red[i].myY  >blue[i].myY){
       blue[i].myY = blue[i].myY + (int)(Math.random()*5)-1;
   }else{
       blue[i].myY = blue[i].myY + (int)(Math.random()*5)-3;
   }
   //end of blue chase red
   
   //start of yellow chase blue
   
       if (blue[i].myX >yellow[i].myX){
       yellow[i].myX = yellow[i].myX + (int)(Math.random()*5)-1;
       
   }else{
       yellow[i].myX = yellow[i].myX + (int)(Math.random()*5)-3;
   }
   
    if (blue[i].myY  >yellow[i].myY){
       yellow[i].myY = yellow[i].myY + (int)(Math.random()*5)-1;
   }else{
       yellow[i].myY = yellow[i].myY + (int)(Math.random()*5)-3;
   }
   //end of yellow chase blue
   
   //start of red chase yellow
       if (yellow[i].myX >red[i].myX){
       red[i].myX = red[i].myX + (int)(Math.random()*5)-1;
       
   }else{
       red[i].myX = red[i].myX + (int)(Math.random()*5)-3;
   }
   
    if (yellow[i].myY  >red[i].myY){
       red[i].myY = red[i].myY + (int)(Math.random()*5)-1;
   }else{
       red[i].myY = red[i].myY + (int)(Math.random()*5)-3;
   }
   
   
   //end of red chase yellow
  }
}

   




class Min {
 int myX, myY,Color;
 Min(int x,int y,int c){
   myX = x;
   myY = y;
   Color = c;
 }
 
 void move(){
   myX = myX + (int)(Math.random()*15)-7;
   myY = myY + (int)(Math.random()*15)-7;
 }
 void show(){
   fill(Color);
   ellipse(myX,myY,20,20);
 }
}
