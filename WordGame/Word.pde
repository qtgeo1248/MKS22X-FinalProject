class Word {
  String word;
  ArrayList<String> allPossWords;

  Word(String newWord) {
    // constructor
    word = newWord;
    allPossWords = new ArrayList<String>();
    allPossWords = findAllWords(6) ;
  }

  ArrayList<String> findAllWords(int len) {
    String[] lines = loadStrings("words.txt");
    ArrayList<String> w = new ArrayList<String>() ;
    for (int i = 0 ; i< lines.length ; i++) {
      if (lines[i].length() <= len) w.add(lines[i]) ;
    }
    return w ;
  }
}
