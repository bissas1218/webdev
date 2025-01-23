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
 * Servlet implementation class sidoDealAmount
 */
@WebServlet("/guDealAmount")
public class guDealAmount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public guDealAmount() {
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
		
		String guCode = request.getParameter("guCode").substring(0,5);
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
		
		JSONObject jObj = new JSONObject();
		
		String table_nm = "";
		if(guCode.equals("36110")) {
			table_nm = "36110";
		}else {
			table_nm = guCode.substring(0,2)+"000";
		}
		
		try {
			
			// 기간구하기
			String sql = "select deal_year , deal_month from apt_"+table_nm+" "
					+ "where sgg_cd = ? "
					+ "and date(concat(deal_year, if(length(deal_month) = 1, concat('0', deal_month), deal_month), '01')) between concat(?,'-',?,'-01') and concat(?,'-',?,'-01') "
					+ "group by deal_year , deal_month order by cast(deal_year as unsigned) asc, cast(deal_month as unsigned) asc";
			//System.out.println(table_nm+", "+guCode);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, guCode);
			pstmt.setString(2, searchStartYear);
			pstmt.setString(3, searchStartMonth);
			pstmt.setString(4, searchEndYear);
			pstmt.setString(5, searchEndMonth);
			rs = pstmt.executeQuery();
			
			List<String> dealDate = new ArrayList<String>();
			List<String> dealDate2 = new ArrayList<String>();
			int k=0;
			
			while(rs.next()) {

				if(rs.getString(2).length()==1) {
					
					dealDate.add(rs.getString(1)+"0"+rs.getString(2));	
					
					if(k%12==0) {
						dealDate2.add(rs.getString(1)+"0"+rs.getString(2));	
					}else {
						dealDate2.add("0"+rs.getString(2));
					}
					
				}else {
					
					dealDate.add(rs.getString(1)+rs.getString(2));
					
					if(k%12==0) {
						dealDate2.add(rs.getString(1)+rs.getString(2));
					}else {
						dealDate2.add(rs.getString(2));
					}
				}
				k++;
			}
			
			jObj.put("dealDate2", dealDate2);
			jObj.put("dealDate", dealDate);
			
			// 실거래가 구하기
			ArrayList<String> dealAmountSum = new ArrayList<String>();
			for(int s=0; s<dealDate.size(); s++) {
				//System.out.println(dealDate.get(s));
				
				sql = "select sum(replace(deal_amount,',','')) sum_deal_amt from apt_"+table_nm+" where sgg_cd = ? and deal_year = ? and deal_month = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, guCode);
				pstmt.setString(2, dealDate.get(s).substring(0,4));
				pstmt.setInt(3, Integer.parseInt(dealDate.get(s).substring(4,6)));
				rs = pstmt.executeQuery();
				rs.next();
				//System.out.println(dealDate.get(s).substring(0,4)+", "+Integer.parseInt(dealDate.get(s).substring(4,6)));
				dealAmountSum.add(rs.getString(1));
			}
			
			jObj.put("dealAmountSum", dealAmountSum);
			
			// 월별 거래량 구하기
			ArrayList<String> monthDealCnt = new ArrayList<String>();
			for(int s=0; s<dealDate.size(); s++) {
				//System.out.println(dealDate.get(s));
				
				sql = "select count(*) from apt_"+table_nm+" where sgg_cd = ? and deal_year = ? and deal_month = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, guCode);
				pstmt.setString(2, dealDate.get(s).substring(0,4));
				pstmt.setInt(3, Integer.parseInt(dealDate.get(s).substring(4,6)));
				rs = pstmt.executeQuery();
				rs.next();
				//System.out.println(rs.getString(1));
				monthDealCnt.add(rs.getString(1));
			}
			
			jObj.put("monthDealCnt", monthDealCnt);
			
		}catch(SQLException e) {
			
		}finally {
			try {

				if (pstmt != null) {
					pstmt.close();
				}
				
				if (con != null && !con.isClosed()) {
					con.close();
				}
				
				if(rs != null) {
					rs.close();
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
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
