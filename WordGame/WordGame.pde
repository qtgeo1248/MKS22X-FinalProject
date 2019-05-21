void setup() {
  size(400, 800) ;
  background(255) ;
  // soup bowl design added here
  fill(255, 125, 0) ;
  ellipse(200, 600, 300, 300) ;
}
 
void draw() {
  Word test = new Word("speak");
  ArrayList<String> tester = test.getAllPossWords();
  for (int i = 0; i < tester.size(); i++) {
    text(tester.get(i), 0, 15 * i + 20);
  }
}
