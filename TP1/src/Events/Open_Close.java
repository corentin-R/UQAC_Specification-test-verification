package Events;

/**
 * Created by coco on 25/02/15.
 */
public class Open_Close extends EventNode {

    private String name;

    public Open_Close(int t, String evtType, String user, String name) {
        super(t, evtType, user);
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
