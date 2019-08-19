package com.hospital.pharmacy;

import java.io.BufferedInputStream;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

@Service
public class PharmacyService {
	public void pharmacyInfo() throws Exception{
		JSONParser jsonParser = new JSONParser();
        JSONObject jsonObject = (JSONObject)jsonParser.parse(readUrl());
        JSONObject fields =  (JSONObject) jsonObject.get("fields");
        for(int i = 0 ; i < fields.size(); i++){
            JSONObject id = (JSONObject)fields.get(i);
        }
	}
	
	private static String readUrl() throws Exception {
       BufferedInputStream reader = null;
       try {
           URL url = new URL("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown");
           reader = new BufferedInputStream(url.openStream());
           StringBuffer buffer = new StringBuffer();
           int i;
           byte[] b = new byte[4096];
           while( (i = reader.read(b)) != -1){
             buffer.append(new String(b, 0, i));
           }
           return buffer.toString();
       } finally {
           if (reader != null)
               reader.close();
       }
   }
}