package br.com.nicolas.frameworks.config;

import javax.sql.DataSource;

import org.apache.commons.lang3.StringUtils;
import org.postgresql.ds.PGPoolingDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;

@Configuration
public class DataSourceConfig {
	@Bean(name="dataSource")
	public DataSource getDataSource() {
		String host = System.getProperty("OPENSHIFT_POSTGRESQL_DB_HOST");
		String port = System.getProperty("OPENSHIFT_POSTGRESQL_DB_PORT");

		if (StringUtils.isNotBlank(host) && StringUtils.isNoneBlank(port)) {
			PGPoolingDataSource ds = new PGPoolingDataSource();
			ds.setDataSourceName("FrameworksDS");
			ds.setServerName(host);
			ds.setDatabaseName("frameworks");
			ds.setPortNumber(Integer.parseInt(port));
			ds.setUser(System.getProperty("OPENSHIFT_POSTGRESQL_DB_USERNAME"));
			ds.setPassword(System.getProperty("OPENSHIFT_POSTGRESQL_DB_PASSWORD"));
			ds.setMaxConnections(10);
			return ds;
		}
		return new EmbeddedDatabaseBuilder()
					.addDefaultScripts()
					.build();
	}
}
