class Crossword {
  ArrayList<String> allPossWords;
  ArrayList<Word> usedWords;
  ArrayList<Word> unfoundedWords;
  ArrayList<Word> foundedWords;
  char[][] crossAns;
  char[][] currentCross;
  
  Crossword(ArrayList<String> wordList) {
    allPossWords = wordList;
    usedWords = new ArrayList<Word>();
    unfoundedWords = new ArrayList<Word>();
    foundedWords = new ArrayList<Word>();
    crossAns = new char[19][19];
    currentCross = new char[19][19];
  }
}
