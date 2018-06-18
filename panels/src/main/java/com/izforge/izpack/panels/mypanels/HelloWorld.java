import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.izforge.izpack.panels.process.AbstractUIProcessHandler;
 
public class HelloWorld {

  public void run(AbstractUIProcessHandler handler, String[] args) {
    handler.logOutput("Hello, World eiei!", false);
    handler.logOutput(args[0], false);
    handler.logOutput(args[1], false);

    String path = args[1] + "\\Orchestra\\Application\\orchestra\\WEB-INF\\classes\\config\\environment_settings.xml";
    handler.logOutput(path, false);
    String workingDir = System.getProperty("user.dir");
		System.out.println( "Working directory:" + workingDir );
		System.out.println( "Enter method writing file :");
		BufferedWriter out = null;
		try  
		{
			FileWriter fstream = new FileWriter(path, true); //true tells to append data.			
			System.out.println( "Writing file :" + workingDir);
			out = new BufferedWriter(fstream);
			out.write("\nVaderz");
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
}