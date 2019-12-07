import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class HRD {

	public static void main(String[] args) {
		test();
	}
	
	public static void test() {
		String auth = "990yX1ZQjK6DPXSLbGx15AeIFYycHsJi";
		String interest = "H002";
		int area = 1;
		boolean result = false;
		String titleUrl = "";
		//String queryURL = "http://www.hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?authKey="+auth+"&returnType=XML&outType=1&pageNum=1&pageSize=20&srchTraStDt=20141001&srchTraEndDt=20141231&sort=ASC&sortCol=TOT_FXNUM";
		//String queryURL = "http://hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=990yX1ZQjK6DPXSLbGx15AeIFYycHsJi&pageNum=1&pageSize=100&srchTraStDt=20191205&srchTraEndDt=20200305&outType=1&sort=ASC&sortCol=TR_STT_DT&crseTracseSe=C0055&srchTraArea1=11&srchKeco1=20&srchKeco2=2001";
		String queryURL = "http://hrd.go.kr/jsp/HRDP/HRDPO00/HRDPOA60/HRDPOA60_1.jsp?returnType=XML&authKey=990yX1ZQjK6DPXSLbGx15AeIFYycHsJi&pageNum=1&pageSize=100&srchTraStDt=20191205&srchTraEndDt=20200305&outType=1&sort=ASC&sortCol=TR_STT_DT&srchTraArea1=41&srchKeco1=20&srchKeco2=2001";
		URL url;

		try {
	       url = new URL(queryURL);
	         URLConnection conncetion = url.openConnection();
	         InputStream is = conncetion.getInputStream();
	         System.out.println("------- url get ------- ");
	         
	         DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	         DocumentBuilder builder = factory.newDocumentBuilder();
	         Document doc = builder.parse(is);
	         System.out.println("------- xml->dorm tree -------");

	         Element root = doc.getDocumentElement();
	         NodeList nodelist = root.getChildNodes();

	         //System.out.println(nodelist.item(1).getNodeName()) ;
	         System.out.println(nodelist.item(2).getNodeName() + " : " + nodelist.item(2).getTextContent()); 

	         NodeList temp = nodelist.item(3).getChildNodes();
	         for (int i = 0; i < temp.getLength(); i++) {
	            Node item = temp.item(i);
	            //System.out.println(item.getNodeName());
	            if (item.getNodeName().equals("scn_list")) {
	               NodeList edus = item.getChildNodes();
	               System.out.println("----education" + i + "----");
	               
	               for(int j = 0; j < edus.getLength(); j++) {
	                  Node information = edus.item(j);
	                  
	                  String nodeName = information.getNodeName();

	                  if(nodeName.equals("address") || 
	                     nodeName.equals("subTitle") ||
	                     nodeName.equals("titleLink") ||
	                     nodeName.equals("title") ||
	                     nodeName.equals("trainTargetCd") ||
	                     nodeName.equals("trainstCstId") ||
	                     nodeName.equals("traStartDate") ||
	                     nodeName.equals("traEndDate") ||
	                     nodeName.equals("courseMan")) {
	                	  System.out.println(nodeName+ " : " + information.getTextContent());
	                  }
	               }
	            }
	         }
	         

	      } catch (Exception e) {
	         e.printStackTrace();
	      }  
	}

}
