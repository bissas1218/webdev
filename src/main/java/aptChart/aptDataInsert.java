package aptChart;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import webdev.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/**
 * Servlet implementation class test
 */
@WebServlet("/aptDataInsert")
public class aptDataInsert extends HttpServlet {
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
    public aptDataInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//System.out.println("dealYmd:"+request.getParameter("dealYmd"));
		
		DBConnection dbcon = new DBConnection();
		Connection con = dbcon.dbConn();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		String cur_year = "";
		String cur_month = "";
		int cur_month_int = 0;
		
		if(request.getParameter("dealYmd") != null) {
			String dealYmd = request.getParameter("dealYmd");
			cur_year = dealYmd.substring(0, 4);
			cur_month = dealYmd.substring(4, 6);
		}else {
			cur_year = "2024";
			cur_month = "12";
		}
		
		cur_month_int = Integer.parseInt(cur_month);
		
		try {
			String sql = "";
			
			// 법정동 코드 조회
			ArrayList<DongCodeVO> dongCdList = new ArrayList<DongCodeVO>();
			ArrayList<DongCodeVO> dongCdList2 = new ArrayList<DongCodeVO>();
			sql = "select code, name from dong_code where code like '%00000' and use_yn = 'Y'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			String sidoCdBak = "";
			int sejongCnt = 0;
			
			while(rs.next()) {
				
				DongCodeVO dongCdVO = new DongCodeVO();
				dongCdVO.setCode(rs.getString(1));
				dongCdVO.setName(rs.getString(2));
				dongCdList.add(dongCdVO);
				
			//	System.out.println(dongCdVO.getCode().substring(2,10));
				
				// 시도일경우
				if(dongCdVO.getCode().substring(2,10).trim().equals("00000000") ) {
					
					dongCdVO.setCnt(-2);
					dongCdList2.add(dongCdVO);
					
					sidoCdBak = dongCdVO.getCode().substring(0,5);
					
				}else if(dongCdVO.getCode().equals("3611000000")) { // 세종시일경우
				
					sql = "select count(*) from information_schema.tables where table_name = 'apt_36110'";
					pstmt = con.prepareStatement(sql);
					rs2 = pstmt.executeQuery();
					rs2.next();
					
					// 테이블 존재시
					if(rs2.getString(1).equals("1")) {
						// 시군구 매물수 조회
						sql = "select count(*) from apt_36110 where sgg_cd = '"+dongCdVO.getCode().substring(0,5)+"' and deal_year = '"+cur_year+"' and deal_month = '"+cur_month_int+"'";
						pstmt = con.prepareStatement(sql);
						rs2 = pstmt.executeQuery();
						if(rs2.next()) {
							sejongCnt = rs2.getInt(1);
						}
					}else {
						sejongCnt = -1;
					}
					
					request.setAttribute("sejongCnt", sejongCnt);
					
				}else {	// 시군구일 경우
					
				//	System.out.print(sidoCdBak + ", " + dongCdVO.getCode().substring(0,5)+", ");
					
					sql = "select count(*) from information_schema.tables where table_name = 'apt_"+sidoCdBak+"'";
					pstmt = con.prepareStatement(sql);
					rs2 = pstmt.executeQuery();
					rs2.next();
				//	System.out.println(rs2.getString(1));
					
					// 테이블 존재시
					if(rs2.getString(1).equals("1")) {
						// 시군구 매물수 조회
						sql = "select count(*) from apt_"+sidoCdBak+" where sgg_cd = '"+dongCdVO.getCode().substring(0,5)+"' and deal_year = '"+cur_year+"' and deal_month = '"+cur_month_int+"'";
						pstmt = con.prepareStatement(sql);
						rs2 = pstmt.executeQuery();
						if(rs2.next()) {
						//	System.out.println(rs2.getString(1));
							dongCdVO.setCnt(rs2.getInt(1));
						}
					}else {
						dongCdVO.setCnt(-1);
					}
					
					dongCdList2.add(dongCdVO);
					
				}
				
			}
			
		//	System.out.println(dongCdList.size());
			
		//	System.out.println(dongCdList2.size());
			for(int i=0; i<dongCdList.size(); i++) {
				System.out.println(dongCdList.get(i).getCnt());
			}
			request.setAttribute("dongCdList", dongCdList);
			request.setAttribute("dongCdList2", dongCdList2);
			
			
			request.setAttribute("cur_date", cur_year+cur_month);
			
		} catch (SQLException e) {
			System.out.println("error: " + e);
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
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
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/openapi/aptDataInsert.jsp");

		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getParameter("dealYmd")+ " "+request.getParameter("lawdCd"));
		
		String dealYmd = request.getParameter("dealYmd");
		String lawdCd = request.getParameter("lawdCd");
		
		// TODO Auto-generated method stub
		//doGet(request, response);
		//System.out.println("---------------- post ----------------------");
		DBConnection dbconn = new DBConnection();
		Connection con = dbconn.dbConn();
		PreparedStatement pstmt = null;
		
		String tableNm = "";
		
		if(lawdCd.equals("36110")) {
			tableNm = lawdCd;
		}else {
			tableNm = lawdCd.substring(0,2) + "000";
		}
		
		try {
			
			String url = "https://apis.data.go.kr/1613000/RTMSDataSvcAptTradeDev/getRTMSDataSvcAptTradeDev?LAWD_CD="+lawdCd+"&DEAL_YMD="+dealYmd+"&pageNo=1&numOfRows=9999&serviceKey=2qUF4KecEbh1c3ZDyxLBSsqfF5MMNQhUh7mh%2FF3d8Lc3FhbTUgwz9N1iClExVzdhQ9GJNr%2B9uoI0ZiX0zExUnw%3D%3D";
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			
			doc.getDocumentElement().normalize();
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for(int temp = 0; temp < nList.getLength(); temp++){
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					
					String sql = "insert into apt_"+tableNm+" (apt_nm,"
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
					
				}
			}
					
		}catch(Exception e) {
			
			System.out.println("error: " + e);
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
		//PrintWriter out = response.getWriter();
		response.sendRedirect("/aptDataInsert?dealYmd="+dealYmd);
	}

}
