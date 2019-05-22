class Crossword {
  ArrayList<String> allPossWords;
  ArrayList<Word> usedWords;
  ArrayList<Word> unfoundedWords;
  ArrayList<Word> foundedWords;
  char[][] crossAns;
  char[][] currentCross;
  String specialWord;
  
  Crossword(ArrayList<String> wordList, boolean isSpecial) {
    allPossWords = wordList;
    usedWords = new ArrayList<Word>();
    unfoundedWords = new ArrayList<Word>();
    foundedWords = new ArrayList<Word>();
    crossAns = new char[19][19];
    currentCross = new char[19][19];
    if (!isSpecial) {
      specialWord = "";
    }
  }
  
  boolean isDone() {
    return unfoundedWords.size() == 0;
  }
  
  boolean checkUnfoundedWord(String word) {
    return unfoundedWords.contains(word);
  }
  boolean checkFoundedWord(String word) {
    return foundedWords.contains(word);
  }
  boolean checkSpecialWord(String word) {
    return specialWord.equals(word);
  }
}
