package br.com.nicolas.frameworks.controller;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.com.nicolas.frameworks.domain.Grupo;
import br.com.nicolas.frameworks.domain.Usuario;
import br.com.nicolas.frameworks.repository.ConfiguracaoRepository;
import br.com.nicolas.frameworks.repository.GrupoRepository;
import br.com.nicolas.frameworks.repository.UsuarioRepository;
import br.com.nicolas.frameworks.repository.VendaRepository;

@Controller
@PreAuthorize("hasRole('admin')")
public class AdminController {
	@Inject
	private UsuarioRepository usuarioRepo;

	@Inject
	private GrupoRepository grupoRepo;

	@Inject
	private ConfiguracaoRepository configuracaoRepo;

	@Inject
	private VendaRepository vendaRepo;

	@RequestMapping(value = "/admin/usuario", method = RequestMethod.GET)
	public ModelAndView usuarioIndex() {
		ModelAndView model = new ModelAndView();
		model.addObject("users", usuarioRepo.findAll());
		model.setViewName("admin/usuario");

		return model;
	}

	@RequestMapping(value = "/admin/grupo", method = RequestMethod.GET)
	public ModelAndView grupoIndex() {
		ModelAndView model = new ModelAndView();
		model.addObject("grupos", grupoRepo.findAll());
		model.setViewName("admin/grupo");

		return model;
	}
	
	@RequestMapping(value = "/admin/configuracao", method = RequestMethod.GET)
	public ModelAndView configuracaoIndex() {
		ModelAndView model = new ModelAndView();
		model.addObject("configs", configuracaoRepo.findAll());
		model.setViewName("admin/configuracao");

		return model;
	}
	
	@PreAuthorize("!hasRole('ROLE_ANONYMOUS')")
	@RequestMapping(value = "/venda", method = RequestMethod.GET)
	public ModelAndView vendaIndex() {
		ModelAndView model = new ModelAndView();
		Usuario user = (Usuario) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean admin = false;
		for (GrantedAuthority grupo : user.getAuthorities()) {
			if (StringUtils.equals(grupo.getAuthority(), "admin")
				|| StringUtils.equals(grupo.getAuthority(), "operacional")
				|| StringUtils.equals(grupo.getAuthority(), "financeiro")) {
				admin = true;
				model.addObject("vendas", vendaRepo.findAll());
				model.addObject("usuarios", usuarioRepo.findAll());
				break;
			}
		}
		if (!admin) {
			model.addObject("vendas", vendaRepo.findByUsuario(user));
		}
		model.addObject("configs", configuracaoRepo.findAll());
		model.setViewName("admin/venda");
		
		return model;
	}

	@RequestMapping(value = "/admin/{entity}/remover/{id}", method = RequestMethod.POST)
	public String delete(@PathVariable String entity, @PathVariable Long id) {
		JpaRepository<?, Long> repo;
		switch(entity) {
			case "usuario": repo = usuarioRepo; break;
			case "grupo": repo = grupoRepo; break;
			case "configuracao": repo = configuracaoRepo; break;
			case "venda": repo = vendaRepo; break;
			default: throw new IllegalArgumentException("Entidade invalida");
		}
		repo.delete(id);
		return "redirect:/admin/"+entity;
	}
	
	@RequestMapping(value = "/admin/usuario/save", method = RequestMethod.POST)
	public ModelAndView saveUser(@RequestParam long id, 
								 @RequestParam String name,
								 @RequestParam String password) {
		ModelAndView model = new ModelAndView();
		Usuario user;
		if (id != 0) {
			user = usuarioRepo.findOne(id);
		} else { 
			user = new Usuario();
		}
		user.setUsername(name);
		user.setPassword(password);
		usuarioRepo.save(user);

		model.addObject("user", user);
		model.setViewName("user/edit");

		return model;
	}
	
	@RequestMapping(value = "/admin/grupo/save", method = RequestMethod.POST)
	public String saveGrupo(@RequestParam long id, @RequestParam String nome) {
		Grupo grupo;
		if (id == 0) {
			grupo = new Grupo();
		} else {
			grupo = grupoRepo.findOne(id);
		}
		grupo.setAuthority(nome);
		grupoRepo.save(grupo);
		return "redirect:/admin/grupo";
	}
}
