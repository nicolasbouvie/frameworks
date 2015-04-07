package br.com.nicolas.frameworks.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

@Configuration
public class TilesConfig {
	@Bean
	public TilesViewResolver getTilesViewResolver() {
		TilesViewResolver resolver = new TilesViewResolver();
		resolver.setOrder(0);
		resolver.setViewClass(TilesView.class);
		return resolver;
	}

	@Bean
	public TilesConfigurer tilesConfigurer() {
		TilesConfigurer config = new TilesConfigurer();
		config.setDefinitions("/WEB-INF/tiles.xml");
		return config;
	}
}
