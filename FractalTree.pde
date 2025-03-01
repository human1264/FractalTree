private double fractionLength = .9; 
private int smallestBranch = 50; 
private double branchAngle = .2;  
private double insanity = 0;
public void setup() 
{   
  size(800,800);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  line(400,600,400,560);   
  drawBranches(400,560,100,1.57+3.14);
  //drawBranches(300,560,100,3.14);
} 

void mouseClicked(){
redraw();
}
void keyPressed(){

if (insanity == 1){insanity--;}
else {insanity = 1;}
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
 double angle1 = angle + branchAngle;    
 double angle2 = angle - branchAngle;
 int endX1 = (int)(branchLength*Math.cos(angle1) * (Math.random() * 2 - insanity) + x);
 int endY1 = (int)(branchLength*Math.sin(angle1) * (Math.random() * 2 - insanity) + y);
 int endX2 = (int)(branchLength*Math.cos(angle2) * (Math.random() * 2 - insanity) + x);
 int endY2 = (int)(branchLength*Math.sin(angle2) * (Math.random() * 2 - insanity) + y);
 if(branchLength < smallestBranch){
 line(x,y,endX1,endY1);
 line(x,y,endX2,endY2);}
 else{
 line(x,y,endX1,endY1);
 line(x,y,endX2,endY2);
 drawBranches(endX1,endY1,branchLength*fractionLength,angle1);
 drawBranches(endX2,endY2,branchLength*fractionLength,angle2);
 }
 
} 
