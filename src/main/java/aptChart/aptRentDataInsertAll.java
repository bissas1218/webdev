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

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * Servlet implementation class dataInsertAll
 */
@WebServlet("/aptRentDataInsertAll")
public class aptRentDataInsertAll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static String getTagValue(String tag, Element eElement){
		
		if(eElement.getElementsByTagName(tag).item(0) != null) {
		
			NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
			Node nValue = (Node) nList.item(0);
			if(nValue == null){
				return null;
			}
			return nValue.getNodeValue();	
		}
		
		return null;
	}

    /**
     * @see HttpServlet#HttpServlet()
     */
    public aptRentDataInsertAll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(request.getParameter("dealYmd")+ " "+request.getParameter("lawdCd"));
		
		String dealYmd = request.getParameter("dealYmd");
		String sidoCode = request.getParameter("lawdCd");
		
		DBConnection dbconn = new DBConnection();
		Connection con = dbconn.dbConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select substr(code,1,5), substring_index(name, ' ', -1) gu from dong_code where code like '"+sidoCode.substring(0,2)+"%' and code like '%00000' and code != concat(?,'00000000') and use_yn = 'Y'";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sidoCode.substring(0,2));
			rs = pstmt.executeQuery();
			
			// 삭제
			sql = "delete from apt_rent_"+sidoCode+" where deal_year = ? and deal_month = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dealYmd.substring(0,4));
			pstmt.setInt(2, Integer.parseInt(dealYmd.substring(4,6)));
			pstmt.executeUpdate();
			
			while(rs.next()) {
			//	System.out.println(rs.getString(1)+", "+dealYmd.substring(0,4)+", "+dealYmd.substring(4,6));
				
				// 저장
				String url = "https://apis.data.go.kr/1613000/RTMSDataSvcAptRent/getRTMSDataSvcAptRent?serviceKey=2qUF4KecEbh1c3ZDyxLBSsqfF5MMNQhUh7mh%2FF3d8Lc3FhbTUgwz9N1iClExVzdhQ9GJNr%2B9uoI0ZiX0zExUnw%3D%3D&LAWD_CD="+rs.getString(1)+"&DEAL_YMD="+dealYmd+"&pageNo=1&numOfRows=9999";
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				
				NodeList nList = doc.getElementsByTagName("item");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						
						sql = "insert into apt_rent_"+sidoCode+" ("
								+ "sgg_cd,"
								+ "umd_nm,"
								+ "apt_nm,"
								+ "jibun,"
								+ "exclu_use_ar,"
								+ "deal_year,"
								+ "deal_month,"
								+ "deal_day,"
								+ "deposit,"
								+ "monthly_rent,"
								+ "floor,"
								+ "build_year,"
								+ "contract_term,"
								+ "contract_type,"
								+ "use_rrr_right,"
								+ "pre_deposit,"
								+ "pre_monthly_rent"
								+ ") values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
						
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, getTagValue("sggCd", eElement));
						pstmt.setString(2, getTagValue("umdNm", eElement));
						pstmt.setString(3, getTagValue("aptNm", eElement));
						pstmt.setString(4, getTagValue("jibun", eElement));
						pstmt.setString(5, getTagValue("excluUseAr", eElement));
						pstmt.setString(6, getTagValue("dealYear", eElement));
						pstmt.setString(7, getTagValue("dealMonth", eElement));
						pstmt.setString(8, getTagValue("dealDay", eElement));
						pstmt.setString(9, getTagValue("deposit", eElement));
						pstmt.setString(10, getTagValue("monthlyRent", eElement));
						pstmt.setString(11, getTagValue("floor", eElement));
						pstmt.setString(12, getTagValue("dealYear", eElement));
						pstmt.setString(13, getTagValue("contractTerm", eElement));
						pstmt.setString(14, getTagValue("contractType", eElement));
						pstmt.setString(15, getTagValue("useRRRight", eElement));
						pstmt.setString(16, getTagValue("preDeposit", eElement));
						pstmt.setString(17, getTagValue("preMonthlyRent", eElement));
						
						pstmt.executeQuery();
					//	System.out.println(temp);
					}
				}
			}
			
		}catch(Exception e) {
			
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
		
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("/aptRentDataInsert?dealYmd="+dealYmd);
	}

}
