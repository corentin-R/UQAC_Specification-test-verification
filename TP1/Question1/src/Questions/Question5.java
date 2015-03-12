package Questions;

import Events.EventNode;

import java.util.ArrayList;

/**
 * QUESTION 5
 * Y a-t-il eu des attaques de force brute en ligne contre
 * le système d'authentification? Pour les besoins du travail,
 * une attaque de force brute survient lorsqu'un utilisateur
 * échoue son login plus de trois fois dans la même minute.
 * Pour chaque attaque, on doit retourner le nom de
 * l'utilisateur et l'heure du premier login échoué.
 */
public class Question5 {

    public static boolean search(ArrayList<EventNode> listeEvents){

        boolean resultat = false;
        int increment = 0;

        for (EventNode e: listeEvents) {
            increment++;
            if(e.getEventType().equals("login-failure")){
                String user = e.getUser();
                int t = e.getTime();
                int cpt = 1;
                ArrayList<EventNode> copie = new ArrayList<EventNode>(listeEvents.subList(increment,listeEvents.size()));
                for (EventNode e1: copie){
                    if(e1.getEventType().equals("login-failure") && user.equals(e1.getUser())){
                        if(e1.getTime()-t<60 && e1.getTime()!=e.getTime())
                            cpt++;
                        if(cpt==3 && e1.getTime()-t<60){
                            resultat=true;
                            System.out.println("user: "+user+" -> brute force détecté, time: "+e1.getTime());
                        }
                    }
                }
            }
        }
        if (resultat)
            System.out.println("Il y a eu au moins une attaque de force brute.");
        else
            System.out.println("Il y a n'y a pas eu attaques de force brute.");

        return resultat;
    }
}
