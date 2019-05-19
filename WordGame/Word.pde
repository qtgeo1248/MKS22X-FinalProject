class Word {
  String word;
  ArrayList<String> allPossWords;
  
  Word(String newWord) {
    word = newWord;
    allPossWords = new ArrayList<String>();
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
}
