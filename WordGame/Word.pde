class Word {
  int xcor, ycor;
  String word;
  boolean isHor;
  
  Word(String str, int y, int x, boolean horizontalness) { //represents where a certain word is in a grid of a crossword
    ycor = y;                      //which provides easy access to usedWords
    xcor = x;
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
  boolean isHor() {
    return isHor;
  }
  String getWord() {
    return word;
  }
  
  boolean equals(Word otherWord) {
    return word.equals(otherWord.getWord());
  }
}
