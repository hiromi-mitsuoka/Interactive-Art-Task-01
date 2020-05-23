int rippleNum = 25;
float[] rippleAlpha = new float[rippleNum];
float[] radius = new float[rippleNum];
float[] x = new float[rippleNum];
float[] y = new float[rippleNum];


void setup() {
  size(500, 500);
  //blendMode(ADD);
  setRipple();
}

void draw() {
  noStroke();
  blendMode(BLEND);
  color c1 = color(1, 39, 83);
  color c2 = color(141, 153, 172);
  for (float h=0; h<height; h++) {
    color c = lerpColor(c2, c1, h/height);
    fill(c, 200);
    rect(0, h, width, 1);
  }
  smooth();
  drawRipple();
}

void setRipple() {
  for (int i=0; i<rippleNum; i++) {
    x[i] = random(width);
    y[i] = random(height);
    radius[i] = random(1, 100);
    rippleAlpha[i] = random(50, 200);
  }
}


void drawRipple() {
  for (int i=0; i<rippleNum; i++) {
    noFill();
    blendMode(ADD);
    stroke(255, rippleAlpha[i]);
    circle(x[i], y[i], radius[i]);
    radius[i]++;
    rippleAlpha[i]--;
    if (rippleAlpha[i]<0) {
      radius[i] = random(1, 10);
      rippleAlpha[i] = random(50, 200);
    }
  }
}
