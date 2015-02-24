package Questions;

import java.util.ArrayList;

/**
 * Created by coco on 23/02/15.
 */
public class MegaListe {

    private String name;
    public ArrayList<String> listeInterne = new ArrayList<String>();

    public MegaListe(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
