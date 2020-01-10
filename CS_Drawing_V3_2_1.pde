int tool = 0;
int red = 0;
int green = 0;
int blue = 0;
int size = 1;
int eraserSize = 1;
int bop = 0;
final int maxIterations = 10;

int screenShotNumber = 1;

PImage pencilButton;
PImage pencilCursor;
PImage eraserButton;
PImage clearButton;
PImage bopPencilButton;
PImage bopMountainButton;
PImage logo;
PImage sprayCanButton;

PImage screenShot;

boolean penChange = false;

void setup() {
 size(1200,800);
 background(255);
 textSize(50);
 pencilButton = loadImage("pencilButton.png");
 pencilCursor = loadImage("pencilButton.png");
 eraserButton = loadImage("eraserButton.png");
 clearButton = loadImage("resetButton.png");
 bopPencilButton = loadImage("bopPencilButton.png");
 bopMountainButton = loadImage("bopMountainButton.png");
 logo = loadImage("logo.png");
 sprayCanButton = loadImage("sprayCanButton.png");
 surface.setIcon(logo);
 screenShot = createImage(1000, 800, ARGB);
 cursor(CROSS);
}

void draw() {
  //design
    design();
  //Tools
    pencil();
    eraser();
    screenShot();
    sprayCan();
  //Buttons
    pencilButton();
    eraserButton();
    colorSelector();
    sprayButton();
    clearButton();
    sizeButton();
    bopPencilButton();
    bopBackgroundButton();
    selectedButton();
    RGBColorSelector();
}

//------------Tools----------------

void pencil(){
  stroke(red,green,blue);
  strokeWeight(size);
  if(mousePressed && tool == 0){
    line(mouseX, mouseY, pmouseX, pmouseY);
 }
}

void eraser(){
  eraserSize = size * 2;
   strokeWeight(eraserSize);
   if(mousePressed && tool == 1){
     stroke(255);
     fill(255);
     line(mouseX, mouseY, pmouseX, pmouseY);
   }
}

void sprayCan(){
  int width1=size*3; // that be the width of your brush
  //
  float radx;   // Radius
  float rady;
  float angle1; // angle
  float x;      // result
  float y;
  //
  if(mousePressed && tool == 2){
  for (int i=0; i < maxIterations; i++) {
    radx=random(width1);
    rady=random(width1);
    angle1= random(359);
    //
    x=(radx*cos(radians(angle1)))+mouseX;
    y=(radx*sin(radians(angle1)))+mouseY;
    //
    point(x, y);
  }
  }
}


void screenShot(){
  if(keyPressed == true && key == 's' || key == 'S'){
    screenShot = get(0,0,1000,800);
    screenShot.save("screenshot" + nf(screenShotNumber) + ".png");
    screenShotNumber++;
    //saveFrame("filename-####.png");
  }
}

//-----------Buttons--------------------

void design(){
  strokeWeight(5);
  stroke(0);
  line(1000,0,1000,800);
  fill(160);
  rect(1000,-10,1000,1000);
}

void pencilButton(){
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(1025,25,51,52);
  if(mousePressed && mouseX > 1025 && mouseX < 1075 && mouseY > 25 && mouseY < 75){
    tool = 0;
  }
  if(keyPressed && key == 'p'){
    tool = 0;
  }
  image(pencilButton,1026,26,50,50);
}

void sprayButton(){
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(1100,100,51,51);
  if(mousePressed && mouseX > 1100 && mouseY < 1150 && mouseY > 100 && mouseY < 150){
    tool = 2;
  }
  if(keyPressed && key == 'c'){
    tool = 2;
  }
  image(sprayCanButton,1101,101,50,50);
}

void eraserButton(){
  strokeWeight(1);
  stroke(0);
  fill(255);
  rect(1100,25,51,51);
  if(mousePressed && mouseX > 1110 && mouseX < 1150 && mouseY > 25 && mouseY < 75){
    tool = 1;
  }
  if(keyPressed && key == 'e'){
    tool = 1;
  }
  image(eraserButton,1101,26,50,50);
}

