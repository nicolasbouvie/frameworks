package br.com.nicolas.frameworks.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@Configuration
@EnableJpaRepositories(basePackages="br.com.nicolas.frameworks.repository")
public class RepositoryConfig {

}
