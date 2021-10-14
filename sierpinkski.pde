
class sierpinski{
  PVector leftPoint, rightPoint, topPoint;
  int generation;
  sierpinski[] children;
  sierpinski(PVector p1,PVector p2,PVector p3, int generation){
   this.leftPoint = p1.copy();
   this.rightPoint = p2.copy();
   this.topPoint = p3.copy();
   this.generation = generation;
   if(generation <= generationCap){
     this.generateChildSierpinskis();
   }
  }
  void show(){
    strokeWeight(1);
    line(leftPoint.x,leftPoint.y,rightPoint.x,rightPoint.y);
    line(rightPoint.x,rightPoint.y,topPoint.x,topPoint.y);
    line(topPoint.x,topPoint.y,leftPoint.x,leftPoint.y);
    
    strokeWeight(3);
    if(generation <= generationCap){
      children[0].show();
      children[1].show();
      children[2].show();
    }
    
  }
  void generateChildSierpinskis(){
    children = new sierpinski[3];
    PVector leftMidpoint = findMidpoint(leftPoint, topPoint);
    PVector bottomMidpoint  = findMidpoint(leftPoint, rightPoint);
    PVector rightMidpoint = findMidpoint(rightPoint, topPoint);
    children[0] = new sierpinski(leftPoint,bottomMidpoint,leftMidpoint, generation + 1);
    children[1] = new sierpinski(bottomMidpoint,rightPoint, rightMidpoint, generation + 1);
    children[2] = new sierpinski(leftMidpoint,rightMidpoint, topPoint, generation + 1);
  }
  
  PVector findMidpoint(PVector p1, PVector p2){
    float xStart = min(p1.x,p2.x);
    float yStart = min(p1.y,p2.y);
    float newX = abs(p1.x - p2.x)/2 + xStart;
    float newY = abs(p1.y - p2.y)/2 + yStart;
    return new PVector(newX,newY);
  }
}
