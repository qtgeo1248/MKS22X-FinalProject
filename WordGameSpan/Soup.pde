import java.util.* ;
import java.io.* ;
// used for shuffle

class Soup implements Displayable {
  // the bowl is centered at 200, 300 so the letters will have to be within that area
  int lev ;
  boolean isSpecial ; // is determined by lev
  String word ;
  Level ll ;
  ArrayList<String> letters ; // to help us display the letters one at a time
  ArrayList<String> wordBeingMade ;
  boolean[] chosen ; // will keep track of whether the user chose the letters or not 
  float[][] positions ;
  // top row will represent x-coordinates of letters
  // bottom row will represent y-coordinates of letters
  boolean mouseOverLetter ;
  PImage imageForShuffle, submit ;

  Soup(String w, boolean specOrNot, int le) {
    // constructor
    lev = le ;
    imageForShuffle = loadImage("HowWeMadeTheWords/shuf.png") ;
    imageForShuffle.resize(50,50) ;
    submit = loadImage("HowWeMadeTheWords/submit.png") ;
    submit.resize(50,50) ;
    // instantiating chosen array
    chosen = new boolean[10] ;
    for (int i = 0 ; i < 10 ; i++) {
      chosen[i] = false ;
      // in the beginning, none of the letters are chosen
    }
    wordBeingMade = new ArrayList<String>() ;
    isSpecial = specOrNot ; // based on parameter
    ll = new Level(w) ;
    letters = new ArrayList<String>() ;
    for (int i = 0; i < w.length() ; i++) {
      letters.add(w.charAt(i) + "") ;
      // adding individual letters to ArrayList
    }
    // this 2D array will keep track of the coordinates of each letter --> the coordinates will be helpful for shuffle method
    positions = new float[2][10] ;
      for (int r = 0; r < 2; r++) {
        // when r = 0, that means we are adding the x-coordinates
        // when r = 1, that means we are adding the y-coordinates
        for (int c = 0; c < 10; c++) {
          // c will represent which letter we're at
          float pos ;
          int unit = 360 / w.length() ;
          if (r == 0) {
            // we are adding x-coordinates to positions
            pos = cos(radians(unit * c)) ;
            positions[r][c] = 190 + (pos * 120) ;
          } 
          else {
            // we are adding y-coordinates to positions
            pos = sin(radians(unit * c)) ;
            positions[r][c] = 610 + (pos * 120) ;
          }
        }
      }
  }
  boolean isSpecial() {
    // simple accessor method
    return isSpecial ;
  }
  void shuffle(int ll) { 
    int unit = 360 / ll ;
    // purpose/function: mix around the letters
    Collections.shuffle(letters) ; // imports are for this
    // the following is basically what happens in the constructor
    for (int r = 0; r < 2; r++) {
      for (int c = 0; c < 10; c++) {
        float pos ;
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
  
  // This method will be used later but it goes through the arraylist wordBeingMade and if there are Strings in there, 
  // it means that the user has chosen that letter and we can add it to the String res (what will be returned)
  String makeWordFromChosenLetters() {
    String res = "" ;
    for (String b : wordBeingMade) {
      res += b ;
    }
    return res ;
  }
  
  // checks whether the array has the float val and returns the index that it is in the array.
  // This will be related to the position in the ArrayList letters
  // it should return an array with 2 ints because 2 letters can have the same x-coordinate but different y-values
  ArrayList<Integer> contains(float[] a, float val) {
    ArrayList<Integer> res = new ArrayList<Integer>() ;
    int i = 0 ;
    for (float v : a) {
      if (val >= v - 20 && val <= v + 20) {
        // the user can be off by 20 units
        res.add(i) ; 
      }
      i++ ;
    }
    return res ;
  }
  
  int[] checkForCoordinate() {
    int[] arryOfCoordinatesXY = new int[2] ;
    ArrayList<Integer> xs = contains(positions[0], mouseX) ;
    ArrayList<Integer> ys = contains(positions[1], mouseY) ;
    for (int a = 0 ; a < xs.size() ; a++) {
      // we go through each of the provided x-coordinates and 
      // see if the index matches one of the indexes provided from the y ArrayList
      int xxxx = xs.get(a) ;
      for (int b = 0 ; b < ys.size() ; b++) {
        // go through each of the y-coordinates provided to see if we have a matching index for the letter
        int yyyy = ys.get(b) ;
        if (xxxx == yyyy) {
          // this means that we have found the two coordinates that match to the same letter
          arryOfCoordinatesXY[0] = xxxx ;
          arryOfCoordinatesXY[1] = yyyy ;
          //println("Do we have good values? " + (xxxx == yyyy)) ;
          return arryOfCoordinatesXY ; // returning earlier
        }
      }
    }
    return arryOfCoordinatesXY ; // otherwise we'll return an empty array
  }
  // INTERACTIVE ASPECT hopefully
  void mouse() {
    int xpos = checkForCoordinate()[0] ;
    int ypos = checkForCoordinate()[1] ;
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
    // adding shuffle button
    fill(140,0,1) ;
    ellipse(50,470,50,50) ;
    image(imageForShuffle, 26, 445) ; 
    // shuffle image displayed on soup bowl
    // adding the submit button for making a word!!
    fill(0,255,0) ;
    ellipse(350, 470, 50, 50) ;
    image(submit, 325.86, 445) ;
    // adding the letters part!!
    fill(0,0,0) ;
    textSize(40) ;
    for (int i = 0 ; i < letters.size() ; i++) {
      String l = letters.get(i) ;
      float xxx = positions[0][i] ;
      float yyy = positions[1][i] ;
      if (chosen[i]) {
        // the letter is selected so we need to make it look like that by adding a circle to highlight it
        fill(255,255,0) ;
        ellipse(xxx + 10,yyy - 15,50,50) ;
      }
      fill(0,0,0) ; //makes the text black again
      text(l,xxx, yyy) ;
    }
  }
}
