class Word {
  int xcor, ycor;
  String word;
  
  Word(String str, int x, int y) {
    xcor = x;
    ycor = y;
    word = str;
  }
  
  void setX(int x) {
    xcor = x;
  }
  
  void setY(int y) {
    ycor = y;
  }
}
