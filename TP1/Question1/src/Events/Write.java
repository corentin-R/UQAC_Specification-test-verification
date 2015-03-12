package Events;

/**
 * Created by coco on 19/02/15.
 */
public class Write extends EventNode {

    private String application;
    private String name;

    public Write(int t, String user, String application, String name) {
        super(t, user);
        this.application = application;
        this.name = name;
        this.eventType = "write";
    }

    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
