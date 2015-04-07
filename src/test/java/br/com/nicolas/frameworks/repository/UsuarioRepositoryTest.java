package br.com.nicolas.frameworks.repository;

import java.util.List;

import javax.inject.Inject;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import br.com.nicolas.frameworks.config.AppConfig;
import br.com.nicolas.frameworks.domain.Usuario;


@ContextConfiguration(classes={AppConfig.class})
@Transactional
@TransactionConfiguration(defaultRollback=true)
@RunWith(SpringJUnit4ClassRunner.class)
public class UsuarioRepositoryTest {
	
	@Inject
	private UsuarioRepository userRepo;
    
    @Test
    public void testFindAll() {
        List<Usuario> users = userRepo.findAll();
        Assert.assertEquals(3, users.size());
    }
}
