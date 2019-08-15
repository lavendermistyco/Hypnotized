import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioPlayer flex;

int p = 0;

void setup(){
size( 900, 900, P3D);
noStroke();
rectMode(CENTER);
ellipseMode(CENTER);
minim = new Minim(this);
flex = minim.loadFile("0Feeling Happy ' Deep House Summer Mix 2015 -.mp3");
flex.loop();
}


void draw(){
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < flex.bufferSize() -1; i++) {
    rotateX(p*PI/9*0.001);
    fill(222, 72, 147);
    float leftside = flex.left.level() * 50;
    ellipse( i, i, leftside, leftside);
    rotate(p*PI/9*0.002);
    fill(39, 199, 255);
    float rightside = flex.right.level()*100;
    rect(i, i, rightside, rightside);
    
    pushMatrix();
    rotateY(p*-PI/9*0.001);
    fill(22, 237, 59);
     ellipse(i/2, i/2, rightside, rightside);
     rotate(p*-PI/10*0.002);
     fill(136,22, 237);
     rect(i/2, i/2, leftside, leftside);
     popMatrix();
  }
  p++;
  
  
}


void stop(){
  flex.close();
  minim.stop();
  super.stop();
  
}

void keyPressed(){
  if(flex.isPlaying()){
    flex.pause();     
  }
  else {
    flex.play();
  }
  
}