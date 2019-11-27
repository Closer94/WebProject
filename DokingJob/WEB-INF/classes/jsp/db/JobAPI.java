package jsp.db;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.DocumentBuilderFactory; // DocumnetBuilder ��ü�� �̿��ϱ����� factory��ü
import javax.xml.parsers.ParserConfigurationException;
import javax.swing.JOptionPane;
import javax.xml.parsers.DocumentBuilder; // Documnet ��ü����� ����
import javax.xml.xpath.XPath; // factory�̿��� xpath��ü ����
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory; // xpath��ü ����� ���� factory

import org.w3c.dom.Document; // xml�Ľ��� ���� ->Documentȭ
import org.w3c.dom.Element; // element ���
import org.w3c.dom.Node; // xml Node
import org.w3c.dom.NodeList; // xml NodeList
import org.xml.sax.InputSource; // url���� ���� �ҽ� InputStreamȭ �Ͽ� Documnet�����
import org.xml.sax.SAXException;

import com.mysql.fabric.xmlrpc.base.Array;

public class JobAPI {

	public ArrayList<Jobfair> getJobs(String uri, String interest, String area) {
		Document doc = APIConnection.getXML(uri); // uri�� ���� ������ xml����
		ArrayList<Jobfair> CleanJobs = new ArrayList<Jobfair>(); // Jobfair��ü ���·� ����

		XPath xpath = XPathFactory.newInstance().newXPath(); // xpath ����

		// ��� <jobs> NodeList ��������
		try {
			NodeList jobsNodes = (NodeList) xpath.evaluate("//jobs", doc, XPathConstants.NODESET);
			Node pubdata = (Node) xpath.evaluate("/Data/PUBCOUNT/text()", doc, XPathConstants.NODE); // API�� ���� ������
																										// <jobs>����
			System.out.println("������ <jobs> ������ ���� : " + pubdata.getNodeValue());
			System.out.println("����");

			// ��� <jobs> ��������
			for (int i = 0; i < jobsNodes.getLength(); i++) {
				Jobfair job = new Jobfair(); // ArrayList<> jobs�� ���� jobfair��ü
				Element jobNode = (Element) jobsNodes.item(i); // i��° <jobs>
				
				//XML�Ľ��� ������
				String url = xpath.evaluate("./url/text()", jobNode); // ä����� url
				String title = xpath.evaluate("./title/text()", jobNode); // ��������
				String company = xpath.evaluate("./ȸ���/text()", jobNode); // ȸ���
				String region = xpath.evaluate("./area/text()", jobNode); // ȸ������
				String opendate = xpath.evaluate("./opendate/text()", jobNode); // ä����� ������
				String closedate = xpath.evaluate("./closedate/text()", jobNode); // ä����� ������

				// ������� �ʱ�ȭ
				// job_id�� null�� �ʱ�ȭ > InsertDB�ÿ� auto increment����Ͽ� values�� ���� x
				// job_interest ���ɺо�
				job.setJobInterest(interest); // �Ű����� ���
				// job_title ������������
				job.setJobTitle(title);
				// job_url ���� url
				job.setJobUrl(url);
				// job_company ���� ȸ���
				job.setJobCompany(company);
				// job_region ����ȸ������
				job.setJobRegion(area); // �Ű����� ���
				// job_term �����Ⱓ(���۱Ⱓ~�����Ⱓ)
				job.setJobTerm(opendate + "~" + closedate);
				// job_img �����̹���URL
				job.setJobImg("demo.png");
				
				CleanJobs.add(job);
				System.out.println("add "+ i + " : " +job.toString());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("�Ϸ�");
		return CleanJobs;
	}

}
