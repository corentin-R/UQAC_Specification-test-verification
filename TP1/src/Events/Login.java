package Events;

/**
 * Created by coco on 19/02/15.
 */
public class Login extends EventNode{

    private String password;

    /**
     * constructeur par défaut -> unknown event
     */
    public Login() {
        super();
    }

    /**
     * construceur spécifique au Login
     * @param t
     * @param password
     */
    public Login(int t, String user, String password) {
        super(t, user);
        this.eventType = "login";
        this.password = password;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
