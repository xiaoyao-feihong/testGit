### SpringBoot

<hr>



#### 1、SpringBoot注解

##### 1.1 @SpringBootApplication

作用：@SpringBootApplication = @Configuration + @EnableAutoConfiguration + @ComponentScan

相当于spring注解开发：

```java
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class MainConfig {
	@Bean
	public demo () {return new Person();}
}

class ApplicationBootstrap {
	public static void main (String[] args){
	SpringApplication.run(MainConfig.class,args);
}
}

```



##### 1.2 @EnableAutoConfiguration

作用：将所有符合条件的**@Configuration**配置都加载到SpringBoot的IOC容器，借助**SpringFactoriesLoader**的支持，就可以智能的自动配置。

源码：

```java
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
@AutoConfigurationPackage
@Import({AutoConfigurationImportSelector.class})
public @interface EnableAutoConfiguration {
    String ENABLED_OVERRIDE_PROPERTY = "spring.boot.enableautoconfiguration";

    Class<?>[] exclude() default {};

    String[] excludeName() default {};
}
```



###### SpringFactoriesLoader详解

从配置文件META-INF/spring.factories（properties文件），从classpath中搜寻配置文件，并通过反射将@Configuration注解的类加载到IOC容器中

spring.factories：

```properties
org.springframework.boot.autoconfigure.EnableAutoConfiguration=org.springframework.boot.autoconfigure.admin.SpringApplicationAdminJmxAutoConfiguration,org.springframework...
```



##### 1.3 @ComponentScan

作用：指定需要扫描的包，排除的类等，用于扫包加载我们需要注册的bean对象

一般我们手工注册就行了，并不需要批量自动扫描完成，根据需要使用就好

```java
@ComponentScan(
        value = {"condition", "controller", "service","aop"},

        //指定扫描包下的哪些类不扫描
       /*
       *ANNOTATION:按照class方式排除
   		* REGEX:正则
  		* ASPECTJ:按照aspectj表达式
		* CUSTOM:自定义规则
     */    	
        excludeFilters = {
                 @Filter(type = FilterType.ASSIGNABLE_TYPE, classes = {})
        },
        //要包含的类
        includeFilters = {
             @Filter(type = FilterType.ASSIGNABLE_TYPE, classes = {})
        },
        /* useDefaultFilters，如果设置为false，只扫描includeFilters中添加的类
        *  @Service、@Component、@Controller这些注解就不会扫描了
        * */
        useDefaultFilters = true)
```



#### 2、SpringApplication

##### 2.1 SpringApplication执行流程

