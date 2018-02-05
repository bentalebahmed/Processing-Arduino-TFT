
import drop.*;

SDrop drop;

PImage m;

boolean newImage = false;

int i;


void setup() {
  size(250, 300);
  drop = new SDrop(this);
}

void draw() {
  background(#A7A2A2);
   imageMode(CENTER);
  if (m != null ) {
     image(m, width/2, height/2 - 50, 160, 128);
     text("Click to save", 10, 220);
     text("Or drop another image", 10, 250);
  } else {
    fill(0);
    textSize(20);
    text("Drop an image", 50, 150);
  }
}

void dropEvent(DropEvent theDropEvent) {
  // if the dropped object is an image, then 
  // load the image into our PImage.
  if (theDropEvent.isImage() && !newImage) {
    m = theDropEvent.loadImage();
    newImage = true;
    //println("new image");
  }
}

void mousePressed() {
  if (newImage ) { 
    m.resize(160, 128);
    m.save(dataPath(i+"") + ".bmp");
    newImage = false;
    i++;
  }
}