using System;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace Final_DotNet.Service.Auth;
public class EmailService
{
    private readonly string smtpHost;
    private readonly int smtpPort;
    private readonly string smtpUsername;
    private readonly string smtpPassword;

    public EmailService(string smtpHost, int smtpPort, string smtpUsername, string smtpPassword)
    {
        this.smtpHost = smtpHost;
        this.smtpPort = smtpPort;
        this.smtpUsername = smtpUsername;
        this.smtpPassword = smtpPassword;
    }
    public string GenerateVerificationCode()
    {
        return Guid.NewGuid().ToString().Substring(0, 6).ToUpper();
    }
    public async Task SendEmailAsync(string toEmail, string VerificationCodeSent)
    {
        using (var smtpClient = new SmtpClient(smtpHost))
        {
            smtpClient.Port = smtpPort;
            smtpClient.UseDefaultCredentials = false;
            smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);
            smtpClient.EnableSsl = true;

            var message = new MailMessage
            {
                From = new MailAddress(smtpUsername),
                Subject = "Forgot Password in website Electric Store",
                Body = "Please copy code to change password in website: "+ VerificationCodeSent,
                IsBodyHtml = true,
            };

            message.To.Add(toEmail);

            await smtpClient.SendMailAsync(message);
        }
    }
}
