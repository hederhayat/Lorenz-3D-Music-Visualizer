// Class to draw and update the Rossler attractor
// code and instructions inspired from Dan Shiffman's YouTube Coding Train tutorial about attractors

class Rossler {
  // define the variables and constants needed to draw the rossler attractor
  float x = 4;
  float y = 4;
  float z = 4;
  float col = 0;
  ArrayList<PVector> rosslerPoints; // create an array list of vectors to contain x, y, z values
  float a = 0.2;
  float b = 0.2;
  float c = 5.7;

  Rossler() {
    rosslerPoints = new ArrayList<PVector>();
  }

  // creates the rossler attractor based on differential equations (taken from Wikipedia) 
  void create() {

    float dt = 0.03;
    float dx = (-y - z) * dt;
    float dy = (x + a*y) * dt;
    float dz = (b + z*(x - c)) * dt;
    
    // update values of x,y,z
    x += dx;
    y += dy;
    z += dz;

    rosslerPoints.add(new PVector(x, y, z)); // add each point to the array list
    scale(1.5); // scale it up a little so the size isn't too small
  }
  
  // makes the attractor in point form
  void pointUpdate() {
    // the color of the attractor points changes based on the amplitude of the frequency bands in the audio, based on
    // what is playing (based on what boolean is currently switched on)
    for (int i = 0; i < rosslerPoints.size(); i++) {
      if (moneyOn) col = fft.getBand(i/8)*60; // multipled by 60 just like in Lorenz
      else if (gravityOn) col = fft2.getBand(i/8)*60;
      else if (micOn) col = fft3.getBand(i/8)*60;
      stroke(col, 255, 255);
      strokeWeight(3);
      point(rosslerPoints.get(i).x, rosslerPoints.get(i).y, rosslerPoints.get(i).z); // draws the points
    }
  }
  
  // makes the attractor in continuous form
  void contUpdate() {
    beginShape();
    for (int i = 0; i < rosslerPoints.size(); i++) {
      if (moneyOn) col = fft.getBand(i/8)*60;
      else if (gravityOn) col = fft2.getBand(i/8)*60;
      else if (micOn) col = fft3.getBand(i/8)*60;
      stroke(col, 255, 255);
      strokeWeight(3);
      vertex(rosslerPoints.get(i).x, rosslerPoints.get(i).y, rosslerPoints.get(i).z);
    }
    endShape();
  }
}
