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
@WebServlet("/aptDataInsertAll")
public class aptDataInsertAll extends HttpServlet {
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
    public aptDataInsertAll() {
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
			sql = "delete from apt_"+sidoCode+" where deal_year = ? and deal_month = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dealYmd.substring(0,4));
			pstmt.setInt(2, Integer.parseInt(dealYmd.substring(4,6)));
			pstmt.executeUpdate();
			
			while(rs.next()) {
			//	System.out.println(rs.getString(1)+", "+dealYmd.substring(0,4)+", "+dealYmd.substring(4,6));
				
				// 저장
				String url = "https://apis.data.go.kr/1613000/RTMSDataSvcAptTradeDev/getRTMSDataSvcAptTradeDev?LAWD_CD="+rs.getString(1)+"&DEAL_YMD="+dealYmd+"&pageNo=1&numOfRows=9999&serviceKey=2qUF4KecEbh1c3ZDyxLBSsqfF5MMNQhUh7mh%2FF3d8Lc3FhbTUgwz9N1iClExVzdhQ9GJNr%2B9uoI0ZiX0zExUnw%3D%3D";
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				
				doc.getDocumentElement().normalize();
				
				NodeList nList = doc.getElementsByTagName("item");
				
				for(int temp = 0; temp < nList.getLength(); temp++){
					Node nNode = nList.item(temp);
					if(nNode.getNodeType() == Node.ELEMENT_NODE){
						Element eElement = (Element) nNode;
						
						sql = "insert into apt_"+sidoCode+" (apt_nm,"
								+ "sgg_cd,"
								+ "umd_cd,"
								+ "land_cd,"
								+ "bonbun,"
								+ "bubun,"
								+ "road_nm,"
								+ "road_nm_sgg_cd,"
								+ "road_nm_cd,"
								+ "road_nm_seq,"
								+ "road_nmb_cd,"
								+ "road_nm_bonbun,"
								+ "road_nm_bubun,"
								+ "umd_nm,"
								+ "jibun,"
								+ "exclu_use_ar,"
								+ "deal_year,"
								+ "deal_month,"
								+ "deal_day,"
								+ "deal_amount,"
								+ "floor,"
								+ "build_year,"
								+ "apt_seq,"
								+ "cdeal_type,"
								+ "cdeal_day,"
								+ "dealing_gbn,"
								+ "estate_agent_sgg_nm,"
								+ "rgst_date,"
								+ "apt_dong,"
								+ "sler_gbn,"
								+ "buyer_gbn,"
								+ "land_leasehold_gbn" 
								+ ") values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, getTagValue("aptNm", eElement));
						pstmt.setString(2, getTagValue("sggCd", eElement));
						pstmt.setString(3, getTagValue("umdCd", eElement));
						pstmt.setString(4, getTagValue("landCd", eElement));
						pstmt.setString(5, getTagValue("bonbun", eElement));
						pstmt.setString(6, getTagValue("bubun", eElement));
						pstmt.setString(7, getTagValue("roadNm", eElement));
						pstmt.setString(8, getTagValue("roadNmSggCd", eElement));
						pstmt.setString(9, getTagValue("roadNmCd", eElement));
						pstmt.setString(10, getTagValue("roadNmSeq", eElement));
						pstmt.setString(11, getTagValue("roadNmbCd", eElement));
						pstmt.setString(12, getTagValue("roadNmBonbun", eElement));
						pstmt.setString(13, getTagValue("roadNmBubun", eElement));
						pstmt.setString(14, getTagValue("undNm", eElement));
						pstmt.setString(15, getTagValue("jibun", eElement));
						pstmt.setString(16, getTagValue("excluUseAr", eElement));
						pstmt.setString(17, getTagValue("dealYear", eElement));
						pstmt.setString(18, getTagValue("dealMonth", eElement));
						pstmt.setString(19, getTagValue("dealDay", eElement));
						pstmt.setString(20, getTagValue("dealAmount", eElement));
						pstmt.setString(21, getTagValue("floor", eElement));
						pstmt.setString(22, getTagValue("buildYear", eElement));
						pstmt.setString(23, getTagValue("aptSeq", eElement));
						pstmt.setString(24, getTagValue("cdealType", eElement));
						pstmt.setString(25, getTagValue("cdealDay", eElement));
						pstmt.setString(26, getTagValue("dealingGbn", eElement));
						pstmt.setString(27, getTagValue("estateAgentSggNm", eElement));
						pstmt.setString(28, getTagValue("rgstDate", eElement));
						pstmt.setString(29, getTagValue("aptDong", eElement));
						pstmt.setString(30, getTagValue("alerGbn", eElement));
						pstmt.setString(31, getTagValue("slerGbn", eElement));
						pstmt.setString(32, getTagValue("landLeaseholdGbn", eElement)); 
						
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
		response.sendRedirect("/aptDataInsert?dealYmd="+dealYmd);
	}

}
