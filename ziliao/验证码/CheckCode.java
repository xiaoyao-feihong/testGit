package com.gdx.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/image.do")
public class CheckCode extends HttpServlet {
    public static final int WIDTH = 140;//生成图片的宽度
    public static final int HEIGHT = 30;//生成图片的高度
    public static final int WORDS_NUMBER = 5;//验证码中字符的个数
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String createTypeFlag = req.getParameter("createTypeFlag");//接收客户端传递的createTypeFlag标识
        //在内存中创建一张图片
        BufferedImage bi = new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_3BYTE_BGR);
        //得到图片
        Graphics g = bi.getGraphics();
        //设置图片的背景色
        setBackGround(g);
        //设置图片的边框
        setBorder(g);
        //在图片上画干扰线
        drawRandomLine(g);
        //在图片上放上随机字符
        String randomString = this.drawRandomNum((Graphics2D)g, createTypeFlag);
        
        //将随机数存在session中
        req.getSession().setAttribute("checkcode", randomString);
        
        //设置响应头通知浏览器以图片的形式打开
        resp.setContentType("image/jpeg");
        
        //设置响应头控制浏览器不要缓存
        resp.setDateHeader("expries", -1);
        resp.setHeader("Cache-Control", "no-cache");
        resp.setHeader("Pragma", "no-cache");
        
        //将图片传给浏览器
        ImageIO.write(bi, "jpg", resp.getOutputStream());
    }
    
    //设置图片背景色
    //@param g
    private void setBackGround(Graphics g) {
        //设置颜色
        g.setColor(Color.WHITE);
        //填充区域
        g.fillRect(0, 0, WIDTH, HEIGHT);
    }
    
    /*
     * 设置图片的边框
     * @param g
     * */
    
    private void setBorder(Graphics g) {
        //设置边框颜色
        g.setColor(Color.BLUE);
        //边框区域
        g.drawRect(1, 1, WIDTH - 2, HEIGHT -2);
    }
    
    /*
     * 在图片上画随机线条 
     * @param g
     * */
    private void drawRandomLine(Graphics g) {
        //设置颜色
        g.setColor(Color.GREEN);
        //设置线条个数并画线
        for ( int i = 0 ; i < 3 ; i++ ) {
            int x1 = new Random().nextInt(WIDTH);
            int y1 = new Random().nextInt(HEIGHT);
            int x2 = new Random().nextInt(WIDTH);
            int y2 = new Random().nextInt(HEIGHT);
            g.drawLine(x1, y1, x2, y2);
        }
    }
    
    /*
     * 在图片上画随机字符
     * @param g
     * @param createTypeFlag
     * @return String
     * */
    private String drawRandomNum(Graphics g,String createTypeFlag) {
        //设置颜色
        g.setColor(Color.RED);
        g.setFont(new Font("宋体",Font.BOLD,20));
        
        //数字字母的组合
        String baseNumLetter = "0123456789ABCDEFGHJKLMNOPQRSTUVWXYZ";
        String baseNum = "0123456789";
        String baseLetter = "ABCDEFGHJKLMNOPQRSTUVWXYZ";
        if ( createTypeFlag != null  && createTypeFlag.length() > 0 ) {
            if( createTypeFlag.equals("nl") ) {
                //截取数字和字母的组合
                return createRandomChar((Graphics2D) g,baseNumLetter);
            } else if ( createTypeFlag.equals("n") ) {
                //截取数字的组合
                return createRandomChar((Graphics2D) g,baseNum);
            } else if ( createTypeFlag.equals("l") ) {
                //截取字母的组合
                return createRandomChar((Graphics2D) g,baseLetter);
            }
        } else {
            //截取数字和字母的组合
            return createRandomChar((Graphics2D) g,baseNumLetter);
        }
        return "";
    }
    
    /*
     * 创建随机字符
     * @param g
     * @param baseChar
     * @return String
     * */
    private String createRandomChar(Graphics2D g , String baseChar) {
        StringBuffer b = new StringBuffer();
        int x = 5;
        String ch = "";
        for ( int i = 0 ; i < WORDS_NUMBER ; i++ ) {
            //设置字体的旋转角度
            int degree = new Random().nextInt() % 30;
            ch = baseChar.charAt(new Random().nextInt(baseChar.length())) + "";
            b.append(ch);
            
            //正向角度
            g.rotate(degree  * Math.PI / 180 , x,20);
            g.drawString(ch, x, 20);
            //反向角度
            g.rotate(-degree  * Math.PI / 180 , x,20);
            x+=30;
        }
        return b.toString();
    }
}