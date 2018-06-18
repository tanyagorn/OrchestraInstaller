package emds.epi.impl.security;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.PBEParameterSpec;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

import com.izforge.izpack.panels.process.AbstractUIProcessHandler;

public class TwoWayPassword extends Password {

//	private  char [] secretKey = null;

	protected TwoWayPassword( String salt, String passphrase) {
		super( salt, passphrase );
	}
	
	protected TwoWayPassword( String encrypted ) throws SecurityException {
		super( encrypted );
	}
	
	private char [] getSecret() {
		return  // secretKey == null ? 
				new char []{ '0', 'A', 'X', 'U', '_', '?', '7' , '9', '=' } 
//				: secretKey 
		;
	}
	
    /**
     * Create a password object from the password data. A salt value is generated by a random generator
     * 
     * @param password data to encrypt
     * @return password instance
     */
    
    public static TwoWayPassword createFromData( String password ) {
		return new TwoWayPassword( generateSalt( 8 ), password );
    }	
		
    /**
     * Create a password object from the encrypted data.
     * 
     * @param encrypted encrypted data
     * @return password instance
     * @throws SecurityException
     */
    
    public static TwoWayPassword createFromEncryptedData( String encrypted ) throws SecurityException {
		return new TwoWayPassword( encrypted );
    }    
    
    /**
     * Encrypt a password by using a des. 
     * @param salt			
     * @param passphrase			
     * @return
     * @throws IOException
     * @throws NoSuchAlgorithmException
     */

    protected byte [] getPasswordDigest( String passphrase ) throws SecurityException {

		PBEKeySpec 			pbeKeySpec;
	    PBEParameterSpec 	pbeParamSpec;
	    SecretKeyFactory 	keyFac;

	    try {
	    	byte [] sb = salt.getBytes( "UTF-8");
			pbeParamSpec 		= new PBEParameterSpec( sb, 10 );
			pbeKeySpec 			= new PBEKeySpec( getSecret() );
			keyFac 				= SecretKeyFactory.getInstance("PBEWithMD5AndDES");
		    SecretKey pbeKey 	= keyFac.generateSecret(pbeKeySpec);
	
			Cipher pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
	
		    pbeCipher.init(Cipher.ENCRYPT_MODE, pbeKey, pbeParamSpec);
	
		    return pbeCipher.doFinal( passphrase.getBytes("UTF-8" ) );
	    }
	    catch( Exception e ) {
			logger.log( Level.SEVERE, "Failed to encrypt password", e );
	    	throw new SecurityException("Failed to create password", e);
	    }
	}
	
    /**
     * Encrypt a password by using a digital hash-function. 
     * @param salt			
     * @param passphrase			
     * @return
     * @throws IOException
     * @throws NoSuchAlgorithmException
     */

	protected Password intCreateFromData( String salt, String passphrase ) throws SecurityException {
		return new TwoWayPassword( salt, passphrase );
	}    
    
	public String getPassword() throws SecurityException {

		PBEKeySpec 			pbeKeySpec;
	    PBEParameterSpec 	pbeParamSpec;
	    SecretKeyFactory 	keyFac;

	    try {
			pbeParamSpec 		= new PBEParameterSpec( salt.getBytes( "UTF-8"), 10);
	
			pbeKeySpec 			= new PBEKeySpec( getSecret() );
			keyFac 				= SecretKeyFactory.getInstance("PBEWithMD5AndDES");
		    SecretKey pbeKey 	= keyFac.generateSecret(pbeKeySpec);
	
			Cipher pbeCipher = Cipher.getInstance("PBEWithMD5AndDES");
	
		    pbeCipher.init(Cipher.DECRYPT_MODE, pbeKey, pbeParamSpec);
	
		    byte [] arData =  pbeCipher.doFinal( this.digest );
	
		    return new String( arData, "UTF-8" );
	    }
	    catch( Exception e ) {
			logger.log( Level.SEVERE, "Failed to decrypt password", e );
	    	throw new SecurityException("Failed to create password", e);
	    }	
	}

	/**
	 * Checks if the given value is an encrypted password 
	 * 
	 * @param value
	 * @return
	 */
	
	public static boolean isEncryptedValue( String value ) {
		
		try {
			
			TwoWayPassword.createFromEncryptedData( value ).getPassword();

			return true;
		}
		catch( Exception e ) {
			return false;
		}
	}

	private static void writeToScript() {
		String workingDir = System.getProperty("user.dir");
		System.out.println( "Working directory:" + workingDir );
		System.out.println( "Enter method writing file 2222 :");
		BufferedWriter out = null;
		try  
		{
			FileWriter fstream = new FileWriter("out.txt", true); //true tells to append data.			
			System.out.println( "Writing file eieieiei :" + workingDir);
			out = new BufferedWriter(fstream);
			out.write("\nBettyz");
		}
		catch (IOException e)
		{
			System.out.println( "Writing file error :");
			System.err.println("Error: " + e.getMessage());
		}
		finally
		{
			try	{
				if(out!=null)
					out.close();
			}catch(Exception ex){
				System.out.println("Error in closing the BufferedWriter"+ex);
				}
		}
	}

	public void run(AbstractUIProcessHandler handler, String[] args) {
		handler.logOutput("Hello, World!", false);
	}

    public static void main( String [] args ) throws Exception {


		if( args.length == 2 && args[1].equalsIgnoreCase( "return" ) ) {
        	System.out.println( createFromData( args[0] ).getEncryptedPassword() );
    	}
    	else if( args.length == 2 && args[1].equalsIgnoreCase( "decrypt" ) ) {
        	System.out.println( "Decrypted value :" );
        	System.out.println( createFromEncryptedData( args[0] ).getPassword() );
    	}
    	else if( args.length == 1 ) {
    		String pwdEnc = createFromData( args[0] ).getEncryptedPassword();
        	System.out.println( "Encrypted value :");
        	System.out.println( pwdEnc );
        	
        	System.out.println( );
        	System.out.println( "Original value :");
        	System.out.println( createFromEncryptedData(pwdEnc).getPassword() );

			writeToScript();
    	}
    	else {
    		System.out.println("Usage: TwoWayPassword  <passphrase> [decrypt]" );
    		System.exit(1);
    		
    	}
    }	

}
	
	
