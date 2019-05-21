void setup() {
  size(400, 800) ;
  background(255) ;
  // soup bowl design added here
  fill(255, 125, 0) ;
  ellipse(200, 600, 300, 300) ;
}
 
void draw() {
  text("happy", 0, 20);
  text("sad", 0, 30);
  Word test = new Word("speak");
  ArrayList<String> tester = test.getAllPossWords();
  for (String testing : tester) {
    
  }
}
