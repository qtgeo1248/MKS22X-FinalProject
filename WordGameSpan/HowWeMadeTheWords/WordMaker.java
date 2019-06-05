import java.util.* ;
import java.io.* ;

public class WordMaker {
  public static void main(String[] args) {
    System.out.println(findAllWords(6).contains("hole")) ;
  }
  public static ArrayList<String> findAllWords(int len) {
    String fileName = "words.txt";
    ArrayList<String> w = new ArrayList<String>() ;
    try {
      File f = new File(fileName) ;
      Scanner in = new Scanner(f) ;
      while (in.hasNext()) {
          String line = in.nextLine() ;
          if (line.length() <= len) w.add(line) ;
      }
    } catch(FileNotFoundException e){
      System.out.println("File not found: " + fileName);
      System.exit(1);
    }
    return w ;
  }
}
