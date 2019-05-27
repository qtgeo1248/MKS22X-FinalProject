import java.util.* ;
import java.io.* ;
// used for shuffle

class Soup implements Displayable {
  // the bowl is centered at 200, 300 so the letters will have to be within that area
  int lev ;
  boolean isSpecial ;
  String word ;
  Level ll ;
  ArrayList<String> letters ;
  boolean[] chosen ;
  float[][] positions ;
  // top row will represent x-coordinates of letters
  // bottom row will represent y-coordinates of letters
  boolean shuffOrNot ;
  boolean lockedOn, mouseOverLetter ;

  Soup(String w, boolean specOrNot, int le, boolean toShuffleOrNotToShuffle) {
    // constructor
    lev = le ;
    lockedOn = false ;
    chosen = new boolean[10] ;
    for (int i = 0 ; i < 10 ; i++) {
      chosen[i] = false ;
      // in the beginning, none of the letters are chosen
    }
    shuffOrNot = toShuffleOrNotToShuffle ;
    isSpecial = specOrNot ;
    ll = new Level(w) ;
    letters = new ArrayList<String>() ;
    for (int i = 0; i < w.length() ; i++) {
      letters.add(w.charAt(i) + "") ;
      // adding individual letters to ArrayList
    }
    // this 2D array will keep track of the coordinates of each letter --> the coordinates will be helpful for shuffle method
    positions = new float[2][10] ;
    ////// if we are not shuffling!!
    if (!shuffOrNot) {
      int i = 0 ; // this will be keeping track of the letter? NOT SURE ABOUT IT YET
      for (int r = 0; r < 2; r++) {
        for (int c = 0; c < 10; c++) {
          float pos ;
          int unit = 360 / w.length() ;
          if (r == 0) {
            // we are adding x-coordinates to positions
            pos = cos(radians(unit * c)) ;
            positions[r][c] = 190 + (pos * 120) ;
          } else {
            // we are adding y-coordinates to positions
            pos = sin(radians(unit * c)) ;
            positions[r][c] = 610 + (pos * 120) ;
          }
        }
      }
    }
    else {
      shuffle() ;
    }
  }
  boolean isSpecial() {
    return isSpecial ;
  }
  void shuffle() {
    // mix around the letters
    Collections.shuffle(letters) ; // imports are for this
    // mix around the letters
    for (int r = 0; r < 2; r++) {
      for (int c = 0; c < 10; c++) {
        float pos ;
        int unit = 360 / word.length() ;
        if (r == 0) {
          // we are adding x-coordinates to positions
          pos = cos(radians(unit * c)) ;
          positions[r][c] = 190 + (pos * 120) ;
        } else {
          // we are adding y-coordinates to positions
          pos = sin(radians(unit * c)) ;
          positions[r][c] = 610 + (pos * 120) ;
        }
      }
    }
  }
  
  // This method will be used later but it goes through the array chosen (which has booleans)
  // and if the boolean is true, it means that the user has chosen that letter and we can add it to the String res
  // Otherwise if the user had not chosen or clicked on it, that would make the boolean in chosen be false and we wouldn't add it to res
  String makeWordFromChosenLetters() {
    String res = "" ;
    int i = 0 ;
    for (boolean b : chosen) {
      if (b) {
        // the letter was chosen so we need to add it to the String to make a word
        res += letters.get(i) ;
      }
      i++ ;
    }
    return res ;
  }
  
  // checks whether the array has the float val and returns the index that it is in the array.
  // This will be related to the position in the ArrayList letters
  int contains(float[] a, float val) {
    int i = 0 ;
    for (float v : a) {
      if (val >= v - 34 && val <= v + 34) return i ;
      i++ ;
    }
    return -1 ;
  }
  // INTERACTIVE ASPECT hopefully
  void mouse() {
    int xpos = contains(positions[0], mouseX) ;
    int ypos = contains(positions[1], mouseY) ;
    // these should both result in the same value!
    //println("Are the x and y-values equal? " + (xpos == ypos)) ;
    if (xpos != -1 && ypos != -1 && mousePressed) {
      // this means that the mouse is on a letter
      // the user has selected this letter to possibly make a word
      if (chosen[xpos]) {
        // this means that the user is UNSELECTING the letter because it was previously chosen!
        chosen[xpos] = false ;
      }
      else {
        // this letter was not chosen/selected so we need to change that!
        chosen[xpos] = true ; // this helps us identify and keep track of the chosen letter
      }
    }
  }
  // visual aspect of soup - draws soup bowl, shows letters, and allows user to click on letters
  void display() {
    // drawing the soup bowl
    fill(255, 125, 0) ;
    ellipse(200, 600, 300, 300) ;
    // adding the letters
    fill(0,0,0) ;
    textSize(40) ;
    for (int i = 0 ; i < letters.size() ; i++) {
      String l = letters.get(i) ;
      float xxx = positions[0][i] ;
      float yyy = positions[1][i] ;
      if (chosen[i]) {
        // the letter is selected so we need to make it look like that by adding a circle to highlight it
        fill(255,255,0) ;
        ellipse(xxx,yyy,40,40) ;
      }
      text(l,xxx, yyy) ;
    }
  }
}
