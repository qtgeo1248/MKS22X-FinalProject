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
<<<<<<< HEAD
  Level test = new Level("speak") ;
=======
  Level test = new Level("speak");
>>>>>>> 42d46396edc6848b1e3643b81137d0f47cf1eff3
  ArrayList<String> tester = test.getAllPossWords();
  for (int i = 0; i < tester.size(); i++) {
    text(tester.get(i), 0, 15 * i + 20);
  }
}
