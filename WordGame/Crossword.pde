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
    } else { //TEMP
      specialWord = "SADNESS";
    }
    for (int i = 0; i < crossAns.length; i++) {
      for (int j = 0; j < crossAns[i].length; j++) {
        crossAns[i][j] = '_';
        currentCross[i][j] = '_';
      }
    }
  }
  
  String toString() {
    String ans = "";
    for (int i = 0; i < crossAns.length; i++) {
      for (int j = 0; j < crossAns[i].length; j++) {
        ans += crossAns[i][j] + " ";
      }
      ans += "\n";
    }
    return ans;
  }
  
  boolean addWordHor(String word, int row, int col) {
    return true;
  }
  
  boolean addWordVer(String word, int row, int col) {
    return true;
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
    fill(128, 128, 128);
    if (specialWord != "") { //"" signifies no special word
      for (int i = 0; i < specialWord.length(); i++) {
        square(10 + 20 * i, 10, 20);
        textSize(20);
        fill(0, 0, 0);
        text(specialWord.charAt(i), 14 + 20 * i, 27.5);
        fill(128, 128, 128);
      }
    }
    
    for (int i = 0; i < currentCross.length; i++) {
      for (int j = 0; j < currentCross[i].length; j++) {
        if (crossAns[i][j] != '_') {
          square(10 + 20 * j, 50 + 20 * i, 20);
        }
        if (currentCross[i][j] != '_') {
          fill(0, 0, 0);
          text(currentCross[i][j], 14 + 20 * j, 67.5 + 20 * i);
          fill(128, 128, 128);
        }
      }
    }
  }
}
