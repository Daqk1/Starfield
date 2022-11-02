class Bubble {
  double myX, myY, mySpeed, myAngle;
  int myColor, mySize, time;
  int chance = (int)(Math.random()*6) + 1;
  double dieX, dieY;
  int amount, speed; 
  Bubble() {
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = (int)(Math.random()*20)+10;
    mySpeed = (int)(Math.random()*11);
    myAngle =(double)(Math.random()*10)*Math.PI;
    myX = 500;
    myY = 500;
    speed = 10;
  }
  Bubble(int x, int y) {
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize = (int)(Math.random()*20)+10;
    dieX = x;
    dieY = y;
    myY = x;
    myX = y;

    mySpeed =(Math.random()*11);
    myAngle =(float)(Math.random()*3)*Math.PI;
  }
  void rise() {
    dieX += (Math.cos(myAngle))*mySpeed;
    dieY += (Math.sin(myAngle))*mySpeed;
    time += speed;
    if (time > 1250) {
      dieY -= ((Math.sin(myAngle))*mySpeed)*2;
      dieX -= (Math.cos(myAngle))*mySpeed*2;
      chance = (int)(Math.random()*6) + 1;
    }
    if (dieX > 1500) {
      dieX = 500;
      chance = (int)(Math.random()*6) + 1;
    }
    if (dieY > 1500) {
      dieY = 500;
      chance = (int)(Math.random()*6) + 1;
    }
    if (dieX < -1500) {
      dieX = 500;
      chance = (int)(Math.random()*6) + 1;
    }
    if (dieY < -1500) {
      dieY = 500;
      chance = (int)(Math.random()*6) + 1;
    }
    myX = myX + (int)(Math.random()*5)-1;
    myX = myX + (int)(Math.random()*5)-3;
    myY = myY + (int)(Math.random()*5)-1;
    myY = myY + (int)(Math.random()*5)-3;
  }

  void roll() {
    chance = (int)(Math.random()*6) + 1;
    amount = chance;
  }

  void show() {
    fill(myColor);
    stroke(10);
    rect((float)myX, (float)myY, mySize, mySize);
    fill(255);
    rect((float)dieX, (float)dieY, 50, 50);
    fill(0);
    if (amount == 1) {
      ellipse((float)dieX+25, (float)dieY+25, 10, 10);
    } else if (amount == 2) {
      ellipse((float)dieX+40, (float)dieY+40, 10, 10);
      ellipse((float)dieX+10, (float) dieY+10, 10, 10);
    } else if (amount == 3) {
      ellipse((float)dieX+10, (float)dieY+40, 10, 10);
      ellipse((float)dieX+25, (float) dieY+25, 10, 10);
      ellipse((float)dieX+40, (float)dieY+10, 10, 10);
    } else  if (amount == 4) {
      ellipse((float)dieX+10, (float) dieY+10, 10, 10);
      ellipse((float)dieX+10, (float) dieY+40, 10, 10);
      ellipse((float)dieX+40, (float)dieY+10, 10, 10);
      ellipse((float)dieX+40, (float)dieY+40, 10, 10);
    } else if (amount == 5) {
      ellipse((float)dieX+10, (float) dieY+10, 10, 10);
      ellipse((float)dieX+10, (float)dieY+40, 10, 10);
      ellipse((float)dieX+25, (float)dieY+25, 10, 10);
      ellipse((float)dieX+40, (float) dieY+10, 10, 10);
      ellipse((float)dieX+40, (float)dieY+40, 10, 10);
    } else if (amount == 6) {
      ellipse((float)dieX+10, (float)dieY+10, 10, 10);
      ellipse((float)dieX+10, (float) dieY+25, 10, 10);
      ellipse((float)dieX+10, (float)dieY+40, 10, 10);
      ellipse((float)dieX+40, (float)dieY+10, 10, 10);
      ellipse((float)dieX+40, (float)dieY+25, 10, 10);
      ellipse((float)dieX+40, (float)dieY+40, 10, 10);
    }
  }
}

class Die extends Bubble {
  Die() { 
    dieX = 500;
    dieY = 500;
  }
}

Bubble [] bubs = new Bubble[500];
void setup() {
  size(1000, 1000);
  noStroke();
  for (int i =0; i < bubs.length; i++) {
    bubs[i] = new Bubble(500, 500);
  }
  for (int i = 0; i < 250; i++) {
    bubs[i] = new Die();
  }
  for (int i = 0; i<  bubs.length; i++) {
    bubs[i].roll();
  }
}
void draw() {
  background(0);
  for (int i = 0; i < bubs.length; i++) {
    bubs[i].rise();
    bubs[i].show();
  }
}
