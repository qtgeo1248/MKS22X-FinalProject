import java.util.* ;
import java.io.* ;

interface displayable {
  void display() ;
}

class Soup implements displayable {
  // the bowl is centered at 200, 300 so the letters will have to be within that area
  int level ;
  boolean isSpecial ;
  String word ;
  ArrayList<String> letters ;
  float[][] positions ;
  // top row will represent x-coordinates of letters
  // bottom row will represent y-coordinates of letters

  Soup(String w, boolean specOrNot) {
    // constructor
    isSpecial = specOrNot ;
    Word b = new Word(w) ;
    letters = new ArrayList<String>() ;
    for (int i = 0; i < w.length() - 1; i++) {
      letters.add(w.charAt(i) + "") ;
      // adding individual letters to ArrayList
    }
    // this 2D array will keep track of the coordinates of each letter --> the coordinates will be helpful for shuffle method
    positions = new float[2][10] ;
    int i = 0 ; // this will be keeping track of the letter? NOT SURE ABOUT IT YET
    for (int r = 0; r < 2; r++) {
      for (int c = 0; c < 10; c++) {
        float pos ;
        int unit = 360 / w.length() ;
        if (r == 0) {
          // we are adding x-coordinates to positions
          pos = cos(radians(unit * c)) ;
          positions[r][c] = 200 + (pos * 100) ;
        } else {
          // we are adding y-coordinates to positions
          pos = sin(radians(unit * c)) ;
          positions[r][c] = 600 + (pos * 100) ;
        }
      }
    }
  }
  boolean isSpecial() {
    return isSpecial ;
  }
  void shuffle() {
    Collections.shuffle(letters) ;
    
    // mix around the letters
    int l = word.length() ;
    int change = random(l - 2) ;
    for (int i = 0 ; i < l ; i+= change) {
      
    }
    int i = 0 ;
    for (int r = 0; r < 2; r++) {
      for (int c = 0; c < 10; c++) {
        float pos ;
        boolean switchItUp ;
        if ( (int) (1 + random(1)) == 0) switchItUp = true ;
        else {
          switchItUp = false ;
        }
        int unit = 360 / word.length() ;
        if (r == 0 && !switchItUp) {
          // we are adding x-coordinates to positions
          pos = cos(radians(unit * c)) ;
          positions[r][c] = 200 + (pos * 100) ;
        } else if (r == 0) {
          pos = cos(radians(unit * 2 * c)) ;
          positions[r][c] = 200 + (pos * 100) ;
        }
        else if (r == 1 && !switchItUp) {
          // we are adding y-coordinates to positions
          pos = sin(radians(unit * c)) ;
          positions[r][c] = 600 + (pos * 100) ;
        }
        else {
          pos = sin(radians(unit * 3 * c)) ;
          positions[r][c] = 600 + (pos * 100) ;
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
    textSize(32) ;
    for (int i = 0 ; i < letters.size() ; i++) {
      String l = letters.get(i) ;
      text(l,positions[0][i], positions[1][i]) ;
    }
  }
}
