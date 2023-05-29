package model;

import java.sql.SQLException;

public class User {
    //Atributos
    private int userCod;
    private String userName;
    private String userPass;
    private String userEmail;
    
    //Contrutor
    public User(String user, String pass) {
        this.userName = user;
        this.userPass = pass;
    }
    
    public User(){}
    
    public User(int cod, String user, String pass) {
        this.userCod = cod;
        this.userName = user;
        this.userPass = pass;
    }
    
    //Getter & Setters

    public int getUserCod() {
        return userCod;
    }

    public void setUserCod(int userCod) {
        this.userCod = userCod;
    }
    
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String name) {
        this.userName = name;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    
    //toString - Representação genérica do objeto
    @Override
    public String toString() {
        return "<hr>Nome: " + this.userName +
                "<br>Email: "  + this.userEmail +
                "<br>Senha: " + this.userPass;
    }
    
    //Métodos gerais
    public boolean isLogged() throws ClassNotFoundException, SQLException {
        UserDAO udao = new UserDAO();
        User uBanco = udao.listOneUser(this.userName);
        
        
        if(uBanco.getUserName() != null) {
            return (uBanco.getUserPass().equals(this.userPass));
        } else {
            return false;
        }
    }
    
} //Fim da classe