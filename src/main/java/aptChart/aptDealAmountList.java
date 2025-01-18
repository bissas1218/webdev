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
 * Servlet implementation class aptDealAmountList
 */
@WebServlet("/aptDealAmountList")
public class aptDealAmountList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aptDealAmountList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	//	System.out.println(request.getParameter("aptSeq"));
		String aptSeq = request.getParameter("aptSeq");
		
		DBConnection dbconn = new DBConnection();
		Connection con = dbconn.dbConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		JSONObject jObj = new JSONObject();
		
		try {
			
			// 면적구하기 ㎡
			String sql = "select exclu_use_ar from apt_30000 where apt_seq = ? group by exclu_use_ar order by cast(exclu_use_ar as unsigned) asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aptSeq);
			rs = pstmt.executeQuery();
			
			List<String> excluUseAr = new ArrayList<String>();
			while(rs.next()) {
			//	System.out.println(rs.getString(1));
				excluUseAr.add(rs.getString(1));
			}
			
			jObj.put("excluUseAr", excluUseAr);
			
			// 기간구하기
			sql = "select deal_year , deal_month from apt_30000 where apt_seq = ? group by deal_year , deal_month order by cast(deal_year as unsigned) asc, cast(deal_month as unsigned) asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aptSeq);
			rs = pstmt.executeQuery();
			
			List<String> dealDate = new ArrayList<String>();
			List<String> dealDate2 = new ArrayList<String>();
			int k=0;
			while(rs.next()) {
			//	System.out.println(rs.getString(1)+" "+rs.getString(2));
				
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
			ArrayList<String>[] dealAmount = new ArrayList[excluUseAr.size()];
			for(int i=0; i<excluUseAr.size(); i++) {
				//System.out.println(excluUseAr.get(i));
				
				dealAmount[i] = new ArrayList<String>();
				
				for(int j=0; j<dealDate.size(); j++) {
					
					sql = "select avg(replace(deal_amount,',','')) avg_deal_amt from apt_30000 where apt_seq = ? and deal_year = ? and deal_month = ? and exclu_use_ar = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, aptSeq);
					pstmt.setString(2, dealDate.get(j).substring(0,4));
					pstmt.setInt(3, Integer.parseInt(dealDate.get(j).substring(4,6)));
					pstmt.setString(4, excluUseAr.get(i));
					rs = pstmt.executeQuery();
					rs.next();
					
					dealAmount[i].add(rs.getString(1)); 
				}
			}
			
			jObj.put("dealAmount", dealAmount);
			
			// 월별 거래량 구하기
			ArrayList<String> monthDealCnt = new ArrayList<String>();
			for(int s=0; s<dealDate.size(); s++) {
				//System.out.println(dealDate.get(s));
				
				sql = "select count(*) from apt_30000 where apt_seq = ? and deal_year = ? and deal_month = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, aptSeq);
				pstmt.setString(2, dealDate.get(s).substring(0,4));
				pstmt.setInt(3, Integer.parseInt(dealDate.get(s).substring(4,6)));
				rs = pstmt.executeQuery();
				rs.next();
				System.out.println(rs.getString(1));
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
