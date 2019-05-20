class Soup {
  // the bowl is centered at 200, 300 so the letters will have to be within that area
  int level ;
  boolean isSpecial ;
  String word ;
  ArrayList<String> letters ;
  int[][] positions ;
  // top row will represent x-coordinates of letters
  // bottom row will represent y-coordinates of letters
  
  Soup(String w) {
    // constructor
    Word b = new Word(w) ;
    for (int i = 0 ; i < b.getWord().length(); i++) {
      String ww = b.getWord() ;
      letters.add(ww.substring(i,i+1)) ;
    }
    positions = new int[2][10] ;
    for (int r = 0 ; r < 2 ; r++) {
      for (int c = 0 ; c < 10 ; c++) {
        double pos ;
        if (r == 0) {
          // we are adding x-coordinates to positions
          pos = 0.0 ;
          //positions[r][c] = 1;
        }
        else {
          // we are adding y-coordinates to positions
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
