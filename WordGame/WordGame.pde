void setup() {
  size(400, 800) ;
  background(255) ;
  int lee = 1 ;
  // soup bowl design added here
  Soup a = new Soup("PHLOEM",false,lee, false) ;
  a.display() ;
  lee++ ;
  a.mouseClicked() ;
  Crossword test = new Crossword(new ArrayList<String>(), true);
  test.display();
}
 
void draw() {
  /*Level test = new Level("speak");
  ArrayList<String> tester = test.getAllPossWords();
  for (int i = 0; i < tester.size(); i++) {
    text(tester.get(i), 0, 15 * i + 20);
  } */
  Level test = new Level("speak") ;
  for (int i = 0; i < test.getAllPossWords().size(); i++) {
    text(test.getAllPossWords().get(i), 10, 50 + 20 * i);
  }
  int lee = 1 ;
  // soup bowl design added here
  Soup a = new Soup("PHLOEM",false,lee, false) ;
  a.display() ;
  lee++ ;
  a.mouseClicked() ;
  println("X-coordinate: " + mouseX) ;
  println("Y-coordinate: " + mouseY) ;
  println("Mouse over letter?: " + (a.contains(a.positions[0],mouseX) != -1 && a.contains(a.positions[1], mouseY) != -1)) ;
}
