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
  background(255) ;
  /*Level test = new Level("speak");
   ArrayList<String> tester = test.getAllPossWords();
   for (int i = 0; i < tester.size(); i++) {
   text(tester.get(i), 0, 15 * i + 20);
   } */
  // Soup displaying
  a.display() ;
  //println("X-coordinate: " + mouseX) ;
  //println("Y-coordinate: " + mouseY) ;
  //println("Mouse over letter?: " + (a.checkForCoordinate()[0] != -1 && a.checkForCoordinate()[1] != -1)) ;
  //println("Mouse over Shuffle button?: " + overShuff()) ;
  //println("Mouse over Submit button? " + overSub()) ;
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

boolean overSub() {
  // returns whether the mouse is over the submit button
  //println("WOOHOO SUBMIT BUTTON DETECTED!") ;
  return mouseX >= 320 && mouseX <= 380 && mouseY >= 420 && mouseY <= 480 ;
}

void mousePressed() {
  if (overShuff()) {
    a.shuffle(6) ; // 6 is just for now because of the word length
    for (int i = 0 ; i < a.chosen.length ; i++) {
      // reassures that no chosen letters will have a circle on them after shuffling 
      a.chosen[i] = false ;
      a.wordBeingMade.clear() ;
    }
  } 
  ////////////////////////////////////////////////////////////////////////////////
  else if (overSub()) {
    println("The mouse is over the submit button") ;
    println(a.wordBeingMade.toString()) ;
    // this means that the user has hit the submit button
    if (a.wordBeingMade.size() >= 3) {
      if (a.ll.findAllDictWords(6).contains(a.makeWordFromChosenLetters())) {
        // if the dictionary has found the word that the user created, then we do thisss
        println("WOOHOO WE HAVE A WORD: " + a.makeWordFromChosenLetters()) ;
        println("Length of word: " + a.wordBeingMade.size()) ;
        a.wordBeingMade.clear() ; // after the user has made the word we just clear it from the array list
        // might need to remove or clear the array list keeping track of the letters/word being made
        for (int i = 0 ; i < a.chosen.length ; i++) {
          // reassures that no chosen letters will have a circle on them after shuffling 
          a.chosen[i] = false ;
          a.wordBeingMade.clear() ;
        }
        background(255) ;
      }
    }
    else {
      //println("You have not chosen enough letters") ;
    }
  }
  ////////////////////////////////////////////////////////////////////////////////
  else {
    int xpos = a.checkForCoordinate()[0] ;
    int ypos = a.checkForCoordinate()[1] ;
    if (xpos != -1 && ypos != -1) {
      // this means that the mouse is on a letter or within a reasonable range of a letter
      if (a.chosen[xpos]) {
        // this means that the user is UNSELECTING the letter because it was previously chosen!
        a.chosen[xpos] = false ;
        a.wordBeingMade.remove(a.letters.get(xpos)) ; // adds the letter to the arraylist that's keeping track of the letters that the user has selected
      } else {
        // this letter was not chosen/selected so we need to change that! //<>//
        a.chosen[xpos] = true ; // this helps us identify and keep track of the chosen letter
        a.wordBeingMade.add(a.letters.get(xpos)) ;
      }
    }
  }
  //println(a.wordBeingMade.toString()) ;
}
