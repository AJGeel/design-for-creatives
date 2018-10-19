// Arthur Geel, 19-10-2018.
// Prototype for a dynamic quiz, to be used in the 'Goose Game' concept for Eindhoven Museum.

int displayWidth = 800;
int displayHeight = 500;
int xCenter = displayWidth/2;
int yCenter = displayHeight/2;
int padding = 50;
PFont futura;
PFont futuraSmall;

// Colours used in this sketch
color emOrange = color(244, 65, 0);
color emBlack = color(0, 0, 0);
color emGray1 = color(20, 20, 20);
color emGray2 = color(100, 100, 100);
color emGray3 = color(200, 200, 200);
color emWhite = color(255, 255, 255);

void setup(){
  size(displayWidth, displayHeight);
  background(emWhite);
  noStroke();
  smooth();
  
  // Fonts used in this sketch
  futura = createFont("Futura-Bold", 50);
  futuraSmall = createFont("Futura-Bold", 24);
  
  int oneThird = (displayWidth-padding)/3;
  
  // Initialize button styling
  rectMode(CENTER);  
  fill(emGray3);
  rect(xCenter, displayHeight-60, oneThird, 100);
  rect(xCenter - (oneThird + padding/4), displayHeight-60, oneThird, 100);
  rect(xCenter + (oneThird + padding/4), displayHeight-60, oneThird, 100);

  // Initialize button text styling
  fill(emWhite);
  textAlign(CENTER);
  textFont(futura);
  
  text("A", xCenter - (oneThird + padding/4), displayHeight-40);
  text("B", xCenter, displayHeight-40);
  text("C", xCenter + (oneThird + padding/4), displayHeight-40);
  
  // Initialize question and answer text styling
  fill(emGray1);
  textFont(futuraSmall);
  text("What does 'TU/e' stand for in our circles?", xCenter, 50+25);
  
  fill(emGray2);
  text("A: Typography United, Eh?", xCenter, 150+25);
  text("B: Technische Universiteit Eindhoven", xCenter, 200+25);
  text("C: Traité sur l'Union Européenne", xCenter, 250+25);

}
