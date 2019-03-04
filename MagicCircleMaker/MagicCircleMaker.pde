int points = 6;
float factor = 3;
float r;
enum key {UP,DOWN,LEFT,RIGHT};

void setup()
{
  size(760,760);
  r = width/2 - 72;
}

PVector getVector(float angle, float rad)
{
  angle -= PI/2;
  float x = rad * cos(angle);
  float y = rad * sin(angle);
  PVector v = new PVector(x, y);  
  return v;
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      points += 1;
    }
    if (keyCode == DOWN)
    {
      points -= 1;
    }
    if (keyCode == RIGHT)
    {
      factor += 1;
    }
    if (keyCode == LEFT)
    {
      factor -= 1;
    }
  }
}

void draw()
{
  background(0);
  float oX = width/2;
  float oY = height/2;
  translate(oX, oY);
  stroke(255);
  strokeWeight(4);
  float delta = TWO_PI / points;
  
  noFill();
  circle(0, 0, (r-20)*2);
  circle(0, 0, (r+20)*2);
  
  for (int i = 0; i < points; i++)
  {
    float angleA = delta * i;
    float angleB = delta * (i + factor);
    PVector a = getVector(angleA, r);
    PVector b = getVector(angleB, r);
    
    line (a.x, a.y, b.x, b.y);
  }
  
    for (int i = 0; i < points; i++)
  {
    float angle = delta * i;
    PVector point = getVector(angle, r);
    
    fill(255);
    circle(point.x, point.y, 100);
    
    fill(0);
    circle(point.x, point.y, 100);
  }
}
