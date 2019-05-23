void setup() {
  size(400, 800) ;
  background(255) ;
  int lee = 1 ;
  // soup bowl design added here
  Soup a = new Soup("storm",false,lee, false) ;
  a.display() ;
  lee++ ;
}
 
void draw() {
  Level test = new Level("speak");
  ArrayList<String> tester = test.getAllPossWords();
  for (int i = 0; i < tester.size(); i++) {
    text(tester.get(i), 0, 15 * i + 20);
  }
}