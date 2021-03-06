package emds.epi.impl.security;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.Arrays;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

import emds.epi.decl.exceptions.EpiBaseException;
import emds.epi.decl.exceptions.TechnicalException;

/**
 * 
 * @author bha
 *
 * History
 * =======
 * 12.07.2016 WLI IN-0003962: IndexOutOfBoundException with very long passwords.
 */
public class Password {
				
	protected final static Logger logger = Logger.getLogger("emds.runtime.security");
	
		protected String 		salt;
		protected byte 	[] 		digest;
				
		protected Password( String salt, String passphrase) {
			this.salt 	= salt;
			this.digest = getPasswordDigest( passphrase );
		}
		
		protected Password( String encrypted ) throws SecurityException {
    		try {
				byte[]  bytes = convertToByte( encrypted );
				initFromEncryptedData( bytes );
			} 
    		catch (IOException e) {
    			logger.log(Level.SEVERE, "invalid password digest", e);
    			throw new SecurityException ("invalid password digest: " + encrypted);
			}
		}
		
//	    /**
//	     * Create a password object from the password.
//	     * 
//	     * @param salt			
//	     * @param passphrase			
//	     * @return password instance
//	     * @throws SecurityException
//	     */
//
//		public static Password createFromData( String salt, String passphrase ) throws SecurityException {
//			return new Password( salt, passphrase );
//		}
//		
//	    /**
//	     * Create a password object from the password. A salt value is generated by a random generator
//	     * 
//	     * @param passphrase
//	     * @return password instance
//	     * @throws SecurityException
//	     */
//	    
//	    public static Password createFromData( String passphrase ) throws SecurityException {
//			return new Password( generateSalt( 15 ), passphrase );
//	    }		
//			
//	    /**
//	     * Create a password object from the encrypted data.
//	     * 
//	     * @param encrypted encrypted data
//	     * @return password instance
//	     * @throws SecurityException
//	     */
//	    
//	    public static Password createFromEncryptedData( String encrypted ) throws SecurityException {
//			return new Password( encrypted );
//	    }	    
	    
	    /**
	     * Initialize a password object from a given encrypted form
	     * 
	     * @param passwordDigest encrypted data
	     * @throws SecurityException
	     */
	    
		private void initFromEncryptedData( byte[]  bytes ) throws IOException, SecurityException  {
    	
	    	ByteArrayInputStream 		bIn 			= null;
	    	DataInputStream				dIn 			= null;
	    	String 						salt 			= null;
	    	String 						marker  		= null;
	    	int 						digestLength 	= 0;
	    	byte					 	[] digestData	= null;
	    
	    	bIn 	= new ByteArrayInputStream( bytes ); // throws SecurityException
	    	dIn 	= new DataInputStream( bIn );
    		
	    	salt 			= dIn.readUTF();
	    	marker  		= dIn.readUTF();
	    	digestLength 	= dIn.readInt();
	    	
	    	digestData		= new byte[ digestLength ];
	    	dIn.read( digestData );
	    	
	    	dIn.close();
	    
	    	if( marker.equals( getMarker( salt ) ) == false ) {
	    		throw new SecurityException("no valid password");
	    	}
	    	
	    	this.salt 	= salt;
	    	this.digest = digestData;
	    	
//	    	WL: we need not to close the stream here, because dIn reads from a byte array
	    	
//	    	When we close the stream this way the class loader tries to load org.hibernate.HibernateException
//	    	because the class ResourceHelper references hibernate
	    	
//	    	finally {
//	    		ResourceHelper.close( dIn );
//	    	}
		
		}

		protected Password intCreateFromData( String salt, String passphrase ) throws SecurityException {
			return new Password( salt, passphrase );
		}		
		
		@Override
		public boolean equals(Object arg0) {

			Password pwdToCheck = null;
			
			if( arg0 instanceof String ) {
				try {
					pwdToCheck = intCreateFromData( this.salt, (String)arg0 );
				} catch (SecurityException e) {
					return false;
				}
			}
			
			if( arg0 instanceof Password ) {
				pwdToCheck = (Password)arg0;
			}
			
			if( pwdToCheck == null ) {
				return false;
			}
			
			if( pwdToCheck.salt.equals( this.salt ) == false ) {
				return false;
			}
		
			return Arrays.equals( this.digest, pwdToCheck.digest );
		}
		
		
		/**
		 * Prepares an base64-encoding of the given password
		 * @return
		 * @throws EpiBaseException
		 */
				
