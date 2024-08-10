import syntaxtree.*;
import visitor.*;
import java.util.*;
public class P2 {
public static void main(String [] args) {
    try {
        Node root = new MiniJavaParser(System.in).Goal();
        
        //Map<String, Map<String, List<String>>> hm2 = new HashMap<String, Map<String, List<String>>>();
        
        

        GJDepthFirst1 g1 = new GJDepthFirst1<>();
        Map<String, Map<String, List<String>>> value1 = (Map<String, Map<String, List<String>>>) root.accept(g1,null);


        
        GJDepthFirst g = new GJDepthFirst<>();       
        Object value = root.accept(g, value1);
        // new MiniJavaParser(System.in).Goal();
        System.out.println("Program type checked successfully");
    }
    catch (ParseException e) {
    System.out.println(e.toString());
    }
  }
}




