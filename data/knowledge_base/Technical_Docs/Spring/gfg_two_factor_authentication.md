# Two Factor Authentication

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-two-factor-authentication/

Two-Factor Authentication (2FA) is an advanced security mechanism that requires users to verify their identity using two different authentication factors before accessing an application. Typically, users must provide something they know (password) and something they have (OTP, mobile device, authenticator app, etc.).
- Protects against password theft and brute-force attacks.
- Supported by Spring Security through custom authentication providers.
- Can be implemented using SMS, Email, or Authenticator Apps.
How 2FA Works in a Spring Boot Application
- User enters username and password.
- Spring Security validates user credentials.
- Application checks whether 2FA is enabled.
- An OTP or verification code is generated.
- Code is sent through SMS, Email, or Authenticator App.
- User enters the received code.
- Spring Security validates the code.
- Access is granted upon successful verification.
Types of Two-Factor Authentication (2FA)
1. SMS-Based 2FA
SMS-based authentication sends a One-Time Password (OTP) to the user's registered mobile number after successful password verification.
- OTP is delivered through SMS.
- Commonly used in banking and financial applications.
Here's a diagram that illustrates the SMS-based 2FA flow in Spring Security:
Diagram Explanation:
- User enters username and password.
- Spring Security validates credentials.
- Application generates OTP.
- OTP is sent using SMS providers such as Twilio.
- User enters OTP.
- Spring Security validates OTP.
- User gains access.
2. Email-Based 2FA
Email-based authentication sends a One-Time Password (OTP) or verification code to the user's registered email address.
- Easy to implement.
- Does not require a mobile device.
Here's a diagram that illustrates the Email-based 2FA flow in Spring Security:
Diagram Explanation:
- User enters username and password.
- Spring Security validates credentials.
- System generates OTP.
- OTP is sent through email.
- User retrieves OTP from inbox.
- User enters OTP.
- Spring Security validates the code.
- Access is granted.
3. App-Based 2FA (TOTP)
App-based authentication uses authenticator applications such as Google Authenticator or Microsoft Authenticator to generate Time-Based One-Time Passwords (TOTP).
- Most secure among common 2FA methods.
- OTP changes automatically every 30 seconds.
Here's a diagram that illustrates the App-based 2FA flow in Spring Security:
Diagram Explanation:
- User logs in with username and password.
- Server generates a secret key.
- Secret key is linked with the Authenticator App.
- App generates a TOTP code.
- User enters the TOTP.
- Spring Security validates the code.
- Access is granted.
Explanation of the Google Authenticator app and its integration with Spring Security:
- Google Authenticator is a two-factor authentication app developed by Google that provides an extra layer of security to user accounts. It generates time-based one-time passwords (TOTP) that are valid only for a short period, typically 30 seconds. The user needs to enter this code along with their password to access the application or service.
- To integrate Google Authenticator with Spring Security, the application needs to implement the TOTP-based two-factor authentication mechanism. This mechanism involves a secret key that is shared between the server and the user's device.
- The secret key is used to generate the TOTP codes on the device, and the server verifies the code's validity.
Comparison of Different 2FA Methods
| Feature | SMS-Based 2FA | Email-Based 2FA | App-Based 2FA | 
|---|---|---|---|
| Authentication Method | OTP via SMS | OTP via Email | TOTP via Mobile App | 
| Security Level | Medium | Medium | High | 
| Internet Required | No | Yes | No | 
| Third-Party Service | SMS Gateway | Mail Server | Authenticator App | 
| Ease of Use | Easy | Easy | Moderate | 
| Cost | SMS Charges | Low Cost | Free | 
| Reliability | Depends on Mobile Network | Depends on Email Service | Highly Reliable | 
Advantages of Two-Factor Authentication (2FA)
- Provides an additional layer of security.
- Protects accounts even if passwords are compromised.
- Reduces the risk of unauthorized access.
- Helps prevent phishing and credential theft attacks.
- Improves protection of sensitive data and resources.
- Enhances user trust and account security.
