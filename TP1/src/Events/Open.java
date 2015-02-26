package Events;

/**
 * Created by coco on 25/02/15.
 */
public class Open extends EventNode {

    private String name;

    public Open(int t,  String user, String name) {
        super(t, user);
        this.name = name;
        this.eventType = "open";
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
