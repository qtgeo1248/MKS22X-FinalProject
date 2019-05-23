class Crossword implements Displayable {
  ArrayList<String> allPossWords;
  ArrayList<Word> usedWords;
  ArrayList<Word> unfoundedWords;
  ArrayList<Word> foundedWords;
  char[][] crossAns;
  char[][] currentCross;
  String specialWord; //a special word is a word separate from the crossword, meaning it's harder to find
                      //will be empty string if it's not special level
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
  
  boolean isDone() { //checks if we're done with the level
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
  
  void display() {
    if (specialWord != "") { //"" signifies no special word
      fill(128, 128, 128);
      for (int i = 0; i < specialWord.length(); i++) {
        
      }
    }
  }
}
