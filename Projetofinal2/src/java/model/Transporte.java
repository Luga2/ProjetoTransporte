package model;

public class Transporte {
        private int codTransporte;
        private String tipo;
        private int assentos;
        private String combustivel;

    public Transporte(){}    
        
    public Transporte(String tipo, int assentos, String combustivel) {
        this.tipo = tipo;
        this.assentos = assentos;
        this.combustivel = combustivel;
    }
    
    public Transporte(int id, String tipo, int assentos, String combustivel) {
        this.codTransporte = id;
        this.tipo = tipo;
        this.assentos = assentos;
        this.combustivel = combustivel;
    }

    public int getCodTransporte() {
        return codTransporte;
    }

    public void setCodTransporte(int codTransporte) {
        this.codTransporte = codTransporte;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getAssentos() {
        return assentos;
    }

    public void setAssentos(int assentos) {
        this.assentos = assentos;
    }

    public String getCombustivel() {
        return combustivel;
    }

    public void setCombustivel(String combustivel) {
        this.combustivel = combustivel;
    }
        
        
}
