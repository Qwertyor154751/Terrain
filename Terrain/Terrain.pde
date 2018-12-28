int cols;
int rows;
int w = 1800;
int h = 2000;
int scale = 20;
float[][] terrain;
float xoff = 0,yoff = 0;
float fly;
void setup()
{
 size(600,600,P3D);
 cols = w / scale;
 rows = h / scale;
 terrain = new float[cols][rows];
 yoff=0;
 for (int y = 0; y < rows; y++)
  {
    xoff=0;
    for (int x = 0; x < cols; x++)
    {
      terrain[x][y] = map(noise(xoff,yoff),0,1,-100,100);
      //terrain[x][y] = random(-100,100);
      xoff+=0.1;
    }
    yoff+=0.1;
  }
}

void draw()
{
  fly -=0.025;
  yoff = fly;
   //yoff=0;
 for (int y = 0; y < rows; y++)
  {
    xoff=0;
    for (int x = 0; x < cols; x++)
    {
      terrain[x][y] = map(noise(xoff,yoff),0,1,-150,150);
      //terrain[x][y] = random(-100,100);
      xoff+=0.045;
    }
    yoff+=0.045;
  }
  lights();
  background(0);
  //stroke(255);
   noStroke();
   fill(151);
   translate(width/2,height/2+50);
   rotateX(PI/3+PI*1.5/12);
   translate(-w/2,-h/2,-50);
   for (int y = 0; y < rows-1; y++)
  {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++)
    {
       
        vertex(x*scale,y*scale,terrain[x][y]);
        vertex(x*scale,(y+1)*scale,terrain[x][y+1]);
    }
    endShape();
  }
}
