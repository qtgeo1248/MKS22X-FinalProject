class Crossword {
  ArrayList<String> allPossWords;
  ArrayList<String> usedWords;
  ArrayList<String> unfoundedWords;
  ArrayList<String> foundedWords;
  int[][] cross;
  
  Crossword(ArrayList<String> wordList) {
    allPossWords = wordList;
    usedWords = new ArrayList<String>();
    unfoundedWords = new ArrayList<String>();
    foundedWords = new ArrayList<String>();
    cross = new int[20][20];
  }
}
