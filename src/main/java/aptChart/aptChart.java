package aptChart;


import jakarta.servlet.RequestDispatcher;
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

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;

/**
 * Servlet implementation class aptChart
 */
@WebServlet("/aptChart")
public class aptChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aptChart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DBConnection dbconn = new DBConnection();
		Connection con = dbconn.dbConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select code, name from dong_code where code like '%00000000' and use_yn = 'Y' \r\n"
					+ "union \r\n"
					+ "select code, name from dong_code where code = '3611000000' and use_yn = 'Y' \r\n"
					+ "order by code";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			List<DongCodeVO> dongCdList = new ArrayList<DongCodeVO>();
			
			while(rs.next()) {
				//System.out.println(rs.getString(1)+" "+rs.getString(2));
				DongCodeVO dongCdVO = new DongCodeVO();
				dongCdVO.setCode(rs.getString(1));
				dongCdVO.setName(rs.getString(2));
				dongCdList.add(dongCdVO);
			}
			
			request.setAttribute("dongCdList", dongCdList);
			
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
		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/openapi/aptChart.jsp");

		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
