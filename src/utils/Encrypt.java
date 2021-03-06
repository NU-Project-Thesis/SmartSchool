package utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

public class Encrypt {
	
	public static String process(String originalPassword) throws NoSuchAlgorithmException{
        String salt = getSalt();
	     originalPassword = SecurePassword(originalPassword, salt);
		return originalPassword;
	}

	/***
	 * @author soklu_000
	 * @param  Password is originalPassword;
	 * @param  salt is receive from  getSalt method
	 * @return <b>encrypted password</b>
	 * */
	private static String SecurePassword(String Password, String salt) throws NoSuchAlgorithmException {
		
		  String generatedPassword = null;
	        try {
	        	MessageDigest md = MessageDigest.getInstance("SHA-512");
	            //md.update(salt.getBytes());
	            byte[] bytes = md.digest(Password.getBytes());
	            StringBuilder sb = new StringBuilder();
	            for(int i=0; i< bytes.length ;i++)
	            {
	                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
	            }
	            generatedPassword = sb.toString();
	        }
	        catch (NoSuchAlgorithmException e)
	        {
	            e.printStackTrace();
	        }
	        return generatedPassword;
	}

	private static String getSalt() throws NoSuchAlgorithmException {
		SecureRandom sr = SecureRandom.getInstance("SHA1PRNG");
        byte[] salt = new byte[16];
        sr.nextBytes(salt);
        return salt.toString();
	}
	
}
