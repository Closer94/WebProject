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
//	��û�� Ŀ����� ���������� ��� xml:<job> �±׸� return (return NodeList)
	public static NodeList getEmployment(String auth, String interest, int area) { //
		int job_count = 0; // job����
//		Ŀ���� ��û api�ּ�
		String queryURL = "http://api.career.co.kr/open?id=" + auth + "&uc=C1&jc=H002&kw=" + interest + "&ac1="
				+ Integer.toString(area) + "&ec=0&ck=&sc=&gubun=0";
		URL url; // url GET
		try {
			url = new URL(queryURL);
			URLConnection conncetion = url.openConnection();
			InputStream is = conncetion.getInputStream();
			System.out.println("------- url get �Ϸ� -------");

//			3. ���� ��� �ޱ�
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance(); // xml�� Domtree�� ��üȭ
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document doc = builder.parse(is); // InputStream���� ���� xml�� Document�� ��ȯ
			doc.getDocumentElement().normalize(); // �������� ����ȭ
			System.out.println("------- xml->dom tree �Ϸ� -------");
			/*
			 * url ��ü�����ʿ����, parse("queryURL") �ε� �ٷΰ��� DocumentBuilderFactory dbFactory =
			 * DocumentBuilderFactory.newInstance(); DocumentBuilder dBuilder =
			 * dbFactory.newDocumentBuilder(); Document doc =dBuilder.parse(queryURL);
			 */
			System.out.println("------- �Ľ̽��� -------");
//			4. �Ľ�
			Element root = doc.getDocumentElement(); // <Data>
			NodeList nodelist = root.getChildNodes(); // �ڽ� ��� ��� get

			System.out.println(nodelist.item(11).getNodeName() + " : " + nodelist.item(11).getTextContent()); // <PUBCOUNT>

			try {
				job_count = Integer.parseInt(nodelist.item(11).getTextContent()); // <PUBCOUNT> job����
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}

			NodeList jobs = root.getElementsByTagName("jobs");
			
			return jobs; // <job> �±׵��� ����
			
			
			/*
			 * for (int i = 0; i < nodelist.getLength(); i++) { Node item =
			 * nodelist.item(i);
			 * 
			 * if (item.getNodeName().equals("jobs")) { // <jobs> job_array()
			 * 
			 * NodeList jobs = item.getChildNodes(); // jobs �� child
			 * System.out.println("----job" + i + "----"); // job ��ȣ for (int j = 0; j <
			 * jobs.getLength(); j++) { Node job = jobs.item(j); // <����> if
			 * (job.getNodeType() == Node.ELEMENT_NODE) { // ������ �ؽ�Ʈ�� �ν��Ͽ� #text ��Ʈ ������ ó��,
			 * System.out.println(job.getNodeName() + " : " + job.getTextContent()); } } } }
			 */

		} catch (Exception e) {
			e.printStackTrace();
			return null; // ���н� �ƹ��͵� �ѱ��� ����
		}

	}

	public static boolean getEducation(String auth, String interest, int area) {
		boolean result = false;

		return result;
	}
	
	// employment <job> ���
	public static void printJobs(NodeList jobs) {
		for (int i = 0; i < jobs.getLength(); i++) {
			Node job = jobs.item(i); // <job> ��������
			NodeList items = job.getChildNodes(); // ������ <job>�� �ڽ��±׵�
			System.out.println("##### <job>" + (i+1) + " #####"); // ���° job���� Ȯ��
			for (int j = 0; j < items.getLength(); j++) { // <job> �ڽ��±� ��������
				Node item = items.item(j);
				if (item.getNodeType() == Node.ELEMENT_NODE) { // ������ ���ԵǾ������Ƿ� �ؽ�Ʈ�� �ν��Ͽ� #text��� ���� ó��
					System.out.println("["+j+"]"+item.getNodeName() + " : " + item.getTextContent());
				}
			}
		}
	}

}
