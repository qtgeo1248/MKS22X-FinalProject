import java.util.*;
import java.lang.*;
public class Test {
    String word;
    ArrayList<String> allPossWords;

    public Test(String newWord) {
        word = newWord;
        allPossWords = new ArrayList<String>();
    }

    public void allCombos() {
        boolean[] whichLetters = new boolean[word.length()];
        for (int i = 1; i <= (int)Math.pow(2, word.length()); i++) {
            String toAdd = "";
            for (int j = whichLetters.length - 1; j >= 0; j++) {
                whichLetters[j] = i >= Math.pow(2, j);
                i -= Math.pow(2, j);
            }
            System.out.println(Arrays.toString(whichLetters));
            for (int k = 0; k < whichLetters.length; k++) {
                if (whichLetters[k]) {
                    toAdd += word.charAt(k);
                }
            }
            allPossWords.add(toAdd);
        }
        System.out.println(allPossWords);
    }
    public static void main(String[] args) {
        Test test = new Test("happy");
        test.allCombos();
    }
}
