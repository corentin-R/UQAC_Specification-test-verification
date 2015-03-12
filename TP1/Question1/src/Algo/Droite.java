package Algo;

/**
 * Created by coco on 24/02/15.
 */
public class Droite {

    public Point[] pts = new Point[3];
    private String user;
    private String app;
    private int incrementDroite;

    public Droite(String user, String app) {
        this.user = user;
        this.app = app;
        incrementDroite = 0;
    }

    public void addPoint(Point p) {
        pts[incrementDroite] = p;
        incrementDroite++;
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

    public int getIncrementDroite() {
        return incrementDroite;
    }

    public void setIncrementDroite(int incrementDroite) {
        this.incrementDroite = incrementDroite;
    }

    public boolean isDroite() {
        //droie affine y=ax+b
        int a = 0, b = 0;

        //on vérifit que a!=infini (droite vericale)
        if (pts[0].getX() != pts[1].getX()
                && pts[0].getX() != pts[2].getX()
                && pts[1].getX() != pts[2].getX()) {

            float a1 = (float)(pts[0].getY() - pts[1].getY()) / (pts[0].getX() - pts[1].getX());
            float a2 = (float)(pts[2].getY() - pts[1].getY()) / (pts[2].getX() - pts[1].getX());

            //System.out.println(a2);

            if (a1 != a2) {
                return false;
            } else
                return true;
        } else if (pts[0].getX() == pts[1].getX()
                && pts[0].getX() == pts[2].getX()
                && pts[1].getX() == pts[2].getX()) {
            return true;
        } else
            return false;
    }

    public void extremite() {
        //on vérifit que a!=infini (droite vericale)
        if (pts[0].getX() != pts[1].getX()
                && pts[0].getX() != pts[2].getX()
                && pts[1].getX() != pts[2].getX()) {
            System.out.println("extremité 1: x=" + min().getX() + " y=" + min().getY());
            System.out.println("extremité 2: x=" + max().getX() + " y=" + max().getY());
            System.out.println();

        } else if (pts[0].getX() == pts[1].getX()
                && pts[0].getX() == pts[2].getX()
                && pts[1].getX() == pts[2].getX()) {
            System.out.println("extremité 1: x=" + minY().getX() + " y=" + minY().getY());
            System.out.println("extremité 2: x=" + maxY().getX() + " y=" + maxY().getY());
            System.out.println();

        }
    }

    public Point min() {
        int min = pts[0].getX();
        int indice = 0;
        for (int i = 0; i < 3; i++) {
            if (pts[i].getX() <= min) {
                min = pts[i].getX();
                indice = i;
            }
        }
        return pts[indice];
    }

    public Point max() {
        int max = pts[0].getX();
        int indice = 0;
        for (int i = 0; i < 3; i++) {
            if (pts[i].getX() >= max) {
                max = pts[i].getX();
                indice = i;
            }
        }
        return pts[indice];
    }


    public Point minY() {
        int min = pts[0].getY();
        int indice = 0;
        for (int i = 0; i < 3; i++) {
            if (pts[i].getY() <= min) {
                min = pts[i].getX();
                indice = i;
            }
        }
        return pts[indice];
    }

    public Point maxY() {
        int max = pts[0].getY();
        int indice = 0;
        for (int i = 0; i < 3; i++) {
            if (pts[i].getY() >= max) {
                max = pts[i].getX();
                indice = i;
            }
        }
        return pts[indice];
    }

}
