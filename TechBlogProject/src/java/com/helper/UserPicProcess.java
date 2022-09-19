/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author User
 */
public class UserPicProcess {
    public static boolean deleteFile(String path){
        boolean deleted = false;
        File f = new File(path);
        deleted = f.delete();
        return deleted;
    }
    
    public static boolean saveFile(InputStream is,String path){
        boolean saved = false;
        try{
            byte[] b = new byte[is.available()];
            is.read(b);
            
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            fos.flush();
            fos.close();
            saved = true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return saved;
    }
}
