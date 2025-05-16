import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
String status = "Stopped";

float displayWidth, displayHeight, displayX, displayY;
float boxWidth, boxHeight, buttonSpacing;

void setup() {
  fullScreen(); // Use full screen
  minim = new Minim(this);
  player = minim.loadFile("The ORIGINAL Bad Apple!! (Touhou 4 LLS).mp3");

  if (player == null) {
    println("Error: Audio file not found or failed to load.");
    exit();
  }

  // Set dimensions for the display and control buttons
  displayWidth = width * 0.8;
  displayHeight = height * 0.4;
  displayX = (width - displayWidth) / 2;
  displayY = height * 0.1;

  boxWidth = width * 0.1;
  boxHeight = height * 0.1;
  buttonSpacing = width * 0.02;
}

void draw() {
  background(30);

  // Draw the display box
  fill(50);
  rect(displayX, displayY, displayWidth, displayHeight);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text("Status: " + status, displayX + displayWidth / 2, displayY + displayHeight / 2);

  // Draw control buttons
  drawButton("Play", width * 0.2, height * 0.6);
  drawButton("Pause", width * 0.35, height * 0.6);
  drawButton("Stop", width * 0.5, height * 0.6);
  drawButton("Rewind", width * 0.65, height * 0.6);
  drawButton("Forward", width * 0.8, height * 0.6);
}

void drawButton(String label, float x, float y) {
  fill(100);
  rect(x, y, boxWidth, boxHeight);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(16);
  text(label, x + boxWidth / 2, y + boxHeight / 2);
}

void mousePressed() {
  // Check if Play button is clicked
  if (isButtonClicked(width * 0.2, height * 0.6)) {
    if (!player.isPlaying()) {
      player.play();
      status = "Playing";
    }
  }
  // Check if Pause button is clicked
  else if (isButtonClicked(width * 0.35, height * 0.6)) {
    if (player.isPlaying()) {
      player.pause();
      status = "Paused";
    }
  }
  // Check if Stop button is clicked
  else if (isButtonClicked(width * 0.5, height * 0.6)) {
    if (player.isPlaying() || player.position() > 0) {
      player.pause();
      player.rewind();
      status = "Stopped";
    }
  }
  // Check if Rewind button is clicked
  else if (isButtonClicked(width * 0.65, height * 0.6)) {
    player.rewind();
    status = "Rewound";
  }
  // Check if Forward button is clicked
  else if (isButtonClicked(width * 0.8, height * 0.6)) {
    player.cue(player.length() - 5000); // Jump to the last 5 seconds
    status = "Forwarded";
  }
}

boolean isButtonClicked(float x, float y) {
  return mouseX > x && mouseX < x + boxWidth && mouseY > y && mouseY < y + boxHeight;
}

void stop() {
  if (player != null) {
    player.close();
  }
  if (minim != null) {
    minim.stop();
  }
  super.stop();
}
