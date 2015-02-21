package Events;

/**
 * Created by coco on 19/02/15.
 */
public class Click extends EventNode{

    private String application;
    private int x;
    private int y;

    public Click(int t, String user, String application, int x, int y) {
        super(t, user);
        this.application = application;
        this.x = x;
        this.y = y;
        this.eventType = "click";
    }

    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application;
    }

    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }
}
