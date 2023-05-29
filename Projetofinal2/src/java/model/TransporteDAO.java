package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TransporteDAO {
        private static Connection conn;
        
        public TransporteDAO() throws ClassNotFoundException, SQLException {
            conn = MyConn.getConnection();
        }
        
        //Método para inserir dados
        public void insertTransporte(Transporte transp) {
            //Query genérica para o método inserir
            String sql = "INSERT INTO transportes(tipo, assentos, combustivel)"
                                + "VALUES(?, ?, ?)";
            
            //Objeto para preparar o envio da query ao banco de dados
            try {
                PreparedStatement prep = conn.prepareStatement(sql);
                prep.setString(1, transp.getTipo());
                prep.setInt(2, transp.getAssentos());
                prep.setString(3,  transp.getCombustivel());
                
                prep.execute();
                prep.close();
                
            } catch (SQLException erro) {
                System.out.println("Erro ao inserir..." + erro);
            }
        }//Fim do método inserir
        
        
        public ArrayList<Transporte> listTransporte() throws SQLException{
            ArrayList<Transporte> list = new ArrayList<>();
            
            String sql = "select * from transportes";
            
            PreparedStatement prep = conn.prepareStatement(sql);
            ResultSet result = prep.executeQuery();
            
            while(result.next()){
              Transporte t = new Transporte();
              
              t.setCodTransporte(result.getInt("cod_transporte"));
              t.setTipo(result.getString("tipo"));
              t.setAssentos(result.getInt("assentos"));
              t.setCombustivel(result.getString("combustivel"));
              
              list.add(t);
            }
            
            return list;
        }
        
        
        public void deleteTransporte(int id) throws SQLException {
            String query = "DELETE FROM transportes WHERE "
                    + "cod_transporte = " + id;
            
            PreparedStatement prep = conn.prepareStatement(query);
            
            prep.execute();
            prep.close();
        }
        
        
        public Transporte listOneTransporte(int id) throws SQLException {
            String query = "SELECT * FROM transportes WHERE "
                    + "cod_transporte = " + id;
            
            PreparedStatement prep = conn.prepareStatement(query);
            ResultSet result = prep.executeQuery();
            
            Transporte tr = new Transporte();
            
            if(result.next()){
                tr.setCodTransporte(result.getInt("cod_transporte"));
                tr.setTipo(result.getString("tipo"));
                tr.setAssentos(result.getInt("assentos"));
                tr.setCombustivel(result.getString("combustivel"));
            }
            
            return tr;
        }
        
        
        public void updateTransporte(Transporte t) throws SQLException {
            String sql = "UPDATE transportes SET tipo = ?,"
                    + "assentos = ?, combustivel = ?"
                    + "WHERE cod_transporte = ?";
            
            PreparedStatement prep = conn.prepareStatement(sql);
            
            prep.setString(1, t.getTipo());
            prep.setInt(2, t.getAssentos());
            prep.setString(3, t.getCombustivel());
            prep.setInt(4, t.getCodTransporte());
            
            prep.execute();
            prep.close();
        }
        
}//Fim da classe
