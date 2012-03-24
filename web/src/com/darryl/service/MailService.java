package com.darryl.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Created by IntelliJ IDEA.
 * User: vkumar
 * Date: 3/24/12
 * Time: 3:23 PM
 * To change this template use File | Settings | File Templates.
 */
public class MailService {
    String toEmail;
    String fromEmail;

    public String getToEmail() {
        return toEmail;
    }

    public void setToEmail(String email) {
        this.toEmail = email;
    }

    public String getFromEmail() {
        return fromEmail;
    }

    public void setFromEmail(String fromEmail) {
        this.fromEmail = fromEmail;
    }

    public void sendMail(String subject, String msgBody) {
        Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(this.fromEmail, "Vinay Kumar"));
            msg.addRecipient(Message.RecipientType.TO,
                    new InternetAddress(this.toEmail, "Site Admin"));
            msg.setSubject(subject);
            msg.setText(msgBody);
            Transport.send(msg);

        } catch (AddressException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
