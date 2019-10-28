/*
Heder A Hayat
Music 8/CS 2
Michael Casey
Final Project: 3D Visualization of Music using Strange Chaotic Attractors
 
 A 3D representation of chaotic strange attractors that react to music being played! 
 Choose between two pieces of audio and then choose which strange attractor you want to see! You can also 
 choose to have a live audio input and see how the system reacts to the sounds around you. Option to draw stars
 that 'twinkle' based on the audio.

Everything draws and updates based on user input on either keys or mouse clicks:

Press 'l' to start creating a Lorenz attractor
Press 'r' to start creating a Rossler attractor
(note: creating a rossler attractor while a lorenz is already drawing would just switch between
 attractors, and vice versa)
Click and drag the mouse to move the camera around
Scroll up and down to zoom in and out
Press 'm' to start playing Money by Pink Floyd
Press 'g' to start playing Gravity by John Mayer
(note: only one song can be played at one time! Playing Gravity while Money is being played will
 pause Money and start playing Gravity, and vice versa. Pressing 'm' again would simply pause Money)
Press 'i' to turn microphone on (this would turn off music) 
Press 's' to toggle the stars on. Pressing 's' again would toggle them off.
Press 'c' to make a continuous attractor
Press 'p' to make it in point form again (it always starts in point form)
Press 'f' for the camera rotation to go faster (making good visuals) and press 'F' to make it go
even faster. Pressing 'n' would make it come back to normal speed
Double click anywhere on the sketch for the attractor to go to the original orientation with which
it started
Cmd + click and drag to move the attractor around

ENJOY!

*/

import peasy.*;

import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer money, gravity; // two different songs being loaded
AudioInput in; // audio input
FFT fft, fft2, fft3; // fast fourier transforms for the songs and the live audio

Star[] stars = new Star[120]; // create an array for stars
// create an instance each for the two attractors
Lorenz lorenz;
Rossler rossler;

boolean rotateNormal = true; // starts with normal speed of rotation
boolean rotateFaster = false;
boolean rotateFastest = false;

boolean str = false; // starts with stars toggled off

//starts with no attractors being drawn
boolean lorenzOn = false;
boolean rosslerOn = false;

boolean pt = true; // starts with the attractor being drawn in point form instead of continuous
boolean cont = false;

// starts with no song being played or mic input
boolean moneyOn = false;
boolean gravityOn = false;
boolean micOn = false;

PeasyCam cam; // 3D camera

void setup() {
  size(1000, 700, P3D);
  smooth();
  cam = new PeasyCam(this, 200); // starts the camera with a distance of 200 from the main sketch
  cam.setMaximumDistance(450); // cannot zoom out more than 450

  lorenz = new Lorenz();
  rossler = new Rossler();

  minim = new Minim(this);
  
  // load each song and create an fft for it, including the mic live audio
  money = minim.loadFile("money.mp3");
  fft = new FFT(money.bufferSize(), money.sampleRate());

  gravity = minim.loadFile("gravity.mp3");
  fft2 = new FFT(gravity.bufferSize(), gravity.sampleRate());

  in = minim.getLineIn();
  fft3 = new FFT(in.bufferSize(), in.sampleRate());
  
  // initialize the stars in the array
  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star(random(-210, 210), random(-210, 210), random(-210, 210));
  }
}

void draw() {
  colorMode(RGB);
  background(0);
  
  // draw the stars only when str is true (which is toggled to true when 's' is pressed)
  if (str) drawStars();
  
  // the following rotations happen only when certain keys are pressed, toggling certain boolean
  if (rotateFastest) cam.rotateZ(1); 
  else if (rotateFaster) cam.rotateZ(0.6);
  else if (rotateNormal) cam.rotateZ(0.01);
  
  // mix all the tracks together so the left and right are treated as one
  fft.forward(money.mix);
  fft2.forward(gravity.mix);
  fft3.forward(in.mix);

  noFill();
  colorMode(HSB);

  if (lorenzOn) { // toggled when l is pressed
    lorenz.create(); // 
    
    // will draw the lorenz attractor in point or continuous form based on which boolean is true at the moment
    if (pt) lorenz.pointUpdate();
    else if (cont) lorenz.contUpdate();
  } 
  
  else if (rosslerOn) { // toggled when r is pressed
    rossler.create();
    
    // will draw the rossler attractor in point or continuous form based on which boolean is true at the moment
    if (pt) rossler.pointUpdate();
    else if (cont) rossler.contUpdate();
  }
}

// actually draws the stars
void drawStars() {
  for (int i =0; i<stars.length; i++) {
    // color of the stars will change in greyscale to imitate twinkling, based on what the audio input is
    if (moneyOn) stars[i].col = fft.getBand(i)*60;
    else if (gravityOn) stars[i].col = fft2.getBand(i)*60;
    else if (micOn) stars[i].col = fft3.getBand(i)*60;
    stars[i].create(); 
    stars[i].jitter(); 
  }
}
