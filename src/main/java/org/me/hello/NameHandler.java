
package org.me.hello;

public class NameHandler {

    private String nomUsuari;
    private String nomICognom;
    private String telefon;
    private String correuE;

    /** Creates a new instance of NameHandler */
    public NameHandler() {
        setNomUsuari(null);
    }

    public String getNomUsuari() {
        return nomUsuari;
    }

    public void setNomUsuari(String nomUsuari) {
        this.nomUsuari = nomUsuari;
    }

    public String getNomICognom() {
        return nomICognom;
    }

    public void setNomICognom(String nomICognom) {
        this.nomICognom = nomICognom;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }
    
    public String getCorreuE() {
        return correuE;
    }

    public void setCorreuE(String correuE) {
        this.correuE = correuE;
    }

}
