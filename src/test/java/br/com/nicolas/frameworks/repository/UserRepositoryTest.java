package br.com.nicolas.frameworks.repository;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import br.com.nicolas.frameworks.config.AppConfig;
import br.com.nicolas.frameworks.domain.User;


@ContextConfiguration(classes={AppConfig.class})
@Transactional
@TransactionConfiguration(defaultRollback=true)
@RunWith(SpringJUnit4ClassRunner.class)
public class UserRepositoryTest {
	
	@Autowired 
	private UserRepository userRepo;
    
    @Test
    public void testFindAll() {
        List<User> users = userRepo.findAll();
        Assert.assertEquals(3, users.size());
    }
}
