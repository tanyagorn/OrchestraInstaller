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
 
public class EncryptPassword  {

  public void run(AbstractUIProcessHandler handler, String[] args)  throws Exception {

  	handler.logOutput("Encrypting password... ", false);

		String passwd = emds.epi.impl.security.TwoWayPassword.createFromData( args[1] ).getEncryptedPassword();

		String tmp = "";
		if (args[0].equals("windows"))
			tmp = args[2] + "\\orchestra\\WEB-INF\\classes\\config";
		else if (args[0].equals("unix"))
			tmp = args[2] + "//orchestra//WEB-INF//classes//config";

    	Path path = Paths.get(tmp, "environment_settings.xml");

		Charset charset = StandardCharsets.UTF_8;
		String content = new String(Files.readAllBytes(path), charset);
		content = content.replaceAll("dummy_password", passwd);
		Files.write(path, content.getBytes(charset));
  	}
}