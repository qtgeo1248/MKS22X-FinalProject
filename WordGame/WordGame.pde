Soup a ;
Crossword test ;

void setup() {
  size(400, 800) ;
  background(255) ;
  // soup bowl design added here
  a = new Soup("PHLOEM", false, 1) ;
  test = new Crossword(new ArrayList<String>(), true);
}

void draw() {
  /*Level test = new Level("speak");
   ArrayList<String> tester = test.getAllPossWords();
   for (int i = 0; i < tester.size(); i++) {
   text(tester.get(i), 0, 15 * i + 20);
   } */
  // Soup displaying
  a.display() ;
  println("X-coordinate: " + mouseX) ;
  println("Y-coordinate: " + mouseY) ;
  println("Mouse over letter?: " + (a.contains(a.positions[0], mouseX) != -1 && a.contains(a.positions[1], mouseY) != -1)) ;
  println("Mouse over Shuffle button?: " + overShuff()) ;
  // Crossword displaying
  test.display() ;
  Level test = new Level("speak") ;
  for (int i = 0; i < test.getAllPossWords().size(); i++) {
    text(test.getAllPossWords().get(i), 10, 50 + 20 * i);
  }
}

boolean overShuff() {
  // returns whether the mouse is over the shuffle button
  return mouseX >= 20 && mouseX <= 77 && mouseY >= 420 && mouseY <= 480 ;
}

void mousePressed() {
  if (overShuff()) {
    a.shuffle(6) ;
  } 
  else {
    int xpos = a.contains(a.positions[0], mouseX) ;
    int ypos = a.contains(a.positions[1], mouseY) ;
    if (xpos != -1 && ypos != -1) {
      // this means that the mouse is on a letter or within a reasonable range of a letter
      if (a.chosen[xpos]) {
        // this means that the user is UNSELECTING the letter because it was previously chosen!
        a.chosen[xpos] = false ;
      } else {
        // this letter was not chosen/selected so we need to change that!
        a.chosen[xpos] = true ; // this helps us identify and keep track of the chosen letter
      }
      //fill(255,255,15) ;
      //ellipse(mouseX,mouseY,50,50) ;
    }
  }
}