package Questions;

import Events.EventNode;

import java.util.ArrayList;

/**
 * QUESTION 2
 * Quel est le nom des fichiers dans lesquels on a essayé d'écrire
 * avant de les avoir ouverts (attention: un même fichier peut avoir
 * été ouvert/fermé plusieurs fois, et par plusieurs utilisateurs)?
 */
public class Question2 {

    public static int search(ArrayList<EventNode> listeEvents){

        for (EventNode e: listeEvents) {
            if(e.getEventType().equals("Click")){

             /*   for (EventNode e1: listeEvents){
                    if(e1.getEventType().equals("logout") && user.equals(e1.getUser())){
                        int duree =e1.getTime()-e.getTime();

                        if(duree/60>60){
                            resultat++;
                            System.out.println("user: "+user+" -> durée session: " + duree/60 +" minutes");
                        }
                    }
                }*/
            }
        }


        return 0;
    }
}
