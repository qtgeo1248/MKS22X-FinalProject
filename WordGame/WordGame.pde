Soup a ;
Crossword test ;
int lev ;
String ww ;

void setup() {
  size(400, 800) ;
  background(255) ;
  // soup bowl design added here
  lev = 1 ;
  ww = "SPEAK" ;
  Level le = new Level(ww) ;
  //println(le.getAllPossWords()) ;
  test = new Crossword(le.getAllPossWords(), true) ;
  a = new Soup(ww, true, lev) ;
}

void draw() {
  background(255) ;
  // Soup displaying
  // Crossword displaying
  test.display() ;
  a.display() ;
  String wooo = "" ;
  for (int i = 0 ; i < a.wordBeingMade.size() ; i++) {
    wooo += (a.wordBeingMade.get(i)) ;
  }
  fill(0) ;
  textAlign(CENTER) ;
  textSize(20) ;
  text(wooo,150, 345) ;
  /* pseudo-code
  if (all the words have been found for this level) {
    *we must clear the screen
    *we must increase lev (variable) by 1
    *we must create a new instance of soup that has the updated lev
    *we do the same process that we did for the previous level
  }
  */
}

boolean overShuff() {
  // returns whether the mouse is over the shuffle button
  return mouseX >= 20 && mouseX <= 77 && mouseY >= 440 && mouseY <= 500 ;
}

boolean overSub() {
  // returns whether the mouse is over the submit button
  //println("WOOHOO SUBMIT BUTTON DETECTED!") ;
  return mouseX >= 320 && mouseX <= 380 && mouseY >= 440 && mouseY <= 500 ;
}

boolean cont(ArrayList<String> data, String thing) {
  for (String d : data) {
    if (d.equals(thing)) return true ;
  }
  return false ;
}

void mousePressed() {
  if (overShuff()) {
    a.shuffle(5) ; 
    for (int i = 0 ; i < a.chosen.length ; i++) {
      // reassures that no chosen letters will have a circle on them after shuffling 
      a.chosen[i] = false ;
      a.wordBeingMade.clear() ;
    }
  } 
  else if (overSub()) {
    //println("The mouse is over the submit button") ;
    String wo = "" ;
    for (String lett : a.wordBeingMade) {
      wo += lett ; 
    }
    if (test.checkFoundedWord(wo)) {
      // word will be filled in automatically
      // that means it's a duplicate word already found
      textSize(20) ;
      fill(0) ;
      textAlign(CENTER) ;
      text("You have already found this word!",200,780) ;
      textAlign(BASELINE) ;
    }
    else if (test.checkSpecialWord(wo)) {
      // word will be filled in automatically //<>//
    }
    else if (test.checkUnfoundedWord(wo)) {
    } //<>//
    else if(test.checkAnyWord(wo)) {
      textSize(20) ;
      fill(0) ;
      textAlign(CENTER) ;
      text("Congrats! You found a bonus word!",200,780) ;
      textAlign(BASELINE) ;
    }
  }
  else {
    int xpos = a.checkForCoordinate()[0] ;
    int ypos = a.checkForCoordinate()[1] ;
    if (xpos != -1 && ypos != -1) { //<>//
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
}

ArrayList<String> findAllDictWords(int lenn) {
    String[] lines = loadStrings("HowWeMadeTheWords/words.txt") ;
    ArrayList<String> w = new ArrayList<String>() ;
    for (int i = 0 ; i < lines.length ; i++) {
      if (lines[i].length() <= lenn && lines[i].length() >= 3) w.add(lines[i]) ;
    }
    return w ;
  }
