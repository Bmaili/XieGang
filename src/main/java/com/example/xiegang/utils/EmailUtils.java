package com.example.xiegang.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class EmailUtils {

    //发件人信息
    private static String From = "斜杠团队";
    //发件人邮箱
    private static String recipient = "3073495826@qq.com";
    //邮箱密码
    private static String password = "qvmyhjmkhqrqdfgb";
    //邮件发送的服务器
    private static String host = "smtp.qq.com";


    public static void sendEmail(String email, String code) {
        String context = "您好，您正在验证斜杠青年账户: <b>" + email + "</b><br>" +
                "您的验证码为: <b>" + code + "</b><br>" +
                "验证码3分钟内有效，请勿告知任何人^_^<br>" +
                "若不是本人操作，请忽略此邮件或者联系客服<b>3073495826@qq.com</b>";
        try {
            Properties properties = new Properties();

            properties.setProperty("mail.host", "smtp.qq.com");

            properties.setProperty("mail.transport.protocol", "smtp");

            properties.setProperty("mail.smtp.auth", "true");

            properties.setProperty("mail.smtp.auth", "587");

            //QQ存在一个特性设置SSL加密
            MailSSLSocketFactory sf = null;
            try {
                sf = new MailSSLSocketFactory();
            } catch (GeneralSecurityException e) {
                e.printStackTrace();
            }
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);

            //创建一个session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(recipient, password);
                }
            });

            // //开启debug模式
            // session.setDebug(true);

            //获取连接对象
            Transport transport = null;
            try {
                transport = session.getTransport();
            } catch (NoSuchProviderException e) {
                e.printStackTrace();
            }

            //连接服务器
            transport.connect(host, From, password);


            //创建一个邮件发送对象
            MimeMessage mimeMessage = new MimeMessage(session);
            //邮件发送人
            mimeMessage.setFrom(new InternetAddress(recipient, MimeUtility.encodeText("斜杠青年系统通知", MimeUtility.mimeCharset("gb2312"), null)));

            //邮件接收人
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(email));

            //邮件标题
            mimeMessage.setSubject("斜杠青年邮箱验证");

            //邮件内容
            mimeMessage.setContent(context, "text/html;charset=UTF-8");

            //发送邮件
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());

            transport.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void main(String[] args) {
        new EmailUtils().sendEmail("2228921046@qq.com", "5647");
    }

}
