class Word {
  String word;
  ArrayList<String> allPossWords;

  Word(String newWord) {
    // constructor
    word = newWord;
    allPossWords = new ArrayList<String>();
    allCombos();
    allPossWords = findAllWords(10) ;
  }

  ArrayList<String> findAllWords(int len) {
    String[] lines = loadStrings("words.txt");
    ArrayList<String> w = new ArrayList<String>();
    for (int i = 0 ; i< lines.length ; i++) {
      if (lines[i].length() <= len) w.add(lines[i]);
    }
    return w;
  }
  
  void allCombos() {
    boolean[] whichLetters = new boolean[word.length()];
    for (int i = 1; i < (int)Math.pow(2, word.length()); i++) {
      int counter = i;
      String toAdd = "";
      for (int j = whichLetters.length - 1; j >= 0; j--) {
        whichLetters[j] = counter >= Math.pow(2,j);
        if (counter >= Math.pow(2, j)) {
          counter -= Math.pow(2, j);
        }
      }
      for (int k = 0; k < whichLetters.length; k++) {
        if (whichLetters[k]) {
          toAdd += word.charAt(k);
        }
      }
      allPossWords.add(toAdd);
    }
  }
  
  void draw() {
    
  }
  void drawCircular() {
  }
}
