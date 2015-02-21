import Events.EventNode;
import Parser.ReadXML;
import Questions.Question1;

import java.util.ArrayList;

/**
 * Created by coco on 21/02/15.
 */
public class Main {

    public static void main(String argv[]) {

        System.out.println("Question #"+argv[1]);
        ArrayList<EventNode>  listeEvents =  ReadXML.Read(argv[0]);
        switch(Integer.parseInt(argv[1])){
            case 1:
                Question1.search(listeEvents);
                break;
        }

    }
}
