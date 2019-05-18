import java.util.* ;
import java.io.* ;

public class WordMaker {
  public static void main(String[] args) {
    String fileName = "words.txt";
    try {
      File f = new File(fileName) ;
      Scanner in = new Scanner(f) ;
      ArrayList<String> w = new ArrayList<String>() ;
      while (in.hasNext()) {
          String line = in.nextLine() ;
          if (line.length() <= 6) w.add(line) ;
      }
      System.out.println(w) ;
    } catch(FileNotFoundException e){
      System.out.println("File not found: " + fileName);
      System.exit(1);
    }
  }
}
