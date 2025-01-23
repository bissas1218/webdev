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
 * Servlet implementation class guSelect
 */
@WebServlet("/guSelect")
public class guSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	System.out.println(request.getParameter("guCode").substring(0,5));
		
		DBConnection dbconn = new DBConnection();
		Connection con = dbconn.dbConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String searchStartYear = request.getParameter("searchStartYear");
		String searchStartMonth = request.getParameter("searchStartMonth");
		String searchEndYear = request.getParameter("searchEndYear");
		String searchEndMonth = request.getParameter("searchEndMonth");
		if(searchStartMonth.length()==1) {
			searchStartMonth = "0"+searchStartMonth;
		}
		if(searchEndMonth.length()==1) {
			searchEndMonth = "0"+searchEndMonth;
		}
		
		List<DongCodeVO> dongList = new ArrayList<DongCodeVO>();
		String guCode = request.getParameter("guCode").substring(0,5);
		
		try {
			String sql = "select A.code, A.dong, (select count(*) from apt_"+guCode.substring(0,2)+"000 where sgg_cd = A.code1 and umd_cd = A.code2 "
					+ "and date(concat(deal_year, if(length(deal_month) = 1, concat('0', deal_month), deal_month), '01')) between concat(?,'-',?,'-01') and concat(?,'-',?,'-01') ) dongCnt "
					+ "from (select code, substring_index(name, ' ', -1) dong, substr(code,1,5) code1, substr(code,6,10) code2 "
					+ "from dong_code where code like ? and code != concat(?,'00000') "
					+ "and use_yn = 'Y') A order by A.dong";
			//System.out.println(sql);
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, searchStartYear);
			pstmt.setString(2, searchStartMonth);
			pstmt.setString(3, searchEndYear);
			pstmt.setString(4, searchEndMonth);
			pstmt.setString(5, guCode+"%");
			pstmt.setString(6, guCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			//	System.out.println(rs.getString(1));
				DongCodeVO dongCdVO = new DongCodeVO();
				dongCdVO.setCode(rs.getString(1));
				dongCdVO.setName(rs.getString(2));
				dongCdVO.setCnt(rs.getInt(3));
				dongList.add(dongCdVO);
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
		jObj.put("dongList", dongList);
		
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