void colorSelector(){
  //All of them
  strokeWeight(1);
  stroke(0);
  //Red button
  fill(255);
  rect(1025,745,40,40);
  fill(255,0,0);
  ellipse(1045,765,30,30);
  if(mousePressed && mouseX > 1025 && mouseX < 1065 && mouseY > 745 && mouseY < 785 && bop == 0){
    red = 255;
    green = 0;
    blue = 0;
  }else if(mousePressed && mouseX > 1025 && mouseX < 1065 && mouseY > 745 && mouseY < 785 && bop == 1){
    background(255,0,0);
  }
  //Green button
  fill(255);
  rect(1075,745,40,40);
  fill(0,255,0);
  ellipse(1095,765,30,30);
  if(mousePressed && mouseX > 1075 && mouseX < 1115 && mouseY > 745 && mouseY < 785 && bop == 0){
    red = 0;
    green = 255;
    blue = 0;
  }else if(mousePressed && mouseX > 1075 && mouseX < 1115 && mouseY > 745 && mouseY < 785 && bop == 1){
    background(0,255,0);
  }
  //Blue button
  fill(255);
  rect(1125,745,40,40);
  fill(0,0,255);
  ellipse(1145,765,30,30);
  if(mousePressed && mouseX > 1125 && mouseX < 1165 && mouseY > 745 && mouseY < 785 && bop == 0){
    red = 0;
    green = 0;
    blue = 255;
  }else if(mousePressed && mouseX > 1125 && mouseX < 1165 && mouseY > 745 && mouseY < 785 && bop == 1){
    background(0,0,255);
  }
  //Yellow button
  fill(255);
  rect(1025,695,40,40);
  fill(246,255,3);
  ellipse(1045,715,30,30);
  if(mousePressed && mouseX > 1025 && mouseX < 1065 && mouseY > 695 && mouseY < 735 && bop == 0){
    red = 246;
    green = 255;
    blue = 3;
  }else if(mousePressed && mouseX > 1025 && mouseX < 1065 && mouseY > 695 && mouseY < 735 && bop == 1){
    background(246,255,3);
  }
  //Black button
  fill(255);
  rect(1075,695,40,40);
  fill(0,0,0);
  ellipse(1095,715,30,30);
  if(mousePressed && mouseX > 1075 && mouseX < 1115 && mouseY > 695 && mouseY < 735 && bop == 0){
    red = 0;
    green = 0;
    blue = 0;
  }else if(mousePressed && mouseX > 1075 && mouseX < 1115 && mouseY > 695 && mouseY < 735 && bop == 1){
    background(0,0,0);
  }
  //Orange button
  fill(255);
  rect(1125,695,40,40);
  fill(255,154,3);
  ellipse(1145,715,30,30);
  if(mousePressed && mouseX > 1125 && mouseX < 1165 && mouseY > 695 && mouseY < 735 && bop == 0){
    red = 255;
    green = 154;
    blue = 3;
  }else if(mousePressed && mouseX > 1125 && mouseX < 1165 && mouseY > 695 && mouseY < 735 && bop == 1){
    background(255,154,3);
  }
}

void bopPencilButton(){
  fill(255);
  rect(1025,630,51,51);
  if(mousePressed && mouseX > 1025 && mouseX < 1075 && mouseY > 630 && mouseY < 680){
    bop = 0;
  }
  image(bopPencilButton,1026,631,50,50);
}

void bopBackgroundButton(){
  fill(255);
  rect(1115,630,51,51);
  if(mousePressed && mouseX > 1115 && mouseX < 1165 && mouseY > 630 && mouseY < 680){
    bop = 1;
  }
  image(bopMountainButton,1116,631,50,50);
}

void clearButton(){
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(1025,100,51,51);
  fill(0);
  text("C", 1033,145);
  if(mousePressed && mouseX > 1025 && mouseX < 1075 && mouseY > 100 && mouseY < 150){
    stroke(255);
    fill(255);
    rect(0,0,1000,800);
  }
  image(clearButton,1026,101,50,50);
}

void sizeButton(){
  
  float textX = 1072.5;
  
  //Display
    fill(255);
    strokeWeight(1);
    stroke(0);
    rect(1025,175,125,50);
    fill(0);
    textSize(50);
    text(size,textX,220);
  //Logic
    if(keyPressed && key == '1'){
      size = 1;
    }
    if(keyPressed && key == '2'){
      size = 2;
    }
    if(keyPressed && key == '3'){
      size = 3;
    }
    if(keyPressed && key == '4'){
      size = 4;
    }
    if(keyPressed && key == '5'){
      size = 5;
    }
    if(keyPressed && key == '6'){
      size = 6;
    }
    if(keyPressed && key == '7'){
      size = 7;
    }
    if(keyPressed && key == '8'){
      size = 8;
    }
    if(keyPressed && key == '9'){
      size = 9;
    }
    if(keyPressed && key == CODED && keyCode == UP && penChange == false){
      size++;
      penChange = true;
      delay(250);
      penChange = false;
    }
    
    if(keyPressed && key == CODED && keyCode == DOWN && penChange == false){
      size--;
      penChange = true;
      delay(250);
      penChange = false;
    }
    
    //parameters
    if(size > 10){
      size = 10;
    }
    
    if(size < 1){
      size = 1;
    }
}

void selectedButton(){
  rect(1025, 275, 51, 51);
  fill(0);
  textSize(15);
  text("Current Tool",1085,305);
  if(tool == 0){
    image(pencilButton,1026,276,50,50);
  }
  if(tool == 1){
    image(eraserButton,1026,276,50,50);
  }
  if(tool == 2){
    image(sprayCanButton,1026,276,50,50);
  }
}

void RGBColorSelector(){
  //Red
  fill(255);
  textSize(50);
  rect(1025,350,50,50);
  fill(0);
  text("R",1033,395);
  
  if(keyPressed && key == 'r'){
    red += 5;
    delay(250);
  }else if(keyPressed && key == 't'){
    red -= 5;
    delay(250);
  }
  
  if(red > 255){
    red = 255;
  }
  
  if(red < 0){
    red = 0;
  }
  
  text(red, 1090, 395);
  
  //Green
  fill(255);
  textSize(50);
  rect(1025,425,50,50);
  fill(0);
  text("G",1033,470);
  
  if(keyPressed && key == 'g'){
    green += 5;
    delay(250);
  }else if(keyPressed && key =='h'){
    green -= 5;
    delay(250);
  }
  
  if(green > 255){
    green = 255;
  }
  
  if(green < 0){
    green = 0;
  }
  
  text(green, 1090, 470);
  
  //Blue
  fill(255);
  textSize(50);
  rect(1025,500,50,50);
  fill(0);
  text("B",1033,545);
  
  if(keyPressed && key == 'b'){
    blue += 5;
    delay(250);
  }else if(keyPressed && key == 'n'){
    blue -= 5;
    delay(250);
  }
  
  if(blue > 255){
    blue = 255;
  }
  
  if(blue < 0){
    blue = 0;
  }
  
  text(blue, 1090, 545);
}
