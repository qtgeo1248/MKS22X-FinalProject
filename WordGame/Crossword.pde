class Crossword {
  ArrayList<String> allPossWords;
  ArrayList<String> usedWords;
  ArrayList<String> unfoundedWords;
  ArrayList<String> foundedWords;
  int[][] crossAns;
  int[][] currentCross;
  
  Crossword(ArrayList<String> wordList) {
    allPossWords = wordList;
    usedWords = new ArrayList<String>();
    unfoundedWords = new ArrayList<String>();
    foundedWords = new ArrayList<String>();
    crossAns = new int[19][19];
  }
}
