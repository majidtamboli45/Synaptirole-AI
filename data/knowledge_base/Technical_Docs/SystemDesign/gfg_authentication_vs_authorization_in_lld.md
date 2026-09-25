# Authentication vs Authorization in LLD

> Source: https://www.geeksforgeeks.org/system-design/difference-between-authentication-and-authorization-in-lld-system-design

Two fundamental ideas in system design, particularly in low-level design (LLD), are authentication and authorization.
- Authentication confirms a person's identity.
- Authorization establishes what resources or actions a user is permitted to access.
Authentication Methods
- Password-based Authentication
  - Description: The most common form of authentication, in this users provide a unique password to verify their identity.
  - Considerations: Passwords should be complex, stored securely, and users should be encouraged to use unique passwords.
- Multi-Factor Authentication (MFA)
  - Description: Requires users to provide multiple forms of identification, such as a password and a temporary code is sent to their mobile device.
  - Advantages: Enhances security by adding an extra layer of verification, even if one factor is compromised.
- Biometric Authentication
  - Description: Involves using unique physical or behavioral characteristics for identification, like fingerprints, facial recognition, or voice recognition.
  - Considerations: Biometric data should be securely stored and processed to prevent unauthorized access.
- Token-based Authentication
  - Description: Users are given a physical or digital token (like a security key or smart card) for authentication.
  - Advantages: Provides an additional physical element that needs to be present for authentication.
- OAuth Connect
  - Description: Protocols used for authentication and authorization in the context of web applications and APIs.
  - Use Cases: Commonly used for delegated authorization, allowing third-party applications to access user data.
Authorization Models
Ensuring that only authorized individuals or entities have access to particular resources, functionality, or information is an essential component of security.
- Role-Based Access Control (RBAC):
  - Assigning roles to users or groups, letting them access only what their role requires.
  - Example: HR personnel can access HR data but not finance information.
- Security Assertion Markup Language (SAML):
  - Using an XML-based protocol for Single Sign-On, allowing admins to control resource access.
  - Example: Access permissions are communicated through digitally signed documents.
- OpenID Authorization:
  - Checking a user's identity through OpenID standards, ensuring consistency across systems.
  - Example: Standardised authorization based on authentication from an authorization server.
- OAuth Authorization:
  - It allows secure access within applications using permission tokens.
  - Example: Users grant access to their information to certain apps without sharing their password.
- Device Permissions:
  - Granting access based on the device trying to connect to a resource.
  - Example: Only approved devices can establish a connection.
Differences between Authentication and Authorization
| Aspect | Authentication | Authorization | 
|---|---|---|
| Definition | Verifies the user's identity. | Determines the user's access to resources or actions. | 
| Focus | "Who are you?" | "What are you allowed to do?" | 
| Process | Typically involves usernames, passwords, or biometrics. | Involves checking permissions or roles assigned to the user. | 
| Order | Happens before Authorization. | Happens after Authentication. | 
| Scope | Ensures the user is genuine. | Ensures the user has access rights. | 
| Implementation | Login pages, OTP, fingerprint scans. | Role-based access control (RBAC), policy checks. | 
| Example | Entering a password to log into an account. | Checking if the logged-in user can view or edit a file. | 
| Security Purpose | Protects against unauthorized user access. | Protects against unauthorized actions by authenticated users. |
