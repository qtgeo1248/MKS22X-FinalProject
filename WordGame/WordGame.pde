void setup() {
  size(400, 800) ;
  background(255) ;
  int lee = 1 ;
  // soup bowl design added here
  Soup a = new Soup("PHLOEM",false,lee, false) ;
  a.display() ;
  lee++ ;
  Level tester = new Level("SPEAK");
  ArrayList<String> words = tester.getAllPossWords();
  textSize(20);
  for (int i = 0; i < words.size(); i++) {
    text(words.get(i), 10, 20 + 20 * i);
  }
  Crossword test = new Crossword(words, true);
  test.addAllWords();
  text(test.toString(), 10, 10);
}
 
void draw() {
}
