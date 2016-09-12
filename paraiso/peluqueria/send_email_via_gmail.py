import smtplib

from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email import encoders
import os

gmail_user = "pelu.paraisodeamor@gmail.com"
gmail_name = "Peluqueria Paraíso de Amor <pelu.paraisodeamor@gmail.com>"
gmail_pwd = "phu6cowiaM"

def mail(to, subject, text, attach):
   msg = MIMEMultipart()

   msg['From'] = gmail_name
   msg['To'] = to
   msg['Subject'] = subject

   msg.attach(MIMEText(text))

   part = MIMEBase('application', 'octet-stream')
   part.set_payload(open(attach, 'rb').read())
   encoders.encode_base64(part)

   part.add_header('Content-Disposition',
             'attachment; filename="%s"' % os.path.basename(attach))

   msg.attach(part)

   mailServer = smtplib.SMTP("smtp.gmail.com", 587)
   mailServer.ehlo()
   mailServer.starttls()
   mailServer.ehlo()
   mailServer.login(gmail_user, gmail_pwd)
   mailServer.sendmail(gmail_name, to, msg.as_string())   # name + e-mail address in the From: field
   mailServer.close()

"""
if __name__ == "__main__":
    mail("send-mail-to-this-person@address.com",
       "Hello from Python!",
       "This is an e-mail sent with Python.",
       "/tmp/some-image.jpg")
"""
