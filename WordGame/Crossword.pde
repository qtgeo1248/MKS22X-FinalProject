class Crossword implements Displayable {
  Random gen;
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
    gen = new Random();
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
  
  boolean addWordHor(String word, int row, int col, boolean isFirst) {
    if (col + word.length() > crossAns[0].length) {
      return false;
    }
    int c = col;
    int idx = 0;
    boolean doesCross = false;
    while (idx < word.length()) {
      if (crossAns[row][c] != '_') {
        if (crossAns[row][c] == word.charAt(idx)) {
          doesCross = true;
        } else {
          return false;
        }
      }
      if (idx == 0) {
        if (c > 0 && crossAns[row][c - 1] != '_') {
          return false;
        }
      }
      if (idx == word.length() - 1) {
        if (c < crossAns[0].length - 1 && crossAns[row][c + 1] != '_') {
          return false;
        }
      }
      if (idx > 0 && idx < word.length() - 1) {
        if ((row < crossAns.length - 1 && crossAns[row + 1][c] != '_') ||
            (row > 0 && crossAns[row - 1][c] != '_')) {
          return false;
        }
      }
      c++;
      idx++;
    }
    if (!doesCross && !isFirst) {
      return false;
    }
    c = col;
    idx = 0;
    while (idx < word.length()) {
      crossAns[row][c] = word.charAt(idx);
      c++;
      idx++;
    }
    return true;
  }
  
  boolean addWordVer(String word, int row, int col, boolean isFirst) {
    if (row + word.length() > crossAns.length) {
      return false;
    }
    int r = row;
    int idx = 0;
    boolean doesCross = false;
    while (idx < word.length()) {
      if (crossAns[r][col] != '_') {
        if (crossAns[r][col] == word.charAt(idx)) {
          doesCross = true;
        } else {
          return false;
        }
      }
      if (idx == 0) {
        if (r > 0 && crossAns[r - 1][col] != '_') {
          return false;
        }
      }
      if (idx == word.length() - 1) {
        if (r < crossAns[0].length - 1 && crossAns[r + 1][col] != '_') {
          return false;
        }
      }
      if (idx > 0 && idx < word.length() - 1) {
        if ((col < crossAns[0].length - 1 && crossAns[r][col + 1] != '_') ||
            (col > 0 && crossAns[r][col - 1] != '_')) {
          return false;
        }
      }
      r++;
      idx++;
    }
    if (!doesCross && !isFirst) {
      return false;
    }
    r = row;
    idx = 0;
    while (idx < word.length()) {
      crossAns[r][col] = word.charAt(idx);
      r++;
      idx++;
    }
    return true;
  }
  
  void addAllWords() {
    int size = allPossWords.size();
    for (int bigTrial = 0; bigTrial < size; bigTrial++) {
      int center = allPossWords.get(0).length() / 2;
      println(center);
      Word first = new Word(allPossWords.get(0), 10, 10 - center, true);
      addWordHor(allPossWords.get(0), 10, 10 - center, true);
      usedWords.add(first);
      for (int wordIdx = 1; wordIdx < allPossWords.size(); wordIdx++) {
        String word = allPossWords.get(wordIdx);
        ArrayList<int[]> places = new ArrayList<int[]>();
        Collections.shuffle(places);
        for (int i = 0; i < usedWords.size(); i++) {
          places.addAll(intersections(word, usedWords.get(i)));
        }
        InterSorts.insertionSort(places);
        boolean isPlaced = false;
        for (int i = 0; i < places.size() && !isPlaced; i++) {
          int[] location = places.get(i);
          if (location[3] == 1) {
            isPlaced = addWordHor(word, location[1], location[2], false);
          } else {
            isPlaced = addWordVer(word, location[1], location[2], false);
          }
          if (isPlaced) {
            usedWords.add(new Word(word, location[1], location[2], location[3] == 1));
          }
        }
      }
    }
  }
  
  ArrayList<int[]> intersections(String og, Word compared) {
    ArrayList<int[]> ans = new ArrayList<int[]>(); //returns distance the place of intersection is from edge of the word,
    String comparedS = compared.getWord();         //the y and x cor of the place where og should start at,
    for (int i = 0; i < og.length(); i++) {        //a 0 or 1 (false or true) signifying if it's hor,
      char current = og.charAt(i);                 //and the Word it is intersecting
      for (int j = 0; j < comparedS.length(); j++) {
        if (comparedS.charAt(j) == current) {
          int[] toAdd = new int[5];
          toAdd[0] = min(abs(i), abs(og.length() - i));
          if (compared.isHor()) {
            toAdd[2] = compared.getX() + j;
            toAdd[1] = compared.getY() - i;
            toAdd[3] = 0;
          } else {
            toAdd[2] = compared.getX() - i;
            toAdd[1] = compared.getY() + j;
            toAdd[3] = 1;
          }
          ans.add(toAdd);
        }
      }
    }
    return ans;
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
