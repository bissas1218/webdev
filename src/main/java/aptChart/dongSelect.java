package aptChart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import webdev.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

/**
 * Servlet implementation class dongSelect
 */
@WebServlet("/dongSelect")
public class dongSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dongSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println(request.getParameter("dongCode").substring(0,5)+" "+request.getParameter("dongCode").substring(5,10));
		
		DBConnection dbconn = new DBConnection();
		Connection con = dbconn.dbConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<DongCodeVO> aptList = new ArrayList<DongCodeVO>();
		String dongCode1 = request.getParameter("dongCode").substring(0,5);
		String dongCode2 = request.getParameter("dongCode").substring(5,10);
		
		try {
			String sql = "select apt_seq, apt_nm from apt_30000 where sgg_cd = ? and umd_cd = ? group by apt_seq , apt_nm";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dongCode1);
			pstmt.setString(2, dongCode2);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				System.out.println(rs.getString(1));
				DongCodeVO dongCdVO = new DongCodeVO();
				dongCdVO.setCode(rs.getString(1));
				dongCdVO.setName(rs.getString(2));
				aptList.add(dongCdVO);
			}
			
		}catch(SQLException e) {
			
		}finally {
			try {

				if (pstmt != null) {
					pstmt.close();
				}
				
				if (con != null && !con.isClosed()) {
					con.close();
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("aptList", aptList);
		
		response.setContentType("application/x-json; charset=utf-8");
		response.getWriter().print(jObj);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