		public String getEncryptedPassword() throws EpiBaseException {
			
	    	ByteArrayOutputStream 		bOut 		= new ByteArrayOutputStream( );
	    	DataOutputStream			dOut 		= new DataOutputStream( bOut );
	    	
	    	try {
		    	dOut.writeUTF( salt );
		    	dOut.writeUTF( getMarker( salt ) );
		    	dOut.writeInt( digest.length );
		    	dOut.write( digest );
	    	}
	    	catch( Exception e ) {
	    		throw new TechnicalException( e, false );
	    	}
//	    	WL: we need not to close the stream here, because dOut writes into a byte array
	    	
//	    	When we close the stream this way the class loader tries to load org.hibernate.HibernateException
//	    	because the class ResourceHelper references hibernate
	    	
//	    	finally {
//	    		ResourceHelper.close( dOut );
//	    	}
	    	
	    	return convertToHex( bOut.toByteArray() );		
	    }
		
	   public static byte [] convertToByte( String encryptedPassword ) throws SecurityException {

		   final String base64Data = encryptedPassword.toLowerCase();
		   final byte [] arData = new byte[ base64Data.length() / 2];
		   
		   byte value = 0;
		   int pos = 0; // IN-0003962 pos was a byte which led to an IndexOutOfBoundsException with very long passwords
		   
		   for( int i = 0; i < base64Data.length(); i++ ) {
			   
			   char c = base64Data.charAt( i );
			   
			   if( c >= '0' && c <= '9' ) {
				   value = (byte)( ( value | ( c - '0' ) ) );
			   }
			   else if( c >= 'a' && c <= 'f' ) {
				   value = (byte)( value | ( c - 'a' + 10 ) );
			   }
			   else {
		    		throw new SecurityException( "Invalid passwordDigest" );
			   }
			   			   
			   if( ( i % 2 ) == 1 )  {
				   arData[ pos++ ] = value;
				   value = 0;
			   }
			   else {
				   value <<= 4;
			   }
		   }
		   
		   return arData;
	    }	
	
	   public static String convertToHex(byte[] data) {

		   StringBuilder buf = new StringBuilder();
	       
		   for (int i = 0; i < data.length; i++) {
	        	int halfbyte = (data[i] >>> 4) & 0x0F;
	        	int two_halfs = 0;
	        	do {
		            if ((0 <= halfbyte) && (halfbyte <= 9))
		                buf.append((char) ('0' + halfbyte));
		            else
		            	buf.append((char) ('a' + (halfbyte - 10)));
		            halfbyte = data[i] & 0x0F;
	        	} while(two_halfs++ < 1);
	        }
	        return buf.toString();
	    }
		 
	   protected byte [] getPasswordDigest( String text )  throws SecurityException  {
	    	
		   text = salt + text;
		   
	    	try {
				MessageDigest md = MessageDigest.getInstance("SHA-1");
		
				byte[] sha1hash = new byte[40];
		
				md.update(text.getBytes("iso-8859-1"), 0, text.length());
	
				for( int i = 0; i < 100; i++ ) {
					md.update( sha1hash );
				}
			
				return md.digest();
	    	}
	    	catch( Exception e ) {
	    		throw new SecurityException( "Failed to create passwordDigest", e );
	    	}
	    }		
	    	    
	    /**
	     * Compute a marker value that is obfuscated by use of the given salt
	     * @param salt
	     * @return
	     */
	    
	    private static String getMarker( String salt ) {
	    	
	    	String 	marker 		= "MARKER";
	    	String  result		= "";
	    	int 	nSaltCount 	= 0;
	    	
	    	for( int i = 0; i < marker.length(); i++ ) {
	    		result  =  result + (char)(  'a' + (( marker.charAt( i ) + salt.charAt( nSaltCount ) ) % 26 )  );
	    		nSaltCount = ( nSaltCount + 1 ) % salt.length();
	    	}
	    	
	    	return result;
	    }
	    	    
	    /**
	     * Generate a randomly generated salt value with a given length
	     * 
	     * @param length
	     * @return
	     */
	    
	    protected static String generateSalt( int length ) {
	    	
	    	Random myRandom = new Random();
	    	String result 	= "";
	    	
	    	for( int i = 0; i < length; i++ ) {
	    		result = result + (char)( 'A' + myRandom.nextInt( 26 ) );
	    	}
	    	
	    	return result;
	    }
		    
//	    public static void main( String [] args ) throws Exception {
//
//	    	if( args.length < 1 ) {
//	    		System.out.println("Usage: Password  <passphrase>" );
//	    		System.exit(1);
//	    	}
//	    	
//	    	System.out.println( createFromEncryptedData( args[0] ) );
//	    	System.out.println( createFromData( args[0] ).getEncryptedPassword() );
//	 	    	
//	    }
}
