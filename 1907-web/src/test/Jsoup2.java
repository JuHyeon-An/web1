package test;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Jsoup2 {

	
public static void main(String[] args) throws Exception {
        
        Document doc = Jsoup.connect("https://www.istarbucks.co.kr/menu/product_view.do?product_cd=9300000002364").get();
        String folder = doc.title();
        //Element element = doc.select("dt > a").get(0);
        Elements img = doc.select("li > a");
        int page = 0;

        System.out.println("for문시작전");
        for (Element e : img) {
            String url = e.getElementsByAttribute("data-image").attr("data-image");
            System.out.println(url);
            URL imgUrl = new URL(url);
            BufferedImage jpg = ImageIO.read(imgUrl);
            File file = new File("C:/Users/Ellen/Pictures/"+folder+"/"+page+".jpg");
            ImageIO.write(jpg, "jpg", file);
            page+=1;
            
            System.out.println("성공");
        }
    }

}
