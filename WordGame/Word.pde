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
      String toAdd = "";
      for (int j = 0; j < whichLetters.length; j++) {
        whichLetters[j] = i % (int)pow(2, j) == 0;
      }
      for (int k = 0; k < whichLetters.length; k++) {
        if (whichLetters[k]) {
          toAdd += word.charAt(k);
        }
      }
      allPossWords.add(toAdd);
    }
  }
}
