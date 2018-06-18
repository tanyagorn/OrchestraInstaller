
import com.izforge.izpack.panels.process.AbstractUIProcessHandler;
 
public class HelloWorld {
  public void run(AbstractUIProcessHandler handler, String[] args) {
    handler.logOutput("Hello, World!", false);
  }
}