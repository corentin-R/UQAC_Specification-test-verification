package Questions;

import Events.EventNode;
import Events.Open_Close;
import Events.Write;

import java.util.ArrayList;

/**
 * QUESTION 2
 * Quel est le nom des fichiers dans lesquels on a essayé d'écrire
 * avant de les avoir ouverts (attention: un même fichier peut avoir
 * été ouvert/fermé plusieurs fois, et par plusieurs utilisateurs)?
 */
public class Question2 {

    public static int search(ArrayList<EventNode> listeEvents){

        ArrayList<String> fichiersOuverts = new ArrayList<String>();

        for (EventNode e: listeEvents) {
            if(e.getEventType().equals("open")  && e instanceof Open_Close ){
                fichiersOuverts.add(((Open_Close) e).getName());
            }else if(e.getEventType().equals("close") && e instanceof Open_Close){
                fichiersOuverts.remove(((Open_Close) e).getName() );
            }
            else if(e.getEventType().equals("write")) {
                if (!fichiersOuverts.contains(((Write) e).getName())) {
                    System.out.println("fichier: " + ((Write) e).getName() + " utilisé sans avoir été ouvert, time: "+e.getTime());
                }
            }
        }


        return 0;
    }
}
