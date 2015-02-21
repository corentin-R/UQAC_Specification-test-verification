package Questions;

import Events.EventNode;
import java.util.ArrayList;

/**
 * QUESTION 1
 * Y a-t-il une session qui dure plus d'une heure?
 * (Une session étant ouverte au moyen d'un "login"
 * et fermée au moyen d'un "logout" pour un même utilisateur.)
 */
public class Question1 {

    public static int search(ArrayList<EventNode> listeEvents){

       int resultat = 0;

        for (EventNode e: listeEvents) {
            if(e.getEventType().equals("login")){
                String user = e.getUser();
                for (EventNode e1: listeEvents){
                    if(e1.getEventType().equals("logout") && user.equals(e1.getUser())){
                        int duree =e1.getTime()-e.getTime();

                        if(duree/60>60){
                            resultat++;
                            System.out.println("user: "+user+" -> durée session: " + duree/60 +" min");
                        }
                    }
                }
            }
        }

        System.out.println("Il y a "+resultat+" session(s) qui ont duré plus d'une heure");
        return resultat;
    }
}
