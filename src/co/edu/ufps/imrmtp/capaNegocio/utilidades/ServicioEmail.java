/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.imrmtp.capaNegocio.utilidades;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

// Clave uso publico api gmail: AIzaSyCzTaiey8GIoxSdncmKh42znBS25hZNTDI
    
/**
 * Clase que permite enviar correo electronico a traves de los servidores de gmail
 * @author Marco Adarme
 * @version 2.0
 */
public class ServicioEmail {
    
    //Direccion del servidor smtp, puede cambiarlo a su servidor de su cuenta particular, en el caso de gmail es smtp.gmail.com
    private final String direccionServidorEmail="smtp.gmail.com";
    //Numero del puerto del servidor smtp, en el caso de gmail es el 587
    private final String puertoServidor="587";
    private Properties props = new Properties();
    //Direccion del email del usario que envia el mensaje
    private String emailUsuarioEmisor;
    //Contrase�a del usuario que envia el correo electronico
    private String claveEmailUsuarioEmisor;

    /**
     * 
     * Crea un objeto para enviar correo electronico
     * a traves de los servidores de gmail
     * @param emailUsuarioEmisor direccion email del usuario que envia el mensaje
     * @param claveEmailUsuarioEmisor contrase�a del usuario que envia el mensaje
     */
    
    public ServicioEmail(String emailUsuarioEmisor, String claveEmailUsuarioEmisor) {
        
        this.emailUsuarioEmisor = emailUsuarioEmisor;
        this.claveEmailUsuarioEmisor = claveEmailUsuarioEmisor;
        inicializarPropiedades();
                
    }
    
    
    /**
     * Inicia las propiedades del servicio de correo
     */    
    private void inicializarPropiedades() {
        
        props.setProperty("mail.smtp.host", this.direccionServidorEmail);
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.port", this.puertoServidor);
        props.setProperty("mail.smtp.user", this.emailUsuarioEmisor);
        props.setProperty("mail.smtp.auth", "true");
    
    }
    
    /**
     * Metodo que permite enviar un correo electronico en texto plano
     * @param receptor direccion email del usuario a quien se le envia el mensaje
     * @param asunto asunto del correo electronico
     * @param cuerpoMensaje  cuerpo del mensaje del correo electronico
     */    
    public boolean enviarEmail(String receptor, String asunto, String cuerpoMensaje) throws Exception{
        boolean rta=false;
            
            Session session = Session.getDefaultInstance(props);
            // Construimos el mensaje
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(this.emailUsuarioEmisor));
            message.addRecipient(Message.RecipientType.TO,new InternetAddress(receptor));
            message.setSubject(asunto);
            message.setText(cuerpoMensaje);
            Transport t = session.getTransport("smtp");
            t.connect(this.emailUsuarioEmisor, this.claveEmailUsuarioEmisor);
            t.sendMessage(message, message.getAllRecipients());
            t.close();
            rta=true;
        return rta;
    }
    
    /**
     * Metodo get que retona la clave del email
     * @return un tipo String que contiene la clave del email
     */
    public String getClaveEmailUsuarioEmisor() {
        
        return claveEmailUsuarioEmisor;
        
    }
    
    /**
     * Metodo set que modifica la clave del email
     * @param claveEmailUsuarioEmisor es de tipo String y contiene la nueva clave
     */
    public void setClaveEmailUsuarioEmisor(String claveEmailUsuarioEmisor) {
        
        this.claveEmailUsuarioEmisor = claveEmailUsuarioEmisor;
        
    }
    
    /**
     * Metodo get que retorna el email
     * @return un tipo String que ocntiene el email
     */
    public String getEmailUsuarioEmisor() {
        
        return emailUsuarioEmisor;
        
    }
    
    /**
     * Metodo set que modifica el email
     * @param emailUsuarioEmisor es de tipo String y contiene el nuevo email
     */
    public void setEmailUsuarioEmisor(String emailUsuarioEmisor) {
        
        this.emailUsuarioEmisor = emailUsuarioEmisor;
        
    }
    
}//Fin de la Clase 

