package jsp.db;

import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class UseRestfulAPI {
//	요청시 커리어에서 구직정보가 담긴 xml:<job> 태그만 return (return NodeList)
	public static NodeList getEmployment(String auth, String interest, int area) { //
		int job_count = 0; // job개수
//		커리어 요청 api주소
		String queryURL = "http://api.career.co.kr/open?id=" + auth + "&uc=C1&jc=H002&kw=" + interest + "&ac1="
				+ Integer.toString(area) + "&ec=0&ck=&sc=&gubun=0";
		URL url; // url GET
		try {
			url = new URL(queryURL);
			URLConnection conncetion = url.openConnection();
			InputStream is = conncetion.getInputStream();
			System.out.println("------- url get 완료 -------");

//			3. 질의 결과 받기
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance(); // xml을 Domtree로 객체화
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(is); // InputStream으로 받은 xml을 Document로 변환
			doc.getDocumentElement().normalize(); // 문서구조 안정화
			System.out.println("------- xml->dom tree 완료 -------");
			/*
			 * url 객체만들필요없이, parse("queryURL") 로도 바로가능 DocumentBuilderFactory dbFactory =
			 * DocumentBuilderFactory.newInstance(); DocumentBuilder dBuilder =
			 * dbFactory.newDocumentBuilder(); Document doc =dBuilder.parse(queryURL);
			 */
			System.out.println("------- 파싱시작 -------");
//			4. 파싱
			Element root = doc.getDocumentElement(); // <Data>
			NodeList nodelist = root.getChildNodes(); // 자식 노드 목록 get

			System.out.println(nodelist.item(11).getNodeName() + " : " + nodelist.item(11).getTextContent()); // <PUBCOUNT>

			try {
				job_count = Integer.parseInt(nodelist.item(11).getTextContent()); // <PUBCOUNT> job개수
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}

			NodeList jobs = root.getElementsByTagName("jobs");
			
			return jobs; // <job> 태그들의 집합
			
			
			/*
			 * for (int i = 0; i < nodelist.getLength(); i++) { Node item =
			 * nodelist.item(i);
			 * 
			 * if (item.getNodeName().equals("jobs")) { // <jobs> job_array()
			 * 
			 * NodeList jobs = item.getChildNodes(); // jobs 의 child
			 * System.out.println("----job" + i + "----"); // job 번호 for (int j = 0; j <
			 * jobs.getLength(); j++) { Node job = jobs.item(j); // <정보> if
			 * (job.getNodeType() == Node.ELEMENT_NODE) { // 공백을 텍스트로 인식하여 #text 노트 생성시 처리,
			 * System.out.println(job.getNodeName() + " : " + job.getTextContent()); } } } }
			 */

		} catch (Exception e) {
			e.printStackTrace();
			return null; // 실패시 아무것도 넘기지 않음
		}

	}

	public static boolean getEducation(String auth, String interest, int area) {
		boolean result = false;

		return result;
	}
	
	// employment <job> 출력
	public static void printJobs(NodeList jobs) {
		for (int i = 0; i < jobs.getLength(); i++) {
			Node job = jobs.item(i); // <job> 가져오기
			NodeList items = job.getChildNodes(); // 가져온 <job>의 자식태그들
			System.out.println("##### <job>" + (i+1) + " #####"); // 몇번째 job인지 확인
			for (int j = 0; j < items.getLength(); j++) { // <job> 자식태그 정보접근
				Node item = items.item(j);
				if (item.getNodeType() == Node.ELEMENT_NODE) { // 공백이 포함되어있으므로 텍스트로 인식하여 #text노드 빼고 처리
					System.out.println("["+j+"]"+item.getNodeName() + " : " + item.getTextContent());
				}
			}
		}
	}

}
