package br.com.nicolas.frameworks.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;

@Configuration
public class DataSourceConfig {
    
    @Bean
    public DataSource dataSource() {
    	return new EmbeddedDatabaseBuilder()
    	.addDefaultScripts()
    	.build();
    }
}
