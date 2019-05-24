import java.util.* ;
import java.io.* ;
// used for shuffle

interface Displayable {
  void display() ;
}

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
  
  String makeWordFromChosenLetters() {
    String res = "" ;
    return res ;
  }
  
  int contains(float[] a, float val) {
    int i = 0 ;
    for (float v : a) {
      if (v == val) return i ;
      i++ ;
    }
    return -1 ;
  }
  void mouseClicked() {
    int xpos = contains(positions[0], mouseX) ;
    int ypos = contains(positions[1], mouseY) ;
    if (xpos != -1 && ypos != -1) {
      // this means that the mouse is on a letter
      lockedOn = true ;
      if (mousePressed) {
        // the user has selected this letter to possibly make a word
        chosen[xpos] = true ;
      }
    }
    else {
      lockedOn = false ;
    }
    /// NOT DONE YET!!
  }
  
  void display() {
    // drawing the soup bowl
    fill(255, 125, 0) ;
    ellipse(200, 600, 300, 300) ;
    // adding the letters
    fill(0,0,0) ;
    textSize(40) ;
    for (int i = 0 ; i < letters.size() ; i++) {
      String l = letters.get(i) ;
      text(l,positions[0][i], positions[1][i]) ;
    }
  }
}