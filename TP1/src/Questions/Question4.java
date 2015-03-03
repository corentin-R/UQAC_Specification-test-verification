package Questions;

import Algo.Droite;
import Algo.Point;
import Events.Click;
import Events.EventNode;

import java.util.ArrayList;

/**
 * QUESTION 4
 * Quelles sont les extrémités de chaque "ligne"?
 * Une ligne est un patron de trois clics successifs
 * effectués par l'utilisateur dans la même application,
 * et dont les coordonnées x-y se situent sur une même droite.
 */
public class Question4 {

    public static int search(ArrayList<EventNode> listeEvents) {

        ArrayList<Droite> listeDroites = new ArrayList<Droite>();
        int nbDroites = 0;

        for (EventNode e : listeEvents) {
            if (e.getEventType().equals("click")) {


                //si la droite n'est pas dans la liste (pas même user ou pas même app)
                if (!isInList(listeDroites, e)) {
                    listeDroites.add(new Droite(e.getUser(), e.getApp()));
                }

                //on ajoute un point à cette droite
                Droite d = addPointToDroite(listeDroites, e);

                if (d.getIncrementDroite() == 3) {

                    //verif si les 3 pts font une droite
                    if (d.isDroite()) {
                        nbDroites++;
                        System.out.println("droite #"+nbDroites+ ": ");
                        //retourne les extremités
                        d.extremite();
                    }
                    //rm droite
                    listeDroites.remove(d);
                }
            }
        }
        System.out.println("Il y a "+nbDroites+" droites dans ce fichier");
        return 0;
    }

    private static boolean isInList(ArrayList<Droite> droites, EventNode e) {
        boolean isIn = false;

        if (droites.isEmpty())
            return false;

        for (Droite d : droites) {
            if (e.getUser().equals(d.getUser()) && e.getApp().equals(d.getApp())) {
                //le points appartiens déjà à une droite d'un user
                isIn = true;
            }
        }
        return isIn;
    }

    private static Droite addPointToDroite(ArrayList<Droite> droites, EventNode e) {
        if (isInList(droites, e)) {
            for (Droite d : droites) {
                if (e.getUser().equals(d.getUser()) && e.getApp().equals(d.getApp())) {

                    d.addPoint(new Point(((Click) e).getX(), ((Click) e).getY()));
                    return d;
                }
            }
        }
        return new Droite("null", "null");
    }
}
