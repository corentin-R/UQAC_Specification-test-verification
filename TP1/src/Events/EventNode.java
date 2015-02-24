package Events;

/**
 * Created by coco on 19/02/15.
 */
public class EventNode {

    protected int time;
    protected String eventType;
    protected String user;
    protected String app = "null";


    /**
     * constructeur par défaut -> unknown event
     */
    public EventNode() {
        this.time = -1;
        this.eventType = "unknown";
        this.user = "Bob";
    }

    /**
     * constructeur avec eventtype
     *
     * @param eventType
     */
    public EventNode(int t, String eventType, String user) {
        this.time = t;
        this.eventType = eventType;
        this.user = user;
    }

    /**
     * juste le temps et le user
     *
     * @param t
     */
    public EventNode(int t, String user) {
        this.time = t;
        this.user = user;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getApp() {
        return app;
    }

    public void setApp(String app) {
        this.app = app;
    }
}
