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
 
public class ConfigMysqlScriptInstallAll  {

  public void run(AbstractUIProcessHandler handler, String[] args)  throws Exception {

  	handler.logOutput("Configuring file path... ", false);

		String tmp = "";
		String subString = "";

		if (args[0].equals("windows")) {
			tmp = args[1] + "\\Database\\Scripts\\MySQL\\";
			subString = args[1] + "\\Database\\Scripts\\MySQL\\";
        } else if (args[0].equals("unix")) {
			tmp = args[1] + "//Database//Scripts//MySQL//";
			subString = args[1] + "/Database/Scripts/MySQL/";
        }

    	Path path = Paths.get(tmp, "mysql_install_all.sql");

		Charset charset = StandardCharsets.UTF_8;
		String content = new String(Files.readAllBytes(path), charset);
		content = content.replaceAll("%FILE_PATH%", subString);
		Files.write(path, content.getBytes(charset));
  	}
}
