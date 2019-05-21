import java.util.*;
import java.lang.*;
import java.io.*;

public class Word {
    String word;
    ArrayList<String> allPossWords;

    public Word(String newWord) {
        // constructor
        word = newWord;
        allPossWords = new ArrayList<String>();
        allCombos();
        try {
            ArrayList<String> dict = findAllWords(10);
            checkValid(dict);
        } catch (FileNotFoundException e) {
            System.out.println("FILE WRONG");
        }
    }

    public ArrayList<String> findAllWords(int len) throws FileNotFoundException {
        File f = new File("HowWeMadeTheWords/words.txt");
        Scanner in = new Scanner(f);
        ArrayList<String> lines = new ArrayList<String>();
        while (in.hasNextLine()) {
            lines.add(in.nextLine());
        }
        ArrayList<String> w = new ArrayList<String>();
        for (int i = 0 ; i< lines.size() ; i++) {
            if (lines.get(i).length() <= len) w.add(lines.get(i));
        }
        return w;
    }

    public void checkValid(ArrayList<String> dict) {
        for (int i = 0; i < allPossWords.size(); i++) {
            if (!checkValHelp(allPossWords.get(i), 0, dict.size() - 1, dict)) {
                allPossWords.remove(i);
                i--;
            }
        }
    }

    public boolean checkValHelp(String word, int lo, int hi, ArrayList<String> dict) {
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

    public void allCombos() {
        boolean[] whichLetters = new boolean[word.length()];
        for (int i = 1; i < (int)Math.pow(2, word.length()); i++) {
            int counter = i;
            String toAdd = "";
            for (int j = whichLetters.length - 1; j >= 0; j--) {
                whichLetters[j] = counter >= Math.pow(2,j);
                if (counter >= Math.pow(2, j)) {
                    counter -= Math.pow(2, j);
                }
            }
            for (int k = 0; k < whichLetters.length; k++) {
                if (whichLetters[k]) {
                    toAdd += word.charAt(k);
                }
            }
            permutate(toAdd, 0, toAdd.length() - 1, allPossWords);
        }
    }

    public void permutate(String word, int l, int r, ArrayList<String> list) {
        if (l == r) {
            String copy = new String(word);
            list.add(copy);
        } else {
            for (int i = l; i <= r; i++) {
                word = swap(word, l, i);
                permutate(word, l + 1, r, list);
                word = swap(word, l, i);
            }
        }
    }

    public String swap(String og, int a, int b) {
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

    public String getWord() {
        return word;
    }

    public ArrayList<String> getAllPossWords() {
        return allPossWords;
    }

    public static void main(String[] args) {
        Word test = new Word("speak");
        System.out.println(test.getAllPossWords());
    }
}
