package entity;

public class Food {
    private String fid;
    private String fname;
    private String cd;
    public Food() {
        super();
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getCd() {
        return cd;
    }

    public void setCd(String cd) {
        this.cd = cd;
    }
    public Food(String fid, String fname, String cd) {
        super();
        this.fid = fid;
        this.fname = fname;
        this.cd = cd;
    }
    @Override
    public String toString() {
        return "Food{" +
                "fid='" + fid + '\'' +
                ", fname='" + fname + '\'' +
                ", cd='" + cd + '\'' +
                '}';
    }


}
