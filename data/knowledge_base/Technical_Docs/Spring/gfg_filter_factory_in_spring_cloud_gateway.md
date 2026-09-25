# Filter Factory in Spring Cloud Gateway

> Source: https://www.geeksforgeeks.org/advance-java/filter-factory-in-spring-cloud-gateway

A Filter Factory in Spring Cloud Gateway is used to create reusable filters that intercept and modify HTTP requests and responses during routing. It helps implement cross-cutting concerns without changing the backend services.
- Applies common functionalities such as authentication, logging, rate limiting, and header manipulation.
- Supports both built-in and custom filter factories for flexible request and response processing.
- Can be configured globally or for specific routes using the gateway configuration.
Types of Filters in Spring Cloud Gateway
Spring Cloud Gateway provides two types of filters:
1. GatewayFilter Factory
A GatewayFilter is a route-specific filter in Spring Cloud Gateway that is applied only to a particular route. It is used when you want to perform request or response processing for a specific microservice.
- Applies only to selected routes.
- Used for route-specific tasks such as header manipulation, authentication, and path rewriting.
Example: This filter only applies to the employee route.
routes:
- id: employee-service
    uri: http://localhost:8081
    predicates:
      - Path=/employee/**
    filters:
      - AddRequestHeader=source,gateway
2. GlobalFilter
A GlobalFilter is a filter that executes for every request and response passing through the API Gateway. It is commonly used for cross-cutting concerns such as logging, authentication, monitoring, and tracing.
- Applies to all routes in the gateway.
- Used for common functionalities across all microservices.
Example: The LoggingFilter logs every request that enters the Spring Cloud Gateway.
@Component
public class LoggingFilter implements GlobalFilter {
    @Override
    public Mono<Void> filter(ServerWebExchange exchange,
                             GatewayFilterChain chain) {
        System.out.println(
            "Request URI: "
            + exchange.getRequest().getURI());
        return chain.filter(exchange);
    }
}
Some Common Built-in Gateway Filter Factories
| Filter Factory | Purpose | 
|---|---|
| AddRequestHeader | Adds request header | 
| AddResponseHeader | Adds response header | 
| AddRequestParameter | Adds query parameter | 
| PrefixPath | Adds path prefix | 
| StripPrefix | Removes path segments | 
| RewritePath | Rewrites request path | 
| RedirectTo | Redirects requests | 
| Retry | Retries failed requests | 
| CircuitBreaker | Implements fault tolerance | 
| RequestRateLimiter | Performs rate limiting | 
| RemoveRequestHeader | Removes request header | 
| RemoveResponseHeader | Removes response header | 
| SetPath | Changes request path | 
| SetStatus | Changes HTTP status | 
Sometimes built-in filters are not enough. Spring Cloud Gateway allows us to create our own Filter Factory.
Custom Gateway Filter Factory
A Custom Gateway Filter Factory allows developers to create their own filters when the built-in filters provided by Spring Cloud Gateway do not meet specific business requirements. It provides a reusable way to implement custom request and response processing logic.
- Used to implement custom business logic such as request validation, custom authentication, and logging.
- Can be configured and reused across multiple routes.
Steps to Create a Custom Gateway Filter Factory
Step 1: Create a Custom Filter Factory Class
Extend the AbstractGatewayFilterFactory class and implement the apply() method.
@Component
public class LoggingGatewayFilterFactory
        extends AbstractGatewayFilterFactory<
        LoggingGatewayFilterFactory.Config> {
    public LoggingGatewayFilterFactory() {
        super(Config.class);
    }
    @Override
    public GatewayFilter apply(Config config) {
        return (exchange, chain) -> {
            System.out.println(
                    "Request Received: "
                    + exchange.getRequest().getURI());
            return chain.filter(exchange)
                    .then(Mono.fromRunnable(() ->
                            System.out.println(
                                    "Response Sent")));
        };
    }
    public static class Config {
    }
}
Step 2: Register the Filter as a Spring Bean
Annotate the class with @Component.
@Component
public class LoggingGatewayFilterFactory
        extends AbstractGatewayFilterFactory<Config> {
}
Step 3: Configure the Filter in application.yml
Add the custom filter to the desired route.
spring:
  cloud:
    gateway:
      routes:
        - id: employee-service
          uri: http://localhost:8081
         predicates:
           - Path=/employee/
          filters:
            - Logging
Step 4: Run the Application
Start the Spring Cloud Gateway application using maven commands.
mvn spring-boot:run
Step 5: Test the Endpoint
Send a request through the gateway.
GET http://localhost:8080/employee/1
Console Output:
Request Received: /employee/1
Response Sent
GlobalFilter vs GatewayFilter
| Feature | GatewayFilter | GlobalFilter | 
|---|---|---|
| Scope | Specific route | Entire gateway | 
| Configuration | Route level | Global | 
| Reusability | Limited | High | 
| Performance | Better for route-specific logic | Better for common logic | 
| Use Cases | Route validation | Authentication, logging |
