/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package preparearray;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;
import java.nio.file.Files;

/**
 *
 * @author Miguel
 */
public class PrepareArray {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        String s = "";
        FileReader reader = new FileReader("datos.txt");
        int character;
        while ((character = reader.read()) != -1) {
            s += (char) character;
        }
        reader.close();
       
        s = s.replace("[", "");
        s = s.replace("]", "");
        s = s.replaceAll(",", "");
       
        FileWriter writer = new FileWriter("datos.txt");
        writer.write(s);
        writer.close();
        
        System.out.print(s);
    }
    
}
