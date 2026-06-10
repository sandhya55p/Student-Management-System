package Servletjava;

import java.sql.*;

public class ConnectionDb {

    public Connection getConnect() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/kitts",
                "root",
                "Sandhya@*2004"
        );
    }

    // 🔽 GET DATA
    public ResultSet getData() throws Exception {
        Connection con = getConnect();
        Statement st = con.createStatement();
        return st.executeQuery("SELECT * FROM student");
    }

    // 🔽 INSERT
 // 🔽 INSERT
    public void insertData(
    		String name,
    		String email,
    		String course,
    		String phone,
    		String address,
    		String gender,
    		String status,
    		String image
    		) throws Exception {

    		    Connection con = getConnect();

    		    PreparedStatement ps =
    		    con.prepareStatement(

    		    "INSERT INTO student(name,email,course,phone,address,gender,status,image) VALUES(?,?,?,?,?,?,?,?)"
    		    );

    		    ps.setString(1, name);
    		    ps.setString(2, email);
    		    ps.setString(3, course);
    		    ps.setString(4, phone);
    		    ps.setString(5, address);
    		    ps.setString(6, gender);
    		    ps.setString(7, status);
    		    ps.setString(8, image);

    		    ps.executeUpdate();

    		    con.close();
    		}
    // 🔽 DELETE
    public void deleteData(int id) throws Exception {
        Connection con = getConnect();

        PreparedStatement ps = con.prepareStatement(
                "DELETE FROM student WHERE id=?"
        );

        ps.setInt(1, id);
        ps.executeUpdate();

        con.close();
    }
    public ResultSet getSingleData(int id)
            throws Exception {

        Connection con = getConnect();

        PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM student WHERE id=?"
        );

        ps.setInt(1, id);

        return ps.executeQuery();
    }
    public void updateData(
    		int id,
    		String name,
    		String email,
    		String course,
    		String phone,
    		String address,
    		String gender,
    		String status,
    		String image
    		) throws Exception {

    		    Connection con = getConnect();

    		    PreparedStatement ps =
    		    con.prepareStatement(

    		    "UPDATE student SET name=?, email=?, course=?, phone=?, address=?, gender=?, status=?, image=? WHERE id=?"
    		    );

    		    ps.setString(1, name);
    		    ps.setString(2, email);
    		    ps.setString(3, course);
    		    ps.setString(4, phone);
    		    ps.setString(5, address);
    		    ps.setString(6, gender);
    		    ps.setString(7, status);
    		    ps.setString(8, image);

    		    ps.setInt(9, id);

    		    ps.executeUpdate();

    		    con.close();
    		}
    public boolean checkLogin(String email,
            String password)
throws Exception {

Connection con = getConnect();

PreparedStatement ps = con.prepareStatement(

"SELECT * FROM admin WHERE email=? AND password=?"
);

ps.setString(1, email);

ps.setString(2, password);

ResultSet rs = ps.executeQuery();

return rs.next();
}
    public int getStudentCount()
            throws Exception {

        Connection con = getConnect();

        PreparedStatement ps = con.prepareStatement(

            "SELECT COUNT(*) FROM student"
        );

        ResultSet rs = ps.executeQuery();

        int count = 0;

        if(rs.next()){

            count = rs.getInt(1);
        }

        con.close();

        return count;
    }
    public ResultSet getPaginatedData(
    		int start,
    		int total
    		) throws Exception {

    		    Connection con = getConnect();

    		    PreparedStatement ps =
    		    con.prepareStatement(
    		    "SELECT * FROM student LIMIT ?, ?"
    		    );

    		    ps.setInt(1, start);

    		    ps.setInt(2, total);

    		    return ps.executeQuery();
    		}
    public int getStudentCount1()
    		throws Exception {

    		    Connection con = getConnect();

    		    Statement st =
    		    con.createStatement();

    		    ResultSet rs =
    		    st.executeQuery(
    		    "SELECT COUNT(*) FROM student"
    		    );

    		    int count = 0;

    		    if(rs.next()){

    		        count = rs.getInt(1);
    		    }

    		    return count;
    		}
    public int getActiveStudents()
    		throws Exception {

    		    Connection con = getConnect();

    		    Statement st =
    		    con.createStatement();

    		    ResultSet rs =
    		    st.executeQuery(
    		    "SELECT COUNT(*) FROM student WHERE status='Active'"
    		    );

    		    int count = 0;

    		    if(rs.next()){

    		        count = rs.getInt(1);
    		    }

    		    return count;
    		}
    public int getInactiveStudents()
    		throws Exception {

    		    Connection con = getConnect();

    		    Statement st =
    		    con.createStatement();

    		    ResultSet rs =
    		    st.executeQuery(
    		    "SELECT COUNT(*) FROM student WHERE status='Inactive'"
    		    );

    		    int count = 0;

    		    if(rs.next()){

    		        count = rs.getInt(1);
    		    }

    		    return count;
    		}
    public int getMaleStudents()
    		throws Exception {

    		    Connection con = getConnect();

    		    Statement st =
    		    con.createStatement();

    		    ResultSet rs =
    		    st.executeQuery(
    		    "SELECT COUNT(*) FROM student WHERE gender='Male'"
    		    );

    		    int count = 0;

    		    if(rs.next()){

    		        count = rs.getInt(1);
    		    }

    		    return count;
    		}
    public int getFemaleStudents()
    		throws Exception {

    		    Connection con = getConnect();

    		    Statement st =
    		    con.createStatement();

    		    ResultSet rs =
    		    st.executeQuery(
    		    "SELECT COUNT(*) FROM student WHERE gender='Female'"
    		    );

    		    int count = 0;

    		    if(rs.next()){

    		        count = rs.getInt(1);
    		    }

    		    return count;
    		}
}