import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;


public class App {

    public static void main(String[] args) throws Exception {
        try{
        
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in, "cp866"));
            while(true){
                System.out.print("Enter search query or 0 for exit: ");
                String input = reader.readLine();
                if("0".equals(input)){
                    return;
                }
                String EncodeQuery = URLEncoder.encode(input, "UTF-8");
                String APIUrl = "https://ru.wikipedia.org/w/api.php?action=query&list=search&utf8=&format=json&srsearch=" + EncodeQuery + "&srlimit=10";
                String jsonResponse = HttpsConecter.sendGet(APIUrl);
                Gson gson = new Gson();
                JsonObject jsonObject = (JsonObject)gson.fromJson(jsonResponse,JsonObject.class);
                JsonObject query = jsonObject.getAsJsonObject("query");
                JsonArray searchResults = query.getAsJsonArray("search");

                if (!searchResults.isEmpty()){
                    System.out.println("Search result");

                    int choice;
                    JsonObject chosenResult;
                    for(choice = 0; choice < searchResults.size(); ++choice){
                        chosenResult = searchResults.get(choice).getAsJsonObject();
                        String title = chosenResult.get("title").getAsString();
                        System.out.println(choice + 1 + ". " + title);
                    }

                    while(true) {
                        System.out.print("Enter the article number to open: ");
                        choice = Integer.parseInt(reader.readLine()) - 1;
                        if (choice >= 0 && choice < searchResults.size()) {
                        chosenResult = searchResults.get(choice).getAsJsonObject();
                        int pageID = chosenResult.get("pageid").getAsInt();
                        System.out.print("Link to the article: https://ru.wikipedia.org/w/index.php?curid=" + pageID + "\n");
                        ResponseOpener.OpenBrowser(pageID);
                        break;
                        }

                        System.out.println("Incorrect article selection. Try again.");
                    }
                }
                else {
                    System.out.println("Nothing found");
                }
                
            }
        }
        catch (NumberFormatException var13) 
        {
            System.out.println("Error. It was not a number that was entered.");
        } 
        catch (IOException var14) {
            var14.printStackTrace();
        }
    }
}
