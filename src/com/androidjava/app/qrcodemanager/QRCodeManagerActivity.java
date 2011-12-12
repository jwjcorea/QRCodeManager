package com.androidjava.app.qrcodemanager;

import java.io.FileNotFoundException;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;

import java.io.FileOutputStream;
import java.io.IOException;

import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;

import QRCodeLibEx.QRCodeLibEx;
import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.util.Log;

public class QRCodeManagerActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        Button btn = (Button) findViewById(R.id.btnCreateQRCode);   
        btn.setOnClickListener(new View.OnClickListener() {
        	
        	BitmapDrawable Image = new BitmapDrawable(R, "/data/images/ima.png"); 
        	Bitmap Image2 = Image.getBitmap();
        	Image2.ge
        				
			@Override
			public void onClick(View v) {
				// TODO Auto-generated method stub
				try {
					//FileOutputStream fos = new FileOutputStream("/mnt/sdcard/qrcode.png");
					FileOutputStream fos = new FileOutputStream("/data/data/com.androidjava.app.qrcodemanager/qrcode.png");					
					QRCodeLibEx.CreateQRCode(fos);					
				} catch (FileNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (WriterException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		});
    }
}