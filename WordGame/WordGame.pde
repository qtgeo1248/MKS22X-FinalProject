void setup() {
  size(400, 800) ;
  background(255) ;
  int lee = 1 ;
  // soup bowl design added here
  Soup a = new Soup("PHLOEM",false,lee, false) ;
  a.display() ;
  lee++ ;
  Crossword test = new Crossword(new ArrayList<String>(), true);
  test.display();
}
 
void draw() {
  Level test = new Level("speak") ;
  for (int i = 0; i < test.getAllPossWords().size(); i++) {
    text(test.getAllPossWords().get(i), 10, 50 + 20 * i);
  }
}
