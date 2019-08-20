package com.hospital.pharmacy;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Service
public class PharmacyService {
	public static void main(String[] args) throws Exception {
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=ekxcIW40jfP3mNoKiVK%2F%2F7u%2BZBTeUmL81nmB1UcLNU2CSNp8EoLC4nc2bLtpwOD6MP%2FFwiJ3%2FpxTHBLVd5fBfg%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        //urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
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
        //기관명
        String dutyName = sb.toString().substring(sb.toString().indexOf("<dutyName>")+10, sb.toString().indexOf("</dutyName>"));
        //주소
        String dutyAddr = sb.toString().substring(sb.toString().indexOf("<dutyAddr>")+10, sb.toString().indexOf("</dutyAddr>"));
        //대표전화
        String dutyTel = sb.toString().substring(sb.toString().indexOf("<dutyTel1>")+10, sb.toString().indexOf("</dutyTel1>"));
        //기관 설명 상세
        String dutyInf = sb.toString().substring(sb.toString().indexOf("<dutyInf>")+9, sb.toString().indexOf("</dutyInf>"));
        //월요일 진료시간
        String dutyMonday = sb.toString().substring(sb.toString().indexOf("<dutyTime1s>")+12, sb.toString().indexOf("</dutyTime1s>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime1s>")+14, sb.toString().indexOf("</dutyTime1s>")) + " ~ " + sb.toString().substring(sb.toString().indexOf("<dutyTime1c>")+12, sb.toString().indexOf("</dutyTime1c>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime1c>")+14, sb.toString().indexOf("</dutyTime1c>"));
        //화요일 진료시간
        String dutyTuesday = sb.toString().substring(sb.toString().indexOf("<dutyTime2s>")+12, sb.toString().indexOf("</dutyTime2s>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime2s>")+14, sb.toString().indexOf("</dutyTime2s>")) + " ~ " + sb.toString().substring(sb.toString().indexOf("<dutyTime2c>")+12, sb.toString().indexOf("</dutyTime2c>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime2c>")+14, sb.toString().indexOf("</dutyTime2c>"));
        //수요일 진료시간
        String dutyWednesday = sb.toString().substring(sb.toString().indexOf("<dutyTime3s>")+12, sb.toString().indexOf("</dutyTime3s>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime3s>")+14, sb.toString().indexOf("</dutyTime3s>")) + " ~ " + sb.toString().substring(sb.toString().indexOf("<dutyTime3c>")+12, sb.toString().indexOf("</dutyTime3c>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime3c>")+14, sb.toString().indexOf("</dutyTime3c>"));
        //목요일 진료시간
        String dutyThursday = sb.toString().substring(sb.toString().indexOf("<dutyTime4s>")+12, sb.toString().indexOf("</dutyTime4s>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime4s>")+14, sb.toString().indexOf("</dutyTime4s>")) + " ~ " + sb.toString().substring(sb.toString().indexOf("<dutyTime4c>")+12, sb.toString().indexOf("</dutyTime4c>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime4c>")+14, sb.toString().indexOf("</dutyTime4c>"));
        //금요일 진료시간
        String dutyFriday = sb.toString().substring(sb.toString().indexOf("<dutyTime5s>")+12, sb.toString().indexOf("</dutyTime5s>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime5s>")+14, sb.toString().indexOf("</dutyTime5s>")) + " ~ " + sb.toString().substring(sb.toString().indexOf("<dutyTime5c>")+12, sb.toString().indexOf("</dutyTime5c>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime5c>")+14, sb.toString().indexOf("</dutyTime5c>"));
        //토요일 진료시간
        String dutySaturday = sb.toString().substring(sb.toString().indexOf("<dutyTime6s>")+12, sb.toString().indexOf("</dutyTime6s>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime6s>")+14, sb.toString().indexOf("</dutyTime6s>")) + " ~ " + sb.toString().substring(sb.toString().indexOf("<dutyTime6c>")+12, sb.toString().indexOf("</dutyTime6c>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime6c>")+14, sb.toString().indexOf("</dutyTime6c>"));
        //일요일 진료시간
        String dutySunday = sb.toString().substring(sb.toString().indexOf("<dutyTime7s>")+12, sb.toString().indexOf("</dutyTime7s>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime7s>")+14, sb.toString().indexOf("</dutyTime7s>")) + " ~ " + sb.toString().substring(sb.toString().indexOf("<dutyTime7c>")+12, sb.toString().indexOf("</dutyTime7c>")-2) + ":" + sb.toString().substring(sb.toString().indexOf("<dutyTime7c>")+14, sb.toString().indexOf("</dutyTime7c>"));
        //경도
        String wgs84Lat = sb.toString().substring(sb.toString().indexOf("<wgs84Lat>")+10, sb.toString().indexOf("</wgs84Lat>"));
        //위도
        String wgs84Lon = sb.toString().substring(sb.toString().indexOf("<wgs84Lon>")+10, sb.toString().indexOf("</wgs84Lon>"));
        ArrayList<String> list = new ArrayList<String>();
        list.add(dutyAddr);
        list.add(dutyInf);
        list.add(dutyName);
        list.add(dutyTel);
        list.add(dutyMonday);
        list.add(dutyTuesday);
        list.add(dutyWednesday);
        list.add(dutyThursday);
        list.add(dutyFriday);
        list.add(dutySaturday);
        list.add(dutySunday);
        list.add(wgs84Lat);
        list.add(wgs84Lon);
        /*DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		Document document = documentBuilder.parse(urlBuilder.toString());

        NodeList nList = document.getElementsByTagName("item");
		for(int i = 0; i < nList.getLength(); i++) {
			String info = nList.item(i).getTextContent();
			//System.out.println(info);
			String infoParse = info.substring(0, 5);
			if(infoParse.equals("서울특별시")) {
				System.out.println(info);
			}
			Thread.sleep(10);
		}*/
	}
}