class Word {
  String word;
  ArrayList<String> allPossWords;
  
  Word(String newWord) {
    word = newWord;
    allPossWords = new ArrayList<String>();
  }
  
  void allCombos() {
    boolean[] whichLetters = new boolean[word.length()];
    for (int i = 1; i <= (int)Math.pow(2, word.length()); i++) {
      
    }
  }
}
