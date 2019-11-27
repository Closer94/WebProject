package jsp.db;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilderFactory; // DocumnetBuilder 객체를 이용하기위한 factory객체
import javax.xml.parsers.ParserConfigurationException;
import javax.swing.JOptionPane;
import javax.xml.parsers.DocumentBuilder; // Documnet 객체만들기 위해
import javax.xml.xpath.XPath; // factory이용해 xpath객체 생성
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory; // xpath객체 만들기 위한 factory

import org.w3c.dom.Document; // xml파싱을 위해 ->Document화
import org.w3c.dom.Element; // element 요소
import org.w3c.dom.Node; // xml Node
import org.w3c.dom.NodeList; // xml NodeList
import org.xml.sax.InputSource; // url에서 받은 소스 InputStream화 하여 Documnet만들기
import org.xml.sax.SAXException;

import com.mysql.fabric.xmlrpc.base.Array;

public class JobAPI {

	public ArrayList<Jobfair> getJobs(String uri, String interest, String area) {
		Document doc = APIConnection.getXML(uri); // uri를 통해 가져온 xml문서
		ArrayList<Jobfair> CleanJobs = new ArrayList<Jobfair>(); // Jobfair객체 형태로 전달

		XPath xpath = XPathFactory.newInstance().newXPath(); // xpath 생성

		// 모든 <jobs> NodeList 가져오기
		try {
			NodeList jobsNodes = (NodeList) xpath.evaluate("//jobs", doc, XPathConstants.NODESET);
			Node pubdata = (Node) xpath.evaluate("/Data/PUBCOUNT/text()", doc, XPathConstants.NODE); // API를 통해 가져온
																										// <jobs>개수
			System.out.println("가져온 <jobs> 데이터 개수 : " + pubdata.getNodeValue());
			System.out.println("시작");

			// 모든 <jobs> 가져오기
			for (int i = 0; i < jobsNodes.getLength(); i++) {
				Jobfair job = new Jobfair(); // ArrayList<> jobs에 넣을 jobfair객체
				Element jobNode = (Element) jobsNodes.item(i); // i번째 <jobs>
				
				//XML파싱한 데이터
				String url = xpath.evaluate("./url/text()", jobNode); // 채용공고 url
				String title = xpath.evaluate("./title/text()", jobNode); // 공고제목
				String company = xpath.evaluate("./회사명/text()", jobNode); // 회사명
				String region = xpath.evaluate("./area/text()", jobNode); // 회사지역
				String opendate = xpath.evaluate("./opendate/text()", jobNode); // 채용공고 시작일
				String closedate = xpath.evaluate("./closedate/text()", jobNode); // 채용공고 마감일

				// 멤버변수 초기화
				// job_id는 null로 초기화 > InsertDB시에 auto increment사용하여 values값 지정 x
				// job_interest 관심분야
				job.setJobInterest(interest); // 매개변수 사용
				// job_title 구직정보제목
				job.setJobTitle(title);
				// job_url 구직 url
				job.setJobUrl(url);
				// job_company 구직 회사명
				job.setJobCompany(company);
				// job_region 구직회사지역
				job.setJobRegion(area); // 매개변수 사용
				// job_term 구직기간(시작기간~마감기간)
				job.setJobTerm(opendate + "~" + closedate);
				// job_img 구직이미지URL
				job.setJobImg("demo.png");
				
				CleanJobs.add(job);
				System.out.println("add "+ i + " : " +job.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("완료");
		return CleanJobs;
	}

}
