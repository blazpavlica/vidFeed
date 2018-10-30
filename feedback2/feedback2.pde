float offsetX=0;
float offsetY=0;
PImage c;
PImage d;
PImage e;
boolean lclick=false;
boolean rclick=false;
import milchreis.imageprocessing.*;

float scale=1.05;
float rotate=0.05; 
float edge=0.1;
float auto=0.1;

void setup() {
  size(400,400);
  c=createImage(width,height,RGB);
  stroke(10,100,200);
  background(0);
  line(100,100,200,200);
}
void draw() {
  offsetX=(-width/2+mouseX)*0.1;
  offsetY=(-height/2+mouseY)*0.1;
  pushMatrix();
  translate(width/2+offsetX,height/2+offsetY);
  scale(scale);
  rotate(rotate);
  //d=Quantization.apply(c, 100); 
  e=AutoBalance.apply(c);
  d=SobelEdgeDetector.apply(c, false);
  c=Sharpen.apply(c, 0.1);
  
  tint(255,255,240,200);
  image(c,-width/2,-height/2);
  
  tint(255,255,255,255*auto);
  image(e,-width/2,-height/2);
  
  tint(255,255,255,255*edge);
  image(d,-width/2,-height/2);
  if(lclick){
    line(-100,-100,100,100);
    lclick=false;
  }
  if(rclick){
    fill(0,230);
    rect(-width/2,-height/2,width,height);
    rclick=false;
  }
  //filter(DILATE);
  //filter(ERODE);
  //filter(DILATE);
  popMatrix();
  c=get();
}
void mouseClicked() {
  if(mouseButton==LEFT){
    lclick=true;
  }
  if(mouseButton==RIGHT){
    rclick=true;
  }
}
