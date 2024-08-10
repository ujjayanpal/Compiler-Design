import syntaxtree.*;
import visitor.*;
public class P3 {
public static void main(String [] args) {
    try {
        Node root = new MiniJavaParser(System.in).Goal();
        GJDepthFirst g = new GJDepthFirst<>();
        GJDepthFirst1 g1 = new GJDepthFirst1<>();

        Object value = root.accept(g,null);
        Object value1 = root.accept(g1, value);
        // new MiniJavaParser(System.in).Goal();
        //System.out.println("Program parsed successfully");
    }
    catch (ParseException e) {
    System.out.println(e.toString());
    }
  }
}




