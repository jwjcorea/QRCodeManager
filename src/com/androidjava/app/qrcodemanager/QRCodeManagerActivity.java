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
import android.util.Log;

class Filters{
    float xscale;
    float yscale;
    float xshift;
    float yshift;
    int [] s;
    private String TAG = "Filters";
    public Filters(){

        Log.e(TAG, "***********inside constructor");
    }

    public Bitmap barrel (Bitmap input, float k){
        Log.e(TAG, "***********inside barrel method ");
        float centerX=input.getWidth()/2; //center of distortion
        float centerY=input.getHeight()/2;

        int width = input.getWidth(); //image bounds
        int height = input.getHeight();

        Bitmap dst = Bitmap.createBitmap(width, height,input.getConfig() ); //output pic
        Log.e(TAG, "***********dst bitmap created ");
          xshift = calc_shift(0,centerX-1,centerX,k);
          float newcenterX = width-centerX;
          float xshift_2 = calc_shift(0,newcenterX-1,newcenterX,k);

          yshift = calc_shift(0,centerY-1,centerY,k);
          float newcenterY = height-centerY;
          float yshift_2 = calc_shift(0,newcenterY-1,newcenterY,k);

          xscale = (width-xshift-xshift_2)/width;
          yscale = (height-yshift-yshift_2)/height;
          Log.e(TAG, "***********about to loop through bm");
          /*for(int j=0;j<dst.getHeight();j++){
              for(int i=0;i<dst.getWidth();i++){
                float x = getRadialX((float)i,(float)j,centerX,centerY,k);
                float y = getRadialY((float)i,(float)j,centerX,centerY,k);
                sampleImage(input,x,y);
                int color = ((s[1]&0x0ff)<<16)|((s[2]&0x0ff)<<8)|(s[3]&0x0ff);
    //            System.out.print(i+" "+j+" \\");

                dst.setPixel(i, j, color);

              }
            }*/

          int origPixel; // the pixel in orig image

          for(int j=0;j<dst.getHeight();j++){
              for(int i=0;i<dst.getWidth();i++){
                 origPixel= input.getPixel(i,j);
                float x = getRadialX((float)i,(float)j,centerX,centerY,k);
                float y = getRadialY((float)i,(float)j,centerX,centerY,k);
                sampleImage(input,x,y);
                int color = ((s[1]&0x0ff)<<16)|((s[2]&0x0ff)<<8)|(s[3]&0x0ff);
    //            System.out.print(i+" "+j+" \\");


// check whether a pixel is within the circle bounds of 150

                if( Math.sqrt( Math.pow(i - centerX, 2) + ( Math.pow(j - centerY, 2) ) ) <= 150 ){
                dst.setPixel(i, j, color);
                }else{
                    dst.setPixel(i,j,origPixel);
                }
              }
            }
        return dst;
    }

    void sampleImage(Bitmap arr, float idx0, float idx1)
    {
        s = new int [4];
      if(idx0<0 || idx1<0 || idx0>(arr.getHeight()-1) || idx1>(arr.getWidth()-1)){
        s[0]=0;
        s[1]=0;
        s[2]=0;
        s[3]=0;
        return;
      }

      float idx0_fl=(float) Math.floor(idx0);
      float idx0_cl=(float) Math.ceil(idx0);
      float idx1_fl=(float) Math.floor(idx1);
      float idx1_cl=(float) Math.ceil(idx1);

      int [] s1 = getARGB(arr,(int)idx0_fl,(int)idx1_fl);
      int [] s2 = getARGB(arr,(int)idx0_fl,(int)idx1_cl);
      int [] s3 = getARGB(arr,(int)idx0_cl,(int)idx1_cl);
      int [] s4 = getARGB(arr,(int)idx0_cl,(int)idx1_fl);

      float x = idx0 - idx0_fl;
      float y = idx1 - idx1_fl;

      s[0]= (int) (s1[0]*(1-x)*(1-y) + s2[0]*(1-x)*y + s3[0]*x*y + s4[0]*x*(1-y));
      s[1]= (int) (s1[1]*(1-x)*(1-y) + s2[1]*(1-x)*y + s3[1]*x*y + s4[1]*x*(1-y));
      s[2]= (int) (s1[2]*(1-x)*(1-y) + s2[2]*(1-x)*y + s3[2]*x*y + s4[2]*x*(1-y));
      s[3]= (int) (s1[3]*(1-x)*(1-y) + s2[3]*(1-x)*y + s3[3]*x*y + s4[3]*x*(1-y));
    }

    int [] getARGB(Bitmap buf,int x, int y){
        int rgb = buf.getPixel(y, x); // Returns by default ARGB.
        int [] scalar = new int[4];
        scalar[0] = (rgb >>> 24) & 0xFF;
        scalar[1] = (rgb >>> 16) & 0xFF;
        scalar[2] = (rgb >>> 8) & 0xFF;
        scalar[3] = (rgb >>> 0) & 0xFF;
        return scalar;
    }

    float getRadialX(float x,float y,float cx,float cy,float k){
      x = (x*xscale+xshift);
      y = (y*yscale+yshift);
      float res = x+((x-cx)*k*((x-cx)*(x-cx)+(y-cy)*(y-cy)));
      return res;
    }

    float getRadialY(float x,float y,float cx,float cy,float k){
      x = (x*xscale+xshift);
      y = (y*yscale+yshift);
      float res = y+((y-cy)*k*((x-cx)*(x-cx)+(y-cy)*(y-cy)));
      return res;
    }

    float thresh = 1;

    float calc_shift(float x1,float x2,float cx,float k){
      float x3 = (float)(x1+(x2-x1)*0.5);
      float res1 = x1+((x1-cx)*k*((x1-cx)*(x1-cx)));
      float res3 = x3+((x3-cx)*k*((x3-cx)*(x3-cx)));

      if(res1>-thresh && res1 < thresh)
        return x1;
      if(res3<0){
        return calc_shift(x3,x2,cx,k);
      }
      else{
        return calc_shift(x1,x3,cx,k);
      }
    }
}

public class QRCodeManagerActivity extends Activity {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        Button btn = (Button) findViewById(R.id.btnCreateQRCode);   
        btn.setOnClickListener(new View.OnClickListener() {
        	
        	Bitmap tgtImg = BitmapFactory.
        				
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