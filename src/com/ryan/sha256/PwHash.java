package com.ryan.sha256;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class PwHash {
	/**
	 * SHA-256으로 해시한다.
	 * 
	 * @param msg
	 * @return
	 */
	public static String sha256(String msg)  throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(msg.getBytes());
		return PwHash.byteToHexString(md.digest());
	}
	
	/**
	 * 바이트 배열을 HEX 문자열로 변환한다.
	 * @param data
	 * @return
	 */
	public static String byteToHexString(byte[] data) {
		StringBuilder sb = new StringBuilder();
		for(byte b : data) {
			sb.append(Integer.toString((b & 0xff) + 0x100, 16).substring(1));
		}
		return sb.toString();
	}
}
