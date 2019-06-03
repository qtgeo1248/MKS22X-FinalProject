Soup a ;
Crossword test ;

void setup() {
  size(400, 800) ;
  background(255) ;
  // soup bowl design added here
  Soup a = new Soup("PHLOEM",false, 1) ;
  a.display() ;
  Level tester = new Level("SPEAK");
  ArrayList<String> words = tester.getAllPossWords();
  textSize(20);
  Crossword test = new Crossword(words, false);
  test.checkUnfoundedWord("SPEAK");
  test.display();
}

void draw() {
  //background(255) ;
  // Soup displaying
  //a.display() ; put back later
  //println("X-coordinate: " + mouseX) ;
  //println("Y-coordinate: " + mouseY) ;
  //println("Mouse over letter?: " + (a.checkForCoordinate()[0] != -1 && a.checkForCoordinate()[1] != -1)) ;
  //println("Mouse over Shuffle button?: " + overShuff()) ;
  // Crossword displaying
}

boolean overShuff() {
  // returns whether the mouse is over the shuffle button
  return mouseX >= 20 && mouseX <= 77 && mouseY >= 420 && mouseY <= 480 ;
}

void mousePressed() {
  if (overShuff()) {
    a.shuffle(6) ; // 6 is just for now because of the word length
    for (int i = 0 ; i < a.chosen.length ; i++) {
      a.chosen[i] = false ;
      // reassures that no chosen letters will have a circle on them after shuffling 
    }
  } 
  else {
    int xpos = a.checkForCoordinate()[0] ;
    int ypos = a.checkForCoordinate()[1] ;
    if (xpos != -1 && ypos != -1) {
      // this means that the mouse is on a letter or within a reasonable range of a letter
      if (a.chosen[xpos]) {
        // this means that the user is UNSELECTING the letter because it was previously chosen!
        a.chosen[xpos] = false ;
      } else {
        // this letter was not chosen/selected so we need to change that!
        a.chosen[xpos] = true ; // this helps us identify and keep track of the chosen letter
      }
    }
  }
}
