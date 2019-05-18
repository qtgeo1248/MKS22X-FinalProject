import java.util.* ;
import java.io.* ;

public class WordMaker {
  public static void main(String[] args) {
    String fileName = "words.txt";
    try {
      File f = new File(fileName) ;
      Scanner in = new Scanner(f) ;
      int i = 0 ;
      while(in.hasNext() && i < 10) {
          String line = in.nextLine() ;
          System.out.println(line) ;
          i++ ;
      }
    } catch(FileNotFoundException e){
      System.out.println("File not found: " + fileName);
      System.exit(1);
    }
  }
}
