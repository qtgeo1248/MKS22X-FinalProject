class Word {
  int xcor, ycor;
  String word;
  boolean isHor;
  
  Word(String str, int x, int y, boolean horizontalness) { //represents where a certain word is in a grid of a crossword
    xcor = x;                      //which provides easy access to usedWords
    ycor = y;
    word = str;
    isHor = horizontalness;
  }
  
  void setX(int x) {
    xcor = x;
  }
  void setY(int y) {
    ycor = y;
  }
  
  int getX() {
    return xcor;
  }
  int getY() {
    return ycor;
  }
  boolean getIsHor() {
    return isHor;
  }
  String getWord() {
    return word;
  }
  
  boolean equals(String otherWord) {
    return word.equals(otherWord);
  }
}
