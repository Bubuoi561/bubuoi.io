// dyanmic not static
//
//libary-mimin
//
//global variables
//
float X, Y, Width, Height;
float topDisplayX, topDisplay, topDisplayWidth, topDisplayHeight;
float loopX, loopY, loopWidth, loopHeight;

void setup() {
  fullScreen();
  int appwidth = displayWidth;
  int appheight = displayHeight;

  X = appwidth + 0.20 ;
  Y= appheight + 0.20;
  Width = appwidth + .20;
  Height = appheight + 0.20;
  loopX = appwidth + 0.20 ;
  loopY = appheight +0.20 ;
  loopWidth = appwidth + .20 ;
  loopHeight  = appheight + 0.20;

  rect(loopX, loopY, loopWidth, loopHeight);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  rect(X, Y, Width, Height);
  
}
void draw () {
}
