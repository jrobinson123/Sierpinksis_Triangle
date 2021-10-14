
sierpinski Sierpinski;
int generationCap;
void setup(){
  size(600,600);
  generationCap = 6;
  Sierpinski = new sierpinski(new PVector(100,400), new PVector(500,400), new PVector(300,400 - sqrt(3)*200),1);
}

void draw(){
  background(200);
  Sierpinski.show();
}
