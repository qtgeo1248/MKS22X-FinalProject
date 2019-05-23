import java.util.* ;
import java.io.* ;
// used for shuffle

class Soup implements Displayable {
  // the bowl is centered at 200, 300 so the letters will have to be within that area
  int lev ;
  boolean isSpecial ;
  String word ;
  ArrayList<String> letters ;
  float[][] positions ;
  boolean shuffOrNot ;
  // top row will represent x-coordinates of letters
  // bottom row will represent y-coordinates of letters

  Soup(String w, boolean specOrNot, int le, boolean toShuffleOrNotToShuffle) {
    // constructor
    lev = le ;
    shuffOrNot = toShuffleOrNotToShuffle ;
    isSpecial = specOrNot ;
    Level b = new Level(w) ;
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