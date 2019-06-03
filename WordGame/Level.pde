class Level {
  String word;
  ArrayList<String> allPossWords;
  ArrayList<String> dict;

  Level(String newWord, int lev) {
    // constructor
    word = newWord;
    allPossWords = new NoDupAR<String>();
    allCombos();
    dict = findAllDictWords(10);
    findValidWords(dict);
    allPossWords = reverse(allPossWords);
  }
  
  ArrayList<String> findAllDictWords(int lenn) {
    String[] lines = loadStrings("HowWeMadeTheWords/words.txt") ;
    ArrayList<String> w = new ArrayList<String>() ;
    for (int i = 0 ; i < lines.length ; i++) {
      if (lines[i].length() <= lenn && lines[i].length() >= 3) w.add(lines[i]) ;
    }
    return w ;
  }
  
  void findValidWords(ArrayList<String> dict) {
    for (int i = 0; i < allPossWords.size(); i++) {
      if (!checkValHelp(allPossWords.get(i).toLowerCase(), 0, dict.size() - 1, dict)) {
        allPossWords.remove(i);
        i--;
      }
    }
  }
  
  boolean checkValHelp(String word, int lo, int hi, ArrayList<String> dict) {
    if (lo > hi) {
      return false;
    }
    int index = (lo + hi) / 2;
    if (dict.get(index).equals(word)) {
      return true;
    } else if (dict.get(index).compareTo(word) < 0) {
      return checkValHelp(word, index + 1, hi, dict);
    } else {
      return checkValHelp(word, lo, index - 1, dict);
    }
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
      } //what this basically does is based on the binary rep. of a num, it determines which letters
        //will be in the certain subset of the word.
      for (int k = 0; k < whichLetters.length; k++) {
        if (whichLetters[k]) {
          toAdd += word.charAt(k);
        }
      }
      permutate(toAdd, 0, toAdd.length() - 1, allPossWords); //then this permutates all the subsets of letters
    }
  }
  
  void permutate(String word, int l, int r, ArrayList<String> list) {
    if (l == r) {
      String copy = new String(word);
      list.add(copy);
    } else {
      for (int i = l; i <= r; i++) {
        word = swap(word, l, i); //it first permutates on the first letter
        permutate(word, l + 1, r, list); //then it permutates on the remaining letters
        word = swap(word, l, i);
      }
    }
  }

  String swap(String og, int a, int b) { //simply swaps two letters in a word
    String swapped = "";
    for (int i = 0; i < og.length(); i++) {
      if (i == a) {
        swapped += og.charAt(b);
      } else if (i == b) {
        swapped += og.charAt(a);
      } else {
        swapped += og.charAt(i);
      }
    }
    return swapped;
  }
  
  String getWord() {
    return word;
  }
  
  ArrayList<String> reverse(ArrayList<String> old) {
    ArrayList<String> ans = new ArrayList<String>();
    for (int i = old.size() - 1; i >= 0; i--) {
      ans.add(old.get(i));
    }
    ans.remove(word);
    ans.add(0, word);
    return ans;
  }
  
  ArrayList<String> getAllPossWords() {
    return allPossWords;
  }
}
