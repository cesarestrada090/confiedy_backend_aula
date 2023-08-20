package com.confiedy.app;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
@ComponentScan
@Configuration
@EnableJpaRepositories
class ConfiedyAppConfig {
    @Bean
    public ModelMapper modelMapper() {
        return new ModelMapper();
    }

    @Bean
    public OpenAPI createOpenAPI(
            @Value("${springdoc.title}") String title,
            @Value("${springdoc.description}") String description,
            @Value("${springdoc.version}") String version,
            @Value("${springdoc.contact-name}") String contactName,
            @Value("${springdoc.contact-email}") String contactEmail,
            @Value("${springdoc.contact-url}") String contactUrl
    ) {
        var contact = new Contact();
        contact.setName(contactName);
        contact.email(contactEmail);
        contact.url(contactUrl);
        return new OpenAPI()
                .info(new Info()
                        .title(title)
                        .description(description)
                        .version(version)
                        .contact(contact));
    }
}