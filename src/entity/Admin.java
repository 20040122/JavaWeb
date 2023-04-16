package entity;

public class Admin {
    private String ano;
    private String apd;

    public Admin() {
        super();
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getApd() {
        return apd;
    }

    public void setApd(String apd) {
        this.apd = apd;
    }

    public Admin(String ano, String apd) {
        super();
        this.ano = ano;
        this.apd = apd;
    }
}

