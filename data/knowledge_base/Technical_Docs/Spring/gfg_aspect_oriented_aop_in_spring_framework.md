# Aspect Oriented Programming (AOP) in Spring Framework

> Source: https://www.geeksforgeeks.org/advance-java/aspect-oriented-programming-aop-in-spring-framework/

Aspect-Oriented Programming (AOP) in Spring is a programming paradigm used to separate cross-cutting concerns like logging, security, and transaction management from business logic. It improves modularity by allowing these concerns to be applied across multiple parts of an application without code duplication.
- Spring AOP is implemented using proxies and integrates seamlessly with the Spring IoC container.
- Uses concepts like Aspect, Advice, Join Point, and Pointcut to define behavior.
- Implemented using proxy-based approach (JDK dynamic proxies or CGLIB).
Real-World Example of AOP: In a banking application, logging is applied to methods like deposit or transfer without modifying their code, using AOP to automatically log actions before and after execution.
Understanding AOP Concepts
1. Aspect
An Aspect is a modular unit of cross-cutting concerns. For example, a logging aspect can be applied across various methods in different classes.
2. Advice
This is the action taken by an aspect at a particular join point. There are five types of advice:
- Before: Executed before the method call.
- After: Executed after the method call, regardless of its outcome.
- AfterReturning: Executed after the method returns a result, but not if an exception occurs.
- Around: Surrounds the method execution, allowing you to control the method execution and its result.
- AfterThrowing: Executed if the method throws an exception.
3. Join Point
A specific point in the execution of a program, such as method execution or exception handling, where an aspect can be applied.
4. Pointcut
A Pointcut is a predicate that defines where advice should be applied. It matches join points using expressions.
5. Weaving
This is the process of linking aspects with the target object. Spring AOP only supports runtime weaving using proxy-based mechanisms (JDK dynamic proxies for interfaces and CGLIB for concrete classes). It does not modify bytecode like AspectJ.
Dominant AOP Frameworks
These are the primary frameworks used to implement Aspect-Oriented Programming in Java, providing tools and mechanisms to modularize cross-cutting concerns through techniques like proxy-based or bytecode weaving.
- AspectJ: A powerful and mature AOP framework that supports compile-time and load-time weaving. It offers full AOP support with its own syntax and tools.
- JBoss AOP: Part of the JBoss application server, offering integration with Java EE applications.
- Spring AOP: A simpler, proxy-based framework that integrates with the Spring Framework, using XML configurations or annotations to define aspects and pointcuts.
Example
Implementing Logging with AOP in Spring Aspect Class with Different Types of Advice
package com.example.aspect;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
@Aspect
@Component
public class LoggingAspect {
    @Pointcut("execution(public void com.example.service.*.*(..))")
    public void allServiceMethods() {}
    @Before("allServiceMethods()")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("Before method: " + joinPoint.getSignature().getName());
    }
    @After("allServiceMethods()")
    public void logAfter(JoinPoint joinPoint) {
        System.out.println("After method: " + joinPoint.getSignature().getName());
    }
    @AfterReturning(pointcut = "allServiceMethods()", returning = "result")
    public void logAfterReturning(JoinPoint joinPoint, Object result) {
        System.out.println("Method returned: " + result);
    }
    @AfterThrowing(pointcut = "allServiceMethods()", throwing = "error")
    public void logAfterThrowing(JoinPoint joinPoint, Throwable error) {
        System.out.println("Method threw exception: " + error);
    }
    @Around("allServiceMethods()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println("Before and after method: " + joinPoint.getSignature().getName());
        return joinPoint.proceed();
    }
}
Enabling AOP in Spring
Java-Based Configuration: To enable AOP in Spring, you need to configure your Spring application context appropriately.
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
@Configuration
@EnableAspectJAutoProxy
public class AopConfig {
}
XML Configuration
<beans xmlns="http://www.springframework.org/schema/beans//"
       xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
       xmlns:aop="http://www.springframework.org/schema/aop//"
       xsi:schemaLocation="http://www.springframework.org/schema/beans//
           http://www.springframework.org/schema/beans///spring-beans.xsd
           http://www.springframework.org/schema/aop//
           http://www.springframework.org/schema/aop///spring-aop.xsd">
    <aop:aspectj-autoproxy/>
    
    <bean id="loggingAspect" class="com.example.aspect.LoggingAspect"/>
</beans>
Difference between Spring AOP and Spring IOC
| Parameter | Spring AOP | Spring IOC | 
|---|---|---|
| Full form | Spring Aspect-Oriented Programming | Spring Inversion of Control | 
| Main Concept | Handling cross-cutting concerns | Dependency injection and object lifecycle management. | 
| Purpose | Logging, transaction management and security. | Managing object creation and injecting dependencies | 
| Design Pattern | Proxy Pattern | Factory and Singleton pattern | 
| Implementation | Using pointcuts, join points and advices. | Using BeanFactory or ApplicationContext. | 
| Effects on code | Adds behavior without modifying actual code | Wires and manages object dependencies. | 
| Configure | Annotation like @Aspact or via AOP namespace. | Java-based configurations or we can Configured XML file. |
