package com.hospital.pharmacy;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.stereotype.Service;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

@Service
public class PharmacyService {
	public List<HashMap<String, String>> getInfo() throws Exception{
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=ekxcIW40jfP3mNoKiVK%2F%2F7u%2BZBTeUmL81nmB1UcLNU2CSNp8EoLC4nc2bLtpwOD6MP%2FFwiJ3%2FpxTHBLVd5fBfg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("1000", "UTF-8")); /*한 페이지 결과 수*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        System.out.println(sb.toString());
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		Document document = documentBuilder.parse(urlBuilder.toString());
		
		ArrayList<HashMap<String, String>> list = new ArrayList<HashMap<String,String>>();
		HashMap<String, String> map = null;
        NodeList rnumList = document.getElementsByTagName("rnum");
        NodeList dutyAddrList = document.getElementsByTagName("dutyAddr");
        NodeList dutyNameList = document.getElementsByTagName("dutyName");
        NodeList dutyTelList = document.getElementsByTagName("dutyTel1");
        NodeList wgs84LatList = document.getElementsByTagName("wgs84Lat");
        NodeList wgs84LonList = document.getElementsByTagName("wgs84Lon");
        //System.out.println(dutyAddrList.getLength());
        //System.out.println(dutyNameList.getLength());
        //System.out.println(dutyTelList.getLength());
        //System.out.println(wgs84LatList.getLength());
        //System.out.println(wgs84LonList.getLength());
		for(int i = 0; i < rnumList.getLength(); i++) {
			if(dutyAddrList.item(i).getTextContent().substring(0, 5).equals("서울특별시")) {
				map = new HashMap<String, String>();
				map.put("dutyAddr", dutyAddrList.item(i).getTextContent());
				map.put("dutyName", dutyNameList.item(i).getTextContent());
				map.put("dutyTel", dutyTelList.item(i).getTextContent());
				map.put("wgs84Lat", wgs84LatList.item(i).getTextContent());
				map.put("wgs84Lon", wgs84LonList.item(i).getTextContent());
				list.add(map);
			}
		}
		
		return list;
	}
}