Soup a ;
Crossword test ;
int lev ;
String ww ;
int specTimestamp;
int foundTimestamp;
boolean isDone;
boolean special;
boolean founded;
PImage bg ;
String[] levels;

void setup() {
  size(400, 800) ;
  bg = loadImage("HowWeMadeTheWords/tropical.png") ;
  bg.resize(400,800) ;
  background(bg) ;
  // soup bowl design added here
  levels = loadStrings("levels.txt");
  lev = 0 ;
  ww = levels[0] ;
  Level le = new Level(ww) ;
  //println(le.getAllPossWords()) ;
  boolean isSpecial = (lev + 2) % 3 == 0;
  if (ww.length() <= 3) {
    isSpecial = false;
  }
  test = new Crossword(le.getAllPossWords(), isSpecial) ;
  a = new Soup(ww, isSpecial, lev) ;
  specTimestamp = 0;
  foundTimestamp = 0;
  special = false;
  founded = false;
  isDone = false;
  a.shuffle(ww.length()) ; 
  for (int i = 0 ; i < a.chosen.length ; i++) {
    // reassures that no chosen letters will have a circle on them after shuffling 
    a.chosen[i] = false ;
    a.wordBeingMade.clear() ;
  }
}

void draw() {
  background(bg) ;
  // this will be to switch languages
  fill(0,100,40) ;
  ellipse(27,55,20,20) ;
  if (isDone) {
    delay(3000);
    isDone = false;
  }
  // Soup displaying
  // Crossword displaying
  test.display() ;
  a.display() ;
  String wooo = "" ;
  for (int i = 0 ; i < a.wordBeingMade.size() ; i++) {
    wooo += (a.wordBeingMade.get(i)) ;
  }
  textAlign(RIGHT);
  textSize(20);
  fill(0);
  text("#oBWF: " + test.getNumBonusWords(), 390, 30);
  textAlign(BASELINE);
  textAlign(CENTER) ;
  fill(0) ;
  textSize(20) ;
  text("LEVEL " + (lev + 1), 200, 30);
  text(wooo, 200, 445) ;
  textAlign(BASELINE);
  if (founded) {
    textSize(20) ;
    fill(0) ;
    textAlign(CENTER) ;
    text("You have already found this word!",200,780) ;
    textAlign(BASELINE) ;
    if (millis() - foundTimestamp >= 1500) {
      founded = false;
    }
  } //<>//
  if (special) {
    textSize(20) ;
    fill(0) ;
    textAlign(CENTER) ;
    text("You found a bonus word!",200,780) ;
    textAlign(BASELINE) ; //<>//
    if (millis() - specTimestamp >= 1500) {
      special = false;
    }
  }
  
  if (test.isDone()) {
    isDone = true; //<>//
    lev++;
    boolean isSpecial = (lev + 2) % 3 == 0;
    if (ww.length() <= 3) {
      isSpecial = false;
    } //<>// //<>//
    ww = levels[lev];
    Level le = new Level(ww);
    test = new Crossword(le.getAllPossWords(), isSpecial);
    a = new Soup(ww, isSpecial, lev);
    textSize(20);
    textAlign(CENTER); //<>//
    fill(0);
    text("CONGRATULATIONS!", 200,770);
    text("You found all the words!", 200, 790);
    textAlign(BASELINE);
    a.shuffle(ww.length()) ; 
    for (int i = 0 ; i < a.chosen.length ; i++) {
      // reassures that no chosen letters will have a circle on them after shuffling 
      a.chosen[i] = false ;
      a.wordBeingMade.clear() ;
    }
  }
}

boolean overShuff() {
  // returns whether the mouse is over the shuffle button //<>//
  return mouseX >= 20 && mouseX <= 77 && mouseY >= 440 && mouseY <= 500 ;
}
 //<>//
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
 //<>//
void mousePressed() {
  if (mouseX >= 15 && mouseX <= 39 && mouseY >= 33 && mouseY <= 77) {
    // we need to switch languages
  }
  else if (overShuff()) {
    a.shuffle(ww.length()) ; 
    for (int i = 0 ; i < a.chosen.length ; i++) { //<>//
      // reassures that no chosen letters will have a circle on them after shuffling 
      a.chosen[i] = false ;
      a.wordBeingMade.clear() ;
    }
  } 
  else if (overSub()) {
    //println("The mouse is over the submit button") ;
    String wo = "" ;
    for (String lett : a.wordBeingMade) {
      wo += lett ;  //<>//
    }
    if (test.checkFoundedWord(wo)) {
      // word will be filled in automatically //<>//
      // that means it's a duplicate word already found
      founded = true;
      foundTimestamp = millis();
    }
    else if (test.checkSpecialWord(wo)) {
      // word will be filled in automatically //<>//
    }
    else if (test.checkUnfoundedWord(wo)) {
    } //<>//
    else if (test.checkAnyWord(wo)) {
      special = true;
      specTimestamp = millis();
    }
    for (int i = 0; i < a.chosen.length; i++) {
      a.chosen[i] = false;
      a.wordBeingMade.clear(); //<>//
    }
    for (int i = 0 ; i < a.chosen.length ; i++) {
      a.chosen[i] = false ;
    }
  }
  else {
    int xpos = a.checkForCoordinate()[0] ; //<>//
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
