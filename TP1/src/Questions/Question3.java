package Questions;

import Events.Click;
import Events.EventNode;
import Events.Launch;
import Events.Write;

import java.util.ArrayList;

/**
 * QUESTION 3
 * Quel est le nom de toutes les applications ayant
 * été utilisées simultanément par au moins deux
 * utilisateurs (i.e. ouvertes par au moins deux
 * utilisateurs dans des sessions parallèles)?
 */
public class Question3 {

    public static int search(ArrayList<EventNode> listeEvents) {

        int resultat = 0;

        ArrayList<String> usersActuels = new ArrayList<String>();
        ArrayList<MegaListe> listeApplications = new ArrayList<MegaListe>();
        ArrayList<String> nomsApplcationsParalleles = new ArrayList<String>();

        for (EventNode e : listeEvents) {

            if (e.getEventType().equals("login-success")) {
                usersActuels.add(e.getUser());
            } else if (e.getEventType().equals("logout")) {
                for (MegaListe mliste : listeApplications) {
                    if (mliste.listeInterne.contains(e.getUser()))
                        mliste.listeInterne.remove(e.getUser());
                }
                usersActuels.remove(e.getUser());
            } else if (e.getEventType().equals("launch")
                    || e.getEventType().equals("write")
                    || e.getEventType().equals("click")) {

                 if (listeApplications.isEmpty()) {
                    MegaListe m = new MegaListe(e.getApp());
                    m.listeInterne.add(e.getUser());
                    listeApplications.add(m);

                } else {

                    boolean isInList = false;
                    for (MegaListe mliste : listeApplications) {

                        if (e.getApp().equals(mliste.getName())) {//l'app est déjà dans la liste
                            isInList = true;
                            if (!(mliste.listeInterne.contains(e.getUser()))//l'user n(est pas déjà dans la liste
                                   /* && usersActuels.contains(e.getUser())*/){//l'user est actif
                                mliste.listeInterne.add(e.getUser());
                               // System.out.println(e.getApp()+" "+e.getUser());
                                if(mliste.listeInterne.size()>=2){
                                    System.out.println(e.getApp() + " est utilisée simultanément");
                                    resultat++;
                                }
                            }
                        }
                    }
                    if(isInList==false){
                        MegaListe m4 = new MegaListe(e.getApp());
                        m4.listeInterne.add(e.getUser());
                        listeApplications.add(m4);
                    }
                }
            }
        }


        System.out.println("Il y a eu " + resultat + " application(s) ayant été utilisée(s) simultanément ");
        return resultat;
    }
}
