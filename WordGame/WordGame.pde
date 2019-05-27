Soup a ;
Crossword test ;

void setup() {
  size(400, 800) ;
  background(255) ;
  // soup bowl design added here
  a = new Soup("PHLOEM",false, 1, false) ;
  test = new Crossword(new ArrayList<String>(), true);
}
 
void draw() {
  /*Level test = new Level("speak");
  ArrayList<String> tester = test.getAllPossWords();
  for (int i = 0; i < tester.size(); i++) {
    text(tester.get(i), 0, 15 * i + 20);
  } */
  // Soup displaying
  a.display() ;
  println("X-coordinate: " + mouseX) ;
  println("Y-coordinate: " + mouseY) ;
  println("Mouse over letter?: " + (a.contains(a.positions[0],mouseX) != -1 && a.contains(a.positions[1], mouseY) != -1)) ;
  println("Mouse down?: " + mousePressed) ;
  // Crossword displaying
  test.display() ;
  Level test = new Level("speak") ;
  for (int i = 0; i < test.getAllPossWords().size(); i++) {
    text(test.getAllPossWords().get(i), 10, 50 + 20 * i);
  }
}

void mousePressed() {
  fill(255,255,15) ;
  ellipse(mouseX,mouseY,10,10) ;
}
