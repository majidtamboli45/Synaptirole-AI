# Load Balancing Algorithms

> Source: https://www.geeksforgeeks.org/system-design/load-balancing-algorithms

A load balancer distributes incoming traffic across multiple servers to ensure high availability and efficient resource usage. It helps maintain system reliability by preventing overload on any single server.
- Uses load-balancing algorithms to manage and distribute traffic evenly across servers.
- Ensures no single server is overwhelmed, improving performance and user experience.
Example: In a web application like an e-commerce site, a load balancer can distribute incoming user requests across multiple servers so that no single server becomes slow or crashes during peak traffic.
Types of Load Balancing Algorithm
Load balancing algorithms can be broadly categorized into two types: Dynamic load balancing and Static load balancing.
1. Static Load Balancing Algorithms
Static load balancing assigns tasks to servers using predefined rules, without considering real-time system conditions.
- Workloads are allocated in a fixed and predetermined manner.
- Does not adapt to changes during runtime.
Types
These algorithms distribute requests using fixed rules without considering real-time server conditions.
1. Round Robin Load Balancing Algorithm: Round Robin is a simple static load balancing technique that distributes incoming requests to servers in a fixed sequential or rotational order. It is commonly used due to its ease of implementation.
- Requests are assigned to servers one by one in a circular manner.
- Does not consider current server load, which may cause some servers to become overloaded.
- Pros: Simple to implement and requires minimal configuration.
- Cons: Ignores server load, which can lead to uneven distribution under heavy traffic.
2. Weighted Round Robin Load Balancing Algorithm: Weighted Round Robin is a static load balancing technique similar to Round Robin, but it distributes requests based on assigned weight values that represent each server’s capacity.
- Servers with higher weights receive a larger share of requests.
- Requests are distributed in a cyclic manner, proportional to each server’s weight.
- Pros: Distributes traffic according to server capacity, preventing weaker servers from overload.
- Cons: Still static; cannot adapt to sudden runtime load changes.
3. Source IP Hash Load Balancing Algorithm: The Source IP Hash Load Balancing Algorithm distributes incoming requests by computing a hash of the client’s source IP address. This approach helps route requests from the same client to the same backend server consistently.
- Uses the source IP address to calculate a hash and select a server.
- Ensures request consistency by mapping the same IP to the same server.
- Pros: Ensures session persistence by directing the same client to the same server.
- Cons: Can create uneven load if some IPs generate more traffic than others.
2. Dynamic Load Balancing Algorithms
Dynamic load balancing makes real-time decisions to distribute incoming traffic or workloads across multiple servers based on current system conditions. It continuously adapts to changes such as server load, network traffic, and resource availability.
- Adjusts request distribution dynamically to prevent server overload.
- Improves performance and reliability by responding to real-time system changes.
Types
These algorithms distribute requests based on real-time server performance and system conditions.
1. Least Connection Method Load Balancing Algorithm: The Least Connections algorithm is a dynamic load balancing technique that routes new requests to the server with the fewest active connections. It focuses on balancing workload by considering the current load on each server.
- Requires additional computation to track and identify the server with the least connections.
- More resource-intensive than round-robin due to real-time load evaluation.
- Pros: Balances load effectively by directing traffic to the least busy server.
- Cons: Requires continuous monitoring, increasing computational overhead.
2. Least Response Time Method Load Balancing Algorithm: The Least Response method is a dynamic load balancing approach that aims to minimize response times by directing new requests to the server with the quickest response time.
- Uses historical server performance data to determine the best destination for incoming requests.
- Continuously adapts routing decisions based on monitored response times to achieve faster processing.
- Pros: Reduces latency by sending requests to the fastest-responding server.
- Cons: Needs historical data and monitoring, adding complexity.
3. Resource-based Load Balancing Algorithm: Resource-Based Load Balancing assigns incoming requests to servers based on their current resource availability, such as CPU usage, memory, or bandwidth, ensuring efficient and balanced system performance.
- Routes requests to the server with the most available resources at that moment.
- Prevents server overload by continuously monitoring resource usage.
- Pros: Optimizes resource utilization by considering CPU, memory, and bandwidth in real time.
- Cons: More complex to implement and may require frequent resource checks.
Importance
Load balancing plays a crucial role in maintaining the performance and reliability of distributed systems. It ensures efficient resource utilization while handling increasing user traffic smoothly.
- Prevents any single server from becoming a performance bottleneck.
- Improves application availability and fault tolerance.
- Enhances scalability during high traffic.
- Ensures better user experience with reduced latency.
Static Vs Dynamic Load Balancing
| Static Load Balancing | Dynamic Load Balancing | 
|---|---|
| Uses predefined rules to distribute requests | Makes decisions based on real-time system conditions | 
| Does not adapt during runtime | Continuously adapts to changing server load | 
| Does not consider current server status | Considers CPU usage, memory, or response time | 
| Simple and easy to implement | More complex due to monitoring overhead | 
| Suitable for predictable and stable workloads | Suitable for fluctuating and unpredictable workloads | 
| Example: Round Robin, Weighted Round Robin | Example: Least Connections, Resource-Based | 
Factors Affecting Load Balancing Algorithm Selection
Selecting an appropriate load balancing algorithm depends on several system and application requirements. These factors help determine how efficiently traffic is distributed.
- Traffic pattern
- Server capacity and heterogeneity
- Network latency
- Fault tolerance requirements
- Cost and complexity
Use Cases
Load balancing is widely used in real-world applications to ensure smooth performance, even under high traffic:
- E-commerce websites during sales: High user traffic during flash sales or promotions can overload servers. Load balancers distribute requests evenly to maintain fast response times.
- Video streaming platforms: Streaming services like Netflix or YouTube rely on load balancing to serve millions of concurrent users without buffering.
- Large SaaS applications: Enterprise applications with multiple clients use load balancers to maintain uptime and ensure all users have a seamless experience.
Selecting the Appropriate Load Balancing Algorithm for Your System
Choosing the right algorithm depends on your application requirements, traffic patterns, and server capabilities:
1. Start Simple
A simple algorithm that distributes requests evenly across all servers.
- Use Round Robin for small or medium applications where all servers have similar capacity.
- Easy to implement and works well when workloads are predictable.
2. When to Use Weighted Round Robin
Distributes traffic based on server capacity to prevent overload.
- Use Weighted Round Robin to send more traffic to powerful servers and less to weaker ones.
- Ensures servers aren’t overloaded and traffic is distributed according to capacity.
3. When Session Persistence Matters
Keeps users connected to the same server for consistent sessions.
- Use Source IP Hash to ensure the same client always reaches the same server.
- Useful for applications where user sessions or carts must remain consistent(e-commerce).
4. Dynamic Algorithms for High Traffic / Unpredictable Loads
Adapts to real-time server conditions for performance and reliability.
- Least Connections: Good for applications with highly variable traffic where some requests are long-running.
- Least Response Time: Ideal when minimizing latency is critical.
- Resource-Based: Best for cloud or containerized environments where CPU, memory, or bandwidth fluctuate frequently.
Tip: Start with a simple static algorithm and move to dynamic algorithms as traffic patterns or application complexity increase.
