package entity;

public class Orders {
    private  String fid;
    private  String sid;
    private  String sname;
    private  String fname;
    public Orders() {
        super();
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "fid='" + fid + '\'' +
                ", sid='" + sid + '\'' +
                ", sname='" + sname + '\'' +
                ", fname='" + fname + '\'' +
                '}';
    }

    public Orders(String fid, String sid, String sname, String fname) {
        super();
        this.fid = fid;
        this.sid = sid;
        this.sname = sname;
        this.fname = fname;
    }
}
