import Events.EventNode;
import Parser.ReadXML;
import Questions.*;

import java.util.ArrayList;

/**
 * Created by coco on 21/02/15.
 */
public class Main {

    //q°: ouvrir doc?
    // time en sec?
    // fct° affine droite
    //autre logs pour vérifier
    //applications simulatnée click, write, launch
    //robustesse ou performance ou fonctionnalités

    public static void main(String argv[]) {

        if(argv.length != 2)
            System.out.println("Paramètre à la ligne de commande invalide");
        else {
            System.out.println("Question #"+argv[1]);
            choixQuestion(Integer.parseInt(argv[1]), ReadXML.Read(argv[0]));
        }
    }

    private static void choixQuestion(int num, ArrayList<EventNode>  listeEvents ){
        switch(num){
            case 1:
                Question1.search(listeEvents);
                break;
            case 2:
                Question2.search(listeEvents);
                break;
            case 3:
                 Question3.search(listeEvents);
                break;
            case 4:
                // Question4.search(listeEvents);
                break;
            case 5:
                Question5.search(listeEvents);
                break;
            default:
                System.out.println("Paramètre à la ligne de commande invalide");
        }
    }
}
