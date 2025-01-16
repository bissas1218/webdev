<%@page import="org.w3c.dom.Element"%>
<%@page import="org.w3c.dom.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	private static String getTagValue(String tag, Element eElement){
		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nList.item(0);
		if(nValue == null){
			return null;
		}
		return nValue.getNodeValue();	
	}
%>

<%
	System.out.println("---------------- start ----------------------");

	
	
	try{
		
		String url = "https://apis.data.go.kr/1613000/RTMSDataSvcAptTradeDev/getRTMSDataSvcAptTradeDev?LAWD_CD=30200&DEAL_YMD=202407&pageNo=1&numOfRows=1000&serviceKey=2qUF4KecEbh1c3ZDyxLBSsqfF5MMNQhUh7mh%2FF3d8Lc3FhbTUgwz9N1iClExVzdhQ9GJNr%2B9uoI0ZiX0zExUnw%3D%3D";
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
		Document doc = dBuilder.parse(url);
		
		doc.getDocumentElement().normalize();
		//doc.getElementById(elementId)
		//System.out.println("===>"+doc.getElementsByTagName("totalCount").item(0).getChildNodes());
		
		NodeList nList = doc.getElementsByTagName("item");
		
		System.out.println("length : "+nList.getLength());
		
		for(int temp = 0; temp < nList.getLength(); temp++){
			Node nNode = nList.item(temp);
			if(nNode.getNodeType() == Node.ELEMENT_NODE){
				Element eElement = (Element) nNode;
				System.out.println(getTagValue("aptNm", eElement));
			}
		}
	}catch(Exception e){
		
	}
	
	System.out.println("---------------- end ----------------------");
%>