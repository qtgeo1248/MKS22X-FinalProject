void setup() {
  size(400, 800) ;
  background(255) ;
  int lee = 1 ;
  // soup bowl design added here
  Soup a = new Soup("PHLOEM",false,lee, false) ;
  a.display() ;
  lee++ ;
  Level tester = new Level("PEAKS");
  ArrayList<String> words = tester.getAllPossWords();
  textSize(20);
  Crossword test = new Crossword(words, true);
  test.addAllWords();
  test.display();
}
 
void draw() {
}
