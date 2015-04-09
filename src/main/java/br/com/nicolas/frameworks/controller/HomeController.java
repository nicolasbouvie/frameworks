
package br.com.nicolas.frameworks.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.nicolas.frameworks.domain.Usuario;
import br.com.nicolas.frameworks.domain.Venda;
import br.com.nicolas.frameworks.repository.VendaRepository;

@Controller
@RequestMapping("/")
public class HomeController {
	@Inject
	private VendaRepository vendaRepo;
	
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {
		ModelAndView model = new ModelAndView();
		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
			Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (user instanceof Usuario) {
				Usuario usuario = (Usuario) user;
				boolean admin = false;
				for (GrantedAuthority grupo : usuario.getAuthorities()) {
					if (StringUtils.equals(grupo.getAuthority(), "admin")
							|| StringUtils.equals(grupo.getAuthority(), "operacional")
							|| StringUtils.equals(grupo.getAuthority(), "financeiro")) {
						admin = true;
						break;
					}
				}
				model.addObject("user", user);
				Collection<Venda> vendas = admin ? vendaRepo.findAll() : vendaRepo.findByUsuario(usuario);
				Map<Usuario, Collection<Venda>> vendasUsuario = new HashMap<>();
				for (Venda venda : vendas) {
					if (!vendasUsuario.containsKey(venda.getUsuario())) {
						vendasUsuario.put(venda.getUsuario(), new ArrayList<Venda>());
					}
					vendasUsuario.get(venda.getUsuario()).add(venda);
				}
				model.addObject("users", vendasUsuario);
			}
		}
		model.setViewName("index");
		return model;
	}

	@PreAuthorize("hasRole('operacional')")
	@RequestMapping(value = "/venda/updateDataVenda/{id}", method = RequestMethod.POST)
	public String updateDataVenda(@PathVariable Long id) {
		Venda venda = vendaRepo.findOne(id);
		venda.setDataVenda(new Date());
		vendaRepo.save(venda);

		return "redirect:/venda";
	}

	@PreAuthorize("hasRole('financeiro')")
	@RequestMapping(value = "/venda/updateDataPagamento/{id}", method = RequestMethod.POST)
	public String updateDataPagamento(@PathVariable Long id) {
		Venda venda = vendaRepo.findOne(id);
		venda.setDataPagamento(new Date());
		vendaRepo.save(venda);

		return "redirect:/venda";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/welcome";
	}
 }
