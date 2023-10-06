import java.awt.Desktop;
import java.net.URI;

public class ResponseOpener {
    ResponseOpener(){
    }

    public static void OpenBrowser(int PageId){
        String url = "https://ru.wikipedia.org/w/index.php?curid=" + PageId;

        try{
            Desktop.getDesktop().browse(new URI(url));
        }
        catch(Exception var3){
            var3.printStackTrace();
        }
    }
}
