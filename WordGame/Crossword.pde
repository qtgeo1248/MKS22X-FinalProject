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
  
  boolean addWordHor(String word, int row, int col, boolean isFirst, Word intersecting) {
    if (col + word.length() > crossAns[0].length) {
      return false;
    }
    if (row < 0 || row >= crossAns.length || col < 0 || col >= crossAns[0].length) {
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
        if (c != intersecting.getX() && !isFirst) {
          if ((row > 0 && crossAns[row - 1][c] != '_') ||
              (row < crossAns.length - 1 && crossAns[row + 1][c] != '_')) {
            return false;
          }
        }
      }
      if (idx == word.length() - 1) {
        if (c < crossAns[0].length - 1 && crossAns[row][c + 1] != '_') {
          return false;
        }
        if (c != intersecting.getX() && !isFirst) {
          if ((row > 0 && crossAns[row - 1][c] != '_') ||
              (row < crossAns.length - 1 && crossAns[row + 1][c] != '_')) {
            return false;
          }
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
  
  boolean addWordVer(String word, int row, int col, boolean isFirst, Word intersecting) {
    if (row + word.length() > crossAns.length) {
      return false;
    }
    if (row < 0 || row >= crossAns.length || col < 0 || col >= crossAns[0].length) {
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
        if (r != intersecting.getY() && !isFirst) {
          if ((col > 0 && crossAns[r][col - 1] != '_') ||
              (col < crossAns[0].length - 1 && crossAns[r][col + 1] != '_')) {
            return false;
          }
        }
      }
      if (idx == word.length() - 1) {
        if (r < crossAns[0].length - 1 && crossAns[r + 1][col] != '_') {
          return false;
        }
        if (r != intersecting.getY() && !isFirst) {
          if ((col > 0 && crossAns[r][col - 1] != '_') ||
              (col < crossAns[0].length - 1 && crossAns[r][col + 1] != '_')) {
            return false;
          }
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
      Word first = new Word(allPossWords.get(0), 10, 10 - center, true);
      addWordHor(allPossWords.get(0), 10, 10 - center, true, new Word("", 0, 0, false));
      usedWords.add(first);
      for (int wordIdx = 1; wordIdx < allPossWords.size(); wordIdx++) {
        String word = allPossWords.get(wordIdx);
        ArrayList<Intersection> places = new ArrayList<Intersection>();
        Collections.shuffle(places);
        for (int i = 0; i < usedWords.size(); i++) {
          places.addAll(intersections(word, usedWords.get(i)));
        }
        InterSorts.insertionSort(places);
        boolean isPlaced = false;
        for (int i = 0; i < places.size() && !isPlaced; i++) {
          Intersection location = places.get(i);
          if (location.isHor()) {
            isPlaced = addWordHor(word, location.getY(), location.getX(), false, location.getWord());
          } else {
            isPlaced = addWordVer(word, location.getY(), location.getX(), false, location.getWord());
          }
          if (isPlaced) {
            usedWords.add(new Word(word, location.getY(), location.getX(), location.isHor()));
          }
        }
      }
    }
  }
  
  ArrayList<Intersection> intersections(String og, Word compared) {
    ArrayList<Intersection> ans = new ArrayList<Intersection>(); //returns an instance of the Intersection class
    String comparedS = compared.getWord();
    for (int i = 0; i < og.length(); i++) {
      char current = og.charAt(i);
      for (int j = 0; j < comparedS.length(); j++) {
        if (comparedS.charAt(j) == current) {
          Intersection toAdd = new Intersection();
          toAdd.setDist(min(abs(i), abs(og.length() - i)));
          toAdd.setOther(compared);
          if (compared.isHor()) {
            toAdd.setX(compared.getX() + j);
            toAdd.setY(compared.getY() - i);
            toAdd.setHor(false);
          } else {
            toAdd.setX(compared.getX() - i);
            toAdd.setY(compared.getY() + j);
            toAdd.setHor(true);
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
