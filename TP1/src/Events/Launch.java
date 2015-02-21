package Events;

/**
 * Created by coco on 19/02/15.
 */
public class Launch extends EventNode{

    private String application;

    public Launch(int t, String application, String user) {
        super(t, user);
        this.application = application;
        this.eventType = "launch";
    }

    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application;
    }
}
