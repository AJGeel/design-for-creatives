String[] teams = {"None", "Red", "Blue"};
int teamSelected = 0;
int delayTime = 800;
Boolean questionInProgress = false;
int redScore = 0;
int blueScore = 0;

// Questions and answers taken from Pub Quiz Questions HQ: https://goo.gl/Vj4QhS 
int quizIndex = 0;
String[] abc = {"A", "B", "C"};
String[] quizQuestions = {"Which planet spins fastest?", "Who was the Greek goddess of Love and Beauty?", "Which English striker scored six goals at the 2018 World Cup?", "What open-source computer operating system is Linus Torvalds known for?", "Which of the following defines the term 'raster'?", "The human eye is first drawn to which area?", "Which color space is the most appropriate for full color printing?"};
String[][] quizAnswers = { {"Earth", "Jupiter", "Mars"}, {"Apollo", "Athena", "Aphrodite"}, {"Harry Kane", "Wayne Rooney", "Emile Heskey"}, {"Ubuntu", "Linux", "Android"}, {"A graphic with infinite scalability", "A file with limited colours", "A grid of X and Y coordinates on a display space" }, {"Top left", "Centre", "Bottom left"}, {"Black/White", "RGB", "CMYK"} };
int[] rightAnswer = {1, 2, 0, 1, 2, 0, 2};
int userAnswer = -1;

void setup() {
  size(640, 360);
  clearScreen();
  noStroke();
  rectMode(CENTER);
  println("Welcome to Goose Game Version 0.01 — Please use your token to sign in.");
}

void draw() {
  // keep draw() here to continue looping while waiting for keys
}

void keyPressed() {
  if (key == '1') {
    // Simulates token behaviour: use this to cycle through the different teams
    selectTeam();
    updateScoreOnScreen();
  } else if (key == '2') {
    // Prints the questions and answers of the qurrent quiz index
    printQuizQuestions();
  } else if (key == 'a' || key == 'b' || key == 'c') {
    if (key == 'a') {
      userAnswer = 0;
    } else if (key == 'b') {
      userAnswer = 1;
    } else if (key == 'c') {
      userAnswer = 2;
    } 
    checkAnswer();
  } else {
    println("--DEBUG-- Another key has been pressed: '" + key + "'");
  }
}

void clearScreen() {
  background(0);
}

void selectTeam() {
  if (teamSelected < teams.length-1) {
    teamSelected += 1;
  } else {
    teamSelected = 0;
  }
  if (teamSelected == 0) {
    println("You have successfully logged off.");
    println("");
    background(0);
  } else {
    println("Token recognized. Selected team: " + teams[teamSelected]);
    drawTeamSquare();
  }
}

void drawTeamSquare() {
  if (teamSelected == 1) {
    fill(255, 0, 0);
  } else if (teamSelected == 2) {
    fill(0, 0, 255);
  }
  rect(width/2, height/2, 50, 50);
  rect(width/2, height/2, 10, 10);
}

void updateQuizIndex() {
  if (quizIndex < quizQuestions.length-1) {
    quizIndex += 1;
  } else {
    println("That's all we have today! Thanks for playing.");
    delay(delayTime*10);
    quizIndex = 0;
  }
}

void printQuizQuestions() { 
  if (teamSelected == 0) {
    println("No team selected. Please log in before you summon a question.");
  } else {
    println(quizQuestions[quizIndex]);
    delay(delayTime);
    for (int i=0; i < quizAnswers[0].length; i++) {
      println(abc[i] + ": " + quizAnswers[quizIndex][i]);
      delay(delayTime);
      questionInProgress = true;
    }
  }
}

void checkAnswer() {
  if (questionInProgress) {
    println("");
    if (userAnswer == rightAnswer[quizIndex]) {
      println("You answered '" + key + "'. CORRECT! One point to " + teams[teamSelected]);
      delay(delayTime);
      awardPoints();
      delay(delayTime);

      updateQuizIndex();
      delay(delayTime);
      println("");

      printQuizQuestions();
    } else {
      // don't give points
      println("You answered '" + key + "'. Unfortunately, that's wrong. Try again.");
    }
  }
}

void awardPoints() {
  if (teamSelected == 1) {
    redScore += 1;
    println("Red Team's score: " + redScore);
  } else if (teamSelected == 2) {
    blueScore += 1;
    println("Blue Team's score: " + blueScore);
  }

  updateScoreOnScreen();
}

void updateScoreOnScreen() {
  clearScreen();
  if (teamSelected != 0) {
    drawTeamSquare();
    fill(255, 0, 0);
    text("Team Red: " + redScore, 10, 30);
    fill(0, 0, 255);
    text("Team Blue: " + blueScore, 10, 50);
  }
}
