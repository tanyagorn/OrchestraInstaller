package emds.epi.impl.security;

import java.io.*;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import com.izforge.izpack.panels.process.AbstractUIProcessHandler;
 
public class EncryptUsername  {

  public void run(AbstractUIProcessHandler handler, String[] args)  throws Exception {

		handler.logOutput("Encrypting username... ", false);
		
		String passwd = emds.epi.impl.security.TwoWayPassword.createFromData( args[0] ).getEncryptedPassword();
		String tmp = args[1] + "\\Application\\orchestra\\WEB-INF\\classes\\config";
    Path path = Paths.get(tmp, "environment_settings.xml");

		Charset charset = StandardCharsets.UTF_8;
		String content = new String(Files.readAllBytes(path), charset);
		content = content.replaceAll("dummy_username", passwd);
		Files.write(path, content.getBytes(charset));
		}
}