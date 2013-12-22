// Code modified from:
// Daniel Shiffman               
// http://www.shiffman.net       

void sendMail() {
  // Create a session
  String host="smtp.gmail.com";
  Properties props=new Properties();

  // SMTP Session
  props.put("mail.transport.protocol", "smtp");
  props.put("mail.smtp.host", host);
  props.put("mail.smtp.port", "25");
  props.put("mail.smtp.auth", "true");
  // We need TTLS, which gmail requires
  props.put("mail.smtp.starttls.enable","true");

  // Create a session
  Session session = Session.getDefaultInstance(props, new Auth());

  try
  {
    // Make a new message
    MimeMessage message = new MimeMessage(session);

    // Who is this message from
    message.setFrom(new InternetAddress("address@gmail.com", "Name of Sender"));

    // Who is this message to (we could do fancier things like make a list or add CC's)
    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));

    // Subject and body
    message.setSubject("Message subject");
    
   // create the message 
   MimeBodyPart messageBodyPart = new MimeBodyPart();
  
   //fill message to be sent
   messageBodyPart.setText("Message text");
  
   Multipart multipart = new MimeMultipart();
   multipart.addBodyPart(messageBodyPart);
  
   //attach your file here
   messageBodyPart = new MimeBodyPart();
   String fileName = "path/to/file";
   DataSource source =  new FileDataSource(fileName); // your file
   messageBodyPart.setDataHandler( new DataHandler(source));
   messageBodyPart.setFileName("filename");
   multipart.addBodyPart(messageBodyPart);
  
   // Put message in parts
   message.setContent(multipart);

    // We can do more here, set the date, the headers, etc.
    Transport.send(message);
    println("Mail sent!");

  }
  catch(Exception e)
  {
    e.printStackTrace();
  }

}


