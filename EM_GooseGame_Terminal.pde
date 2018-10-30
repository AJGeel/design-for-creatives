int rectWidth;
String[] teams = {"None", "Red", "Blue"};
int teamSelected = 0;
int delayTime = 800;
Boolean questionInProgress = false;
int[] teamScores = {0, 0};

void setup() {
  size(640, 360);
  background(0);
  println("Welcome to Goose Game V0. Please use your token to sign in.");
  
  //println("Team red's score: " + teamScores[0]);
  

}

void draw() {
  // keep draw() here to continue looping while waiting for keys
}

void keyPressed() {
  if (key == '1') {
    if (teamSelected < teams.length-1) {
      teamSelected += 1;
    } else {
      teamSelected = 0;
    }
    //println(teamSelected);
    println("Token recognized. Selected team: " + teams[teamSelected]);
  } else if (key == '2') {
    if (teamSelected != 0) {
       println("");
       println("Question: 'What is the name word for an anxiety that appears when one sees an empty beer glass?'");
       questionInProgress = true;
       delay(delayTime);
       println("A: 'Nomophobia'"); delay(delayTime);
       println("B: 'Cenosillicaphobia'"); delay(delayTime);
       println("C: 'Phobophobia'");
    } else {
      println("No team has been selected. Therefore, I won't give you a question.");
    }
    
  } else if (key == 'a' || key == 'b' || key == 'c'){
    if (questionInProgress == true) {
      println("");
      if (key == 'a' || key == 'c'){
        println("WRONG ANSWER.");
      } else {
        println("CORRECT! One point to " + teams[teamSelected]);
        teamScores[teamSelected] += 1;
        delay(delayTime);
        println("Team " + teams[teamSelected] + "'s score: " + teamScores[teamSelected]);
        questionInProgress = false;
      }
    } else {
      println("No question is currently open. Press '2' to summon a new question.");
    }
  } else {
  
  println("--DEBUG-- Another key has been pressed: '" + key + "'");
  }
}
