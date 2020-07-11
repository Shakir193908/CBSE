/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import connection.SQLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Shakir
 */
@ManagedBean
@RequestScoped
public class BankController {

    private String bankname;
    int userid = 1;
    private ArrayList<String> banklist = new ArrayList<String>();

    public BankController() {
    }
    
    //inserting bank name into database
    public String insertBankname() {
        Statement st;
        try {
            st = SQLConnection.getInstance().getSQLConnection();
            Connection con = st.getConnection();

            PreparedStatement stmt;
            stmt = con.prepareStatement("insert into bank(bankname,user_id) values(?,?)");
            stmt.setString(1, bankname);
            stmt.setInt(2, userid);
            stmt.executeUpdate();
            con.close();
            return "Insert Succesfully";

        } catch (SQLException ex) {
            Logger.getLogger(BankController.class.getName()).log(Level.SEVERE, null, ex);
            return "Insertion Fail";
        }
    }
    
    //getting bank list from the database
    public ArrayList getBanklist() {
        Statement st;
        try {
            st = SQLConnection.getInstance().getSQLConnection();
            Connection con = st.getConnection();

            st = con.createStatement();
            String sql = "Select bankname from bank where user_id = " + userid;
            ResultSet result;
            result = st.executeQuery(sql);
            while (result.next()) {
                banklist.add(result.getString("bankname"));
            }

            con.close();
            return banklist;

        } catch (SQLException ex) {
            Logger.getLogger(BankController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return banklist;
    }
    
    //setter and getter
    public String getBankname() {
        return bankname;
    }

    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

}