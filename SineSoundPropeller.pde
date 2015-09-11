Maxim maxim;
AudioPlayer tune;
// float[] spec;
float power;
float speed;

int nl = 25;
float sy;
float iy;
float sh;
float ih;
float se;
float ie;
float sb;
float ib;
float counter;
// float col; 

void setup() {
  size(500, 500);
  maxim = new Maxim(this);
  tune = maxim.loadFile("beatmatch.wav");
  tune.setLooping(true);
  tune.setAnalysing(true);
  // colorMode(HSB);
}

void draw() {
  tune.play();
  tune.speed(speed);
  /*spec = tune.getPowerSpectrum();
  for (int i = 0; i < spec.length; i++) {
    col = spec[i];
  }*/
  power = tune.getAveragePower();
  // println(power);
  background(0);
  sy = map(power+1, 0.5, 1.5, 5, 50);
  iy = 100*sin(sy);
  se = map(power+1, 0.5, 1.5, 0, TWO_PI);
  ie = 100*sin(se);
  sb = map(power+1, 1.5, 0.5, 0, TWO_PI);
  ib = 100*sin(sb);
  translate(width/2, height/2);
  rotate(counter*TWO_PI/360);
  for (int i = -nl+1; i < nl; i++) {
   // col = map(i, -nl, nl, 0, 256);
    ih = i;
    sh = map(ih, -nl+1, nl-1, 0, TWO_PI);
    stroke(255);
    strokeWeight(5);
    line(i*10, 0, i*10, 0-2*sin(sh)*sy);
    ellipseMode(CENTER);
    noStroke();
    fill(255, 0, 0);
    ellipse(i*10, 0-50*sin(sh)-ie, 5, 5);
    ellipseMode(CENTER);
    noStroke();
    fill(255, 0, 0);
    ellipse(i*10, 0-50*sin(sh)-ib, 5, 5);
  }
  counter++;
  counter = counter+speed*2;
}

void mousePressed() {
  speed = map(mouseX, 0, width, 0, 2);
}
