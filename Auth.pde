// Daniel Shiffman               
// http://www.shiffman.net       

// Simple Authenticator          
// Careful, this is terribly unsecure!!

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Auth extends Authenticator {

  public Auth() {
    super();
  }

  // Update username and password to send-from address
  public PasswordAuthentication getPasswordAuthentication() {
    String username, password;
    username = "address@gmail.com";
    password = "password";
    System.out.println("authenticating. . ");
    return new PasswordAuthentication(username, password);
  }
}
