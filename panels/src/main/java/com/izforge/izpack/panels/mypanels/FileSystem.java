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
import java.nio.file.*;


import com.izforge.izpack.panels.process.AbstractUIProcessHandler;
 
/**
 Copy JDBC driver to destination
 args[0] - path where JDBC driver to be copied is located
 args[1] - path where JDBC driver should be copied to
 */

public class FileSystem  {

  public void run(AbstractUIProcessHandler handler, String[] args)  throws Exception {

		handler.logOutput("Copying JDBC driver to destination... ", false);
		
        Path source = Paths.get(args[0]);
        Path destination = Paths.get(args[1]);
        try {
            Files.copy(source, destination.resolve(source.getFileName()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}