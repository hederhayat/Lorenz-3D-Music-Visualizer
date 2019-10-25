// Class to draw and update the Lorenz attractor
// code and instructions inspired from Dan Shiffman's YouTube Coding Train tutorial about attractors

class Lorenz {
  // define the variables and constants needed to draw the lorenz attractor
  float x = 0.1;
  float y = 0;
  float z = 0;
  float col = 0;
  ArrayList<PVector> lorenzPoints; // create an array list of vectors to contain x, y, z values
  float sigma = 10;
  float rho = 28;
  float beta = 8/3;

  Lorenz() {
    lorenzPoints = new ArrayList<PVector>(); // initialize Array list
  }
  
  // creates the lorenz attractor based on differential equations (taken from Wikipedia) 
  void create() {

    float dt = 0.01;
    float dx = (sigma*(y-x)) * dt;
    float dy = (x*(rho-z)-y) * dt;
    float dz = (x*y - beta*z) * dt;
    
    // to update the values of x,y,z
    x += dx;
    y += dy;
    z += dz;

    lorenzPoints.add(new PVector(x, y, z)); // add each vector point to the array list
  }
  
  //makes the attractor in point form
  void pointUpdate() {
    // the color of the attractor points changes based on the amplitude of the frequency bands in the audio, based on
    // what is playing (based on what boolean is currently switched on)
    for (int i = 0; i < lorenzPoints.size(); i++) {
      if (moneyOn) col = fft.getBand(i/8)*60; // multiplied by 60 so the effect can show, otherwise too little
      else if (gravityOn) col = fft2.getBand(i/8)*60;
      else if (micOn) col = fft3.getBand(i/8)*60;
      stroke(col, 255, 255);
      strokeWeight(3);
      point(lorenzPoints.get(i).x, lorenzPoints.get(i).y, lorenzPoints.get(i).z); // draws the points
    }
  }
  // makes the attractor in continuous form
  void contUpdate() {
    beginShape();
    for (int i = 0; i < lorenzPoints.size(); i++) {
      if (moneyOn) col = fft.getBand(i/8)*60;
      else if (gravityOn) col = fft2.getBand(i/8)*60;
      else if (micOn) col = fft3.getBand(i/8)*60;
      stroke(col, 255, 255);
      strokeWeight(3);
      vertex(lorenzPoints.get(i).x, lorenzPoints.get(i).y, lorenzPoints.get(i).z);
    }
    endShape();
  }
}
