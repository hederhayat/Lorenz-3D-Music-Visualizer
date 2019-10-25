// Class to draw stars

class Star {
  float x, y, z;
  float size = 1;
  float col = 0;
  
  Star(float x0, float y0, float z0){
    x = x0;
    y = y0;
    z = z0;
  }
  
  // draw the spheres based on the x,y,z locations
  void create(){
    pushMatrix();
    translate(x,y,z);
    noStroke();
    fill(col);
    sphere(size);
    popMatrix();
  }
  void jitter(){
    // makes the stars jitter around 
    x += random(-0.2,0.2);
    y += random(-0.2,0.2);
    z += random(-0.2,0.2);
  }
}
