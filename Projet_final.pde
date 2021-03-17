
// Coordonnées + vitesse de la balle
  float x = 960 + int(random(-500,500)); 
  int y = 350; 
  float speedx = 6;
  int speedy = -6;
  
// Coordonnées + taille du paddle
  int paddlex = 960, paddley = 1000;
  int paddle_width = 200;
  int paddle_height = 20;
  
// Autres variables
  int score = 0;
  int level = 1;
  int wait = 0;
  int ligne = 3;
  int nmb = 16;
  int regen = 5;
  int xbricks;
  int ybricks;
  int i;
  int[] bricks = new int[160];
  
void setup() {
  size(displayWidth,displayHeight);
  rectMode(CENTER);
  
  for (i=0; i<nmb; i++) {
  bricks[i] = 1;
  }
  
}

void draw() {
  int i, x_tmp, y_tmp;
  int blocks_gone;
  
// Réglage des positions + background
  background(0,0,0);
  textSize((width*height)/100000);
  textAlign(RIGHT);
  text("Score", 140, height-110);
  textAlign(LEFT);
  text(score, 150, height-110);
  textAlign(RIGHT);
  text("Level", width-100, height-110);
  textAlign(LEFT);
  text(level, width-90, height-110);


// Réglage des couleurs + le game over
  fill(255,255,255);
  ellipse(x, y, 10, 10);
  fill(255,255,255);
  rect(paddlex, paddley, paddle_width+1, paddle_height);
  fill(255,255,255);
  if (y>height) {
    textSize((width*height)/30000);
    textAlign(CENTER);
    text("Game over", width/2, height/2);
  }
  

  
  
// Évolution de la position de la balle + colision murs
  x = x + speedx;
  y = y + speedy;
  if (x>width || x<0)  
    speedx = -speedx;
  if (y<0)
    speedy = -speedy;


// Contrôles (souris+tactile)
  if (mousePressed) {
    if (mouseX > paddlex) {
      paddlex = paddlex + 8;   
    } 
    
    else if (mouseX < paddlex) {
      paddlex = paddlex - 8;
    }
  }


// Collision balle avec le paddle (direction de la balle)
  if ((paddlex-paddle_width/2)<x && (paddlex+paddle_width/2)>x && 
    (paddley-10)<y && (paddley+10)>y) {
    if ((paddlex-paddle_width/20*10)<x && (paddlex-paddle_width/20*9)>x) {
      speedx = -5; }
    if ((paddlex-paddle_width/20*9)<x && (paddlex-paddle_width/20*8)>x) {
      speedx = -4.5; }
    if ((paddlex-paddle_width/20*8)<x && (paddlex-paddle_width/20*7)>x) {
      speedx = -4; }
    if ((paddlex-paddle_width/20*7)<x && (paddlex-paddle_width/20*6)>x) {
      speedx = -3.5; }
    if ((paddlex-paddle_width/20*6)<x && (paddlex-paddle_width/20*5)>x) {
      speedx = -3; }
    if ((paddlex-paddle_width/20*5)<x && (paddlex-paddle_width/20*4)>x) {
      speedx = -2.5; }
    if ((paddlex-paddle_width/20*4)<x && (paddlex-paddle_width/20*3)>x) {
      speedx = -2; }
    if ((paddlex-paddle_width/20*3)<x && (paddlex-paddle_width/20*2)>x) {
      speedx = -1.5; }
    if ((paddlex-paddle_width/20*2)<x && (paddlex-paddle_width/20*1)>x) {
      speedx = -1; }
    if ((paddlex-paddle_width/20*1)<x && (paddlex-0)>x) {
      speedx = -0.5; }
    if ((paddlex+0)<x && (paddlex+paddle_width/20*1)>x) {
      speedx = 0.5; }
    if ((paddlex+paddle_width/20*1)<x && (paddlex+paddle_width/20*2)>x) {
      speedx = 1; }
    if ((paddlex+paddle_width/20*2)<x && (paddlex+paddle_width/20*3)>x) {
      speedx = 1.5; }
    if ((paddlex+paddle_width/20*3)<x && (paddlex+paddle_width/20*4)>x) {
      speedx = 2; }
    if ((paddlex+paddle_width/20*4)<x && (paddlex+paddle_width/20*5)>x) {
      speedx = 2.5; }
    if ((paddlex+paddle_width/20*5)<x && (paddlex+paddle_width/20*6)>x) {
      speedx = 3; }
    if ((paddlex+paddle_width/20*6)<x && (paddlex+paddle_width/20*7)>x) {
      speedx = 3.5; }
    if ((paddlex+paddle_width/20*7)<x && (paddlex+paddle_width/20*8)>x) {
      speedx = 4; }
    if ((paddlex+paddle_width/20*8)<x && (paddlex+paddle_width/20*9)>x) {
      speedx = 4.5; }
    if ((paddlex+paddle_width/20*9)<x && (paddlex+paddle_width/20*10)>x) {
      speedx = 5; }
    speedy = -speedy;
    if (regen>int(random(0,100))) { // Regénération des briques
      bricks[int(random(0,nmb-1))] = 1;
     }
    }
      blocks_gone = 1;
  
  
// Mise en place des briques
  for (i=0; i<nmb; i++) {
  
    x_tmp = i%16*120+15; 
    y_tmp = 40*(i/16)+15; 
    
    if (bricks[i]==1) { 
      
      rect(x_tmp+40, y_tmp+10, 100, 20);
  
      blocks_gone = 0;
    }
    
    
// Collision balle avec les briques
    if (x>(x_tmp+4) && x<(x_tmp+76) &&
      y>y_tmp && y<(y_tmp+20) && bricks[i]==1) { 
      bricks[i]=0;
      speedy = -speedy;
      score = score + 5;
    }
    
    if (((x>(x_tmp-10) && x<x_tmp) || (x>(x_tmp+90) && x<(x_tmp+95))) &&
      y>y_tmp && y<(y_tmp+30) && bricks[i]==1) { 
      bricks[i]=0;
      speedx = -speedx;
      score = score + 5;
    }
    
    if (((x>(x_tmp-1) && x<(x_tmp+5)) || (x>(x_tmp+75) && x<(x_tmp+81))) &&
      y>y_tmp && y<(y_tmp+20) && bricks[i]==1) { 
      bricks[i]=0;
      speedx = -speedx;
      speedy = -speedy;
      score = score + 5;
    }
  }
  

// Passage au niveau suivant
  if (blocks_gone==1 && wait<200) {
    textSize((width*height)/30000);
    textAlign(CENTER);
    text("Well Done,Level Cleared", 960, 560);
    textSize((width*height)/50000);
    text("Preparing next Level...", 960, 500);
    x = 250;
    y = 350;
    speedx = 0;
    speedy = 0;
    wait++;
    if (wait==200) {
      wait = 0;
      x = 960 + int(random(-500,500));;
      y = 350;
      speedx += 1;
      nmb += 16;
      regen += 5;
      paddlex = 960;
      level++;
    for (i=0; i<nmb; i++) {
     bricks[i] = 1;
    }


    }
  }
}
