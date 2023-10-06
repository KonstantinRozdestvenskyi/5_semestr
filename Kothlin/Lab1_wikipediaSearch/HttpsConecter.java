import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class HttpsConecter {
    
    HttpsConecter(){
    }

    public static String sendGet(String url) throws IOException{
        StringBuilder response = new StringBuilder();
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection)obj.openConnection();
        con.setRequestMethod("GET");
        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
        String inputLine;

        try{
            while((inputLine = in.readLine()) != null){
                response.append(inputLine);
            }
        }
        catch (Throwable var8){
            try{
                in.close();
            }
            catch(Throwable var7){
                var8.addSuppressed(var7);
            }

            throw var8;
        }

        in.close();
        return response.toString();

    } 
}
