package com.neutrino.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Random;

@Controller
public class CheckImageController {
    /**
     * 获取验证码
     *
     * @param response
     * @param session
     */
    @RequestMapping("/getImage")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = drawImg(output);

        session.setAttribute("verifyCodeValue", verifyCodeValue);

        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 绘画验证码
     *
     * @param output
     * @return
     */
    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        //绘制干扰线
        Random random = new Random();// 生成随机数
        g.setColor(getRandColor(160, 200));
        int x1;
        int x2;
        int y1;
        int y2;
        for (int i = 0; i < 30; i++) {
            x1 = random.nextInt(width);
            x2 = random.nextInt(12);
            y1 = random.nextInt(height);
            y2 = random.nextInt(12);
            g.drawLine(x1, y1, x1 + x2, x2 + y2);
        }
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }

    private Color getRandColor(int fc, int bc) {
        // 取其随机颜色
        Random random = new Random();
        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }
        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);
        return new Color(r, g, b);
    }
    /**
     * 随机产生一个字符
     *
     * @return
     */
    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }
}
