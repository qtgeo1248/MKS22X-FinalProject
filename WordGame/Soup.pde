class Soup {
  // the bowl is centered at 200, 300 so the letters will have to be within that area
  int level ;
  boolean isSpecial ;
  String word ;
  ArrayList<String> letters ;
  float[][] positions ;
  // top row will represent x-coordinates of letters
  // bottom row will represent y-coordinates of letters
  
  Soup(String w) {
    // constructor
    Word b = new Word(w) ;
    for (int i = 0 ; i < b.getWord().length(); i++) {
      String ww = b.getWord() ;
      letters.add(ww.substring(i,i+1)) ;
      // adding individual letters to ArrayList
    }
    // this 2D array will keep track of the coordinates of each letter --> the coordinates will be helpful for shuffle method
    positions = new float[2][10] ;
    int i = 0 ;
    for (int r = 0 ; r < 2 ; r++) {
      for (int c = 0 ; c < 10 ; c++) {
        float pos ;
        if (r == 0) {
          // we are adding x-coordinates to positions
          pos = cos(radians(36 * i)) ;
          i++ ;
          //positions[r][c] = 200 + pos ;
        }
        else {
          // we are adding y-coordinates to positions
          pos = sin(radians(36 * i)) ;
        }
      }
    }
  }
  boolean isSpecial() {
    return isSpecial ;
  }
  void shuffle() {
    // mix around the letters
    
  }
}
