import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class DBConn {

	public static Connection getInstance() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("mysql/ezen1");
			Connection conn = ds.getConnection();
			System.out.println("mysql con success");
			return conn;
			
		} catch (Exception e) {
			System.out.println("mysql con fail" + e.getMessage());
		}
		return null;
	}
}