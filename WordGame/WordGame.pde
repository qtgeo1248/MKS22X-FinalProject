void setup() {
  size(400, 800) ;
  background(255) ;
  int lee = 1 ;
  // soup bowl design added here
  Soup a = new Soup("PHLOEM",false,lee, false) ;
  a.display() ;
  lee++ ;
  Crossword test = new Crossword(new ArrayList<String>(), true);
  test.addWordHor("SAD", 3, 4, true);
  test.addWordVer("HAPPY", 2, 4, false);
  test.addWordVer("HAPPY", 2, 5, false);
  test.addWordHor("YAPPPY", 6, 5, false);
  textSize(15);
  text(test.toString(), 10, 10);
}
 
void draw() {
}
