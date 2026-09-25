# Difference between JPA and Spring Data JPA

> Source: https://www.geeksforgeeks.org/advance-java/difference-between-jpa-and-spring-data-jpa

JPA defines standards for mapping Java objects to relational database tables and managing data persistence. Spring Data JPA builds on top of JPA to simplify data access by reducing boilerplate code.
- Provides repository abstraction to perform CRUD operations easily
- Adds an extra layer over JPA providers like Hibernate for simplified development
JPA
JPA allows developers to work with databases using object-oriented concepts instead of writing database-specific queries. It helps map Java classes (POJOs) to database tables using annotations like @Entity.
- Enables database-independent, object-oriented data handling
- Uses annotations (e.g., @Entity) to map Java classes to database tables
@Entity // Add Entity annotation to mark the class as an entity
public class EmployeeEntity {
    // Class definition
}
public class CustomJpaDaoIntegrationTest {
    // EntityManagerFactory and EntityManager for custom persistence unit
    private final EntityManagerFactory customEmf = Persistence.createEntityManagerFactory("custom-pu-test");
    private final EntityManager customEntityManager = customEmf.createEntityManager();
    // Setup method to delete all employees before each test
    @Before
    public void setup() {
        deleteAllEmployees();
    }
    // Method to delete all employees from the database
    private void deleteAllEmployees() {
        // Begin transaction
        customEntityManager.getTransaction().begin();
        // Execute native SQL query to delete all employees
        customEntityManager.createNativeQuery("DELETE from EmployeeEntity").executeUpdate();
        // Commit transaction
        customEntityManager.getTransaction().commit();
    }
    // Method to save an employee entity to the database
    public void save(EmployeeEntity entity) {
        // Begin transaction
        customEntityManager.getTransaction().begin();
        // Persist the entity
        customEntityManager.persist(entity);
        // Commit transaction
        customEntityManager.getTransaction().commit();
    }
    // Method to update an employee entity in the database
    public void update(EmployeeEntity entity) {
        // Begin transaction
        customEntityManager.getTransaction().begin();
        // Merge the entity
        customEntityManager.merge(entity);
        // Commit transaction
        customEntityManager.getTransaction().commit();
    }
    // Method to delete an employee from the database by employee ID
    public void delete(Long employeeId) {
        // Begin transaction
        customEntityManager.getTransaction().begin();
        // Find and remove the entity by ID
        customEntityManager.remove(customEntityManager.find(EmployeeEntity.class, employeeId));
        // Commit transaction
        customEntityManager.getTransaction().commit();
    }
    // Method to update entities using CriteriaUpdate and return the number of updated records
    public int update(CriteriaUpdate<EmployeeEntity> criteriaUpdate) {
        // Begin transaction
        customEntityManager.getTransaction().begin();
        // Execute the CriteriaUpdate query and get the result
        int result = customEntityManager.createQuery(criteriaUpdate).executeUpdate();
        // Commit transaction
        customEntityManager.getTransaction().commit();
        // Clear the entity manager
        customEntityManager.clear();
        // Return the number of updated records
        return result;
    }
}
Spring Data JPA
Spring Data JPA is part of the Spring Data family and acts as an abstraction layer over JPA, combining JPA’s power with Spring’s simplicity. It eliminates the need for boilerplate DAO code and makes data access easier.
- Reduces boilerplate code for DAO and repository layers
- Simplifies building Spring-based applications with database access
// Configuration class for custom Spring Data JPA settings
@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackageClasses = CustomRepository.class)
public class CustomSpringDataJpaConfig {
    // Bean definition for custom entity manager factory
    @Bean
    public LocalContainerEntityManagerFactoryBean customEntityManagerFactory(DataSource customDataSource) {
        // Creating entity manager factory bean
        LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        // Setting custom data source
        em.setDataSource(customDataSource);
        // Scanning packages for entity classes
        em.setPackagesToScan(EmployeeEntity.class.getPackage().getName());
        // Configuring JPA vendor adapter
        JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
        em.setJpaVendorAdapter(vendorAdapter);
        // Setting Hibernate properties
        Properties properties = new Properties();
        properties.setProperty("hibernate.hbm2ddl.auto", "create-drop");
        properties.setProperty("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
        em.setJpaProperties(properties);
        return em;
    }
    // Bean definition for custom transaction manager
    @Bean
    public PlatformTransactionManager customTransactionManager(LocalContainerEntityManagerFactoryBean customEntityManagerFactoryBean) {
        // Creating custom transaction manager
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(customEntityManagerFactoryBean.getObject());
        return transactionManager;
    }
    // Bean definition for custom data source
    @Bean
    public DataSource customDataSource() {
        return DataSourceBuilder.create()
          .driverClassName("org.h2.Driver")
          .username("customuser")
          .password("custompassword")
          .build();
    }
    // Bean definition for custom JPA query factory
    @Bean
    public JPAQueryFactory customJpaQueryFactory(EntityManager entityManager) {
        return new JPAQueryFactory(entityManager);
    }
}
JPA Vs Spring Data JPA
Below is the difference table of JPA and Spring Data JPA.
| JPA | Spring Data JPA | 
|---|---|
| It is a specification of Object Relational Mapper in Java. | Spring Data JPA is a simplified abstraction over JPA. | 
| It can also manage transactions and is built on top of JDBC, allowing us to continue using our native database language. | Spring Data JPA adds a layer of abstraction to the JPA and more adaptable than JPA and provides simple repositories. | 
| For query language, JPA is JPQL (Java Persistence Query Language) | For query language, Spring Data JPA is JPQL (Java Persistence Query Language) | 
| It provides a JPA caching implementation technique for enhancing processes. | Spring Data JPA also provides a JPA caching process. | 
| It is mainly depends on the JPA implementation. | Spring Data JPA also relies on JPA implementations. | 
| It can work with any JPA-compliant implementation | Spring Data JPA works with any JPA-compliant implementation because it is built on top of JPA | 
| It can be integrated with the Spring | Spring Data JPA is a core module of the Spring Data family and is fully integrated with it. |
