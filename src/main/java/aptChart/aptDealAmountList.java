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
		
	//	System.out.println(request.getParameter("sggCd"));
		String aptSeq = request.getParameter("aptSeq");
		
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
		String aptNm = request.getParameter("aptNm");
		String sggCd = request.getParameter("sggCd");
		
		JSONObject jObj = new JSONObject();
		
	//	System.out.println(aptSeq);
		String table_nm = "";
		if(aptSeq.substring(0,5).equals("36110")) {
			table_nm = "36110";
		}else {
			table_nm = aptSeq.substring(0,2)+"000";
		}
	//	System.out.println(aptSeq);
		try {
			
			// 면적구하기 ㎡
			String sql = "select exclu_use_ar from apt_"+table_nm+" where apt_seq = ? "
					+ "and date(concat(deal_year, if(length(deal_month) = 1, concat('0', deal_month), deal_month), '01')) between concat(?,'-',?,'-01') and concat(?,'-',?,'-01') "
					+ "group by exclu_use_ar order by cast(exclu_use_ar as unsigned) asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aptSeq);
			pstmt.setString(2, searchStartYear);
			pstmt.setString(3, searchStartMonth);
			pstmt.setString(4, searchEndYear);
			pstmt.setString(5, searchEndMonth);
			rs = pstmt.executeQuery();
			
			List<String> excluUseAr = new ArrayList<String>();
			while(rs.next()) {
			//	System.out.println(rs.getString(1));
				excluUseAr.add(rs.getString(1));
			}
			
			jObj.put("excluUseAr", excluUseAr);
			
			// 기간구하기
			sql = "select deal_year , deal_month from apt_"+table_nm+" where apt_seq = ? "
					+ "and date(concat(deal_year, if(length(deal_month) = 1, concat('0', deal_month), deal_month), '01')) between concat(?,'-',?,'-01') and concat(?,'-',?,'-01') "
					+ "group by deal_year , deal_month order by cast(deal_year as unsigned) asc, cast(deal_month as unsigned) asc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, aptSeq);
			pstmt.setString(2, searchStartYear);
			pstmt.setString(3, searchStartMonth);
			pstmt.setString(4, searchEndYear);
			pstmt.setString(5, searchEndMonth);
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
			
			// 매매 실거래가 구하기
			ArrayList<String>[] dealAmount = new ArrayList[excluUseAr.size()];
			// 전월세 보증금 구하기
			ArrayList<String>[] rentAmount = new ArrayList[excluUseAr.size()];
			
			for(int i=0; i<excluUseAr.size(); i++) {
				//System.out.println(excluUseAr.get(i));
				
				dealAmount[i] = new ArrayList<String>();
				rentAmount[i] = new ArrayList<String>();
				
				for(int j=0; j<dealDate.size(); j++) {
					
					sql = "select avg(replace(deal_amount,',','')) avg_deal_amt from apt_"+table_nm+" "
							+ "where apt_seq = ? and deal_year = ? and deal_month = ? and exclu_use_ar = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, aptSeq);
					pstmt.setString(2, dealDate.get(j).substring(0,4));
					pstmt.setInt(3, Integer.parseInt(dealDate.get(j).substring(4,6)));
					pstmt.setString(4, excluUseAr.get(i));
					rs = pstmt.executeQuery();
					rs.next();
					
					dealAmount[i].add(rs.getString(1)); 
					
				//	System.out.println(sggCd.substring(0,5)+", "+aptNm);
					sql = "select avg(replace(deposit,',','')) avg_rent_amt from apt_rent_"+table_nm+" "
							+ "where sgg_cd = ? and apt_nm = ? and deal_year = ? and deal_month = ? and exclu_use_ar = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, sggCd.substring(0,5));
					pstmt.setString(2, aptNm);
					pstmt.setString(3, dealDate.get(j).substring(0,4));
					pstmt.setInt(4, Integer.parseInt(dealDate.get(j).substring(4,6)));
					pstmt.setString(5, excluUseAr.get(i));
					rs = pstmt.executeQuery();
					rs.next();
					
					rentAmount[i].add(rs.getString(1)); 
				}
			}
			
			jObj.put("dealAmount", dealAmount);
			jObj.put("rentAmount", rentAmount);
			
			// 월별 매매 거래량 구하기
			ArrayList<String> monthDealCnt = new ArrayList<String>();
			// 월별 전월세 거래량 구하기
			ArrayList<String> monthRentCnt = new ArrayList<String>();
			
			for(int s=0; s<dealDate.size(); s++) {
				//System.out.println(dealDate.get(s));
				
				// 월별 매매 거래량 구하기
				sql = "select count(*) from apt_"+table_nm+" where apt_seq = ? and deal_year = ? and deal_month = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, aptSeq);
				pstmt.setString(2, dealDate.get(s).substring(0,4));
				pstmt.setInt(3, Integer.parseInt(dealDate.get(s).substring(4,6)));
				rs = pstmt.executeQuery();
				rs.next();
			//	System.out.println(rs.getString(1));
				if(rs.getInt(1) > 0) {
					monthDealCnt.add(rs.getString(1));
				}else {
					monthDealCnt.add(null);
				}
				
				
				// 월별 전월세 거래량 구하기
				sql = "select count(*) from apt_rent_"+table_nm+" where apt_nm = ? and deal_year = ? and deal_month = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, aptNm);
				pstmt.setString(2, dealDate.get(s).substring(0,4));
				pstmt.setInt(3, Integer.parseInt(dealDate.get(s).substring(4,6)));
				rs = pstmt.executeQuery();
				rs.next();
			//	System.out.println(aptNm);
				if(rs.getInt(1) > 0) {
					monthRentCnt.add(rs.getString(1));
				}else {
					monthRentCnt.add(null);
				}
				
			}
			
			jObj.put("monthDealCnt", monthDealCnt);
			jObj.put("monthRentCnt", monthRentCnt);
			
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
