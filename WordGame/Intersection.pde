class Intersection {
  int distance, xcor, ycor;
  boolean isHor;
  Word other; //the word that is being intersected
  
  void setDist(int dist) {
    distance = dist;
  }
  void setX(int x) {
    xcor = x;
  }
  void setY(int y) {
    ycor = y;
  }
  void setHor(boolean isIt) {
    isHor = isIt;
  }
  void setOther(Word intersecting) {
    other = intersecting;
  }
  
  int getDist() {
    return distance;
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
  Word getWord() {
    return other;
  }
}
