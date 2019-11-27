package jsp.db;

import java.io.IOException;

import javax.xml.parsers.DocumentBuilderFactory; // DocumnetBuilder 객체를 이용하기위한 factory객체
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document; // xml파싱을 위해 ->Document화
import org.xml.sax.SAXException;

public class APIConnection {
	
	//인터넷 상의 xml문서의 경우 uri로 한번에 받아오기 parse(String uri)
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
