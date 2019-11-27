package jsp.db;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilderFactory; // DocumnetBuilder ��ü�� �̿��ϱ����� factory��ü
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document; // xml�Ľ��� ���� ->Documentȭ
import org.xml.sax.SAXException;

public class APIConnection {
	
	//���ͳ� ���� xml������ ��� uri�� �ѹ��� �޾ƿ��� parse(String uri)
	public static Document getXML(String uri) {
	Document document = null;
	try {
		document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(uri);
	} catch (SAXException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch (ParserConfigurationException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return document;
	}
	
}
