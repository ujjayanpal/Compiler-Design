import syntaxtree.*;
import visitor.*;
public class P4 {
public static void main(String [] args) {
    try {
        Node root = new microIRParser(System.in).Goal();
        GJDepthFirst g = new GJDepthFirst<>();
        GJDepthFirst1 g1 = new GJDepthFirst1<>();
        GJDepthFirst2 g2 = new GJDepthFirst2<>();
        //GJDepthFirst1 g3 = new GJDepthFirst3<>();
        //GJDepthFirst1 g4 = new GJDepthFirst4<>();
        Object value = root.accept(g,null);
        Object value1 = root.accept(g1, value);
        Object value2 = root.accept(g2, value1);
        // new MiniJavaParser(System.in).Goal();
        //System.out.println("Program parsed successfully");
    }
    catch (ParseException e) {
    System.out.println(e.toString());
    }
  }
}




