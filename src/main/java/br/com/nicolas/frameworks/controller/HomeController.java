
package br.com.nicolas.frameworks.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.nicolas.frameworks.domain.Usuario;

@Controller
@RequestMapping("/")
public class HomeController {
	@RequestMapping(value = { "/", "/welcome**" }, method = RequestMethod.GET)
	public ModelAndView welcomePage() {
		ModelAndView model = new ModelAndView();
		if (SecurityContextHolder.getContext().getAuthentication().isAuthenticated()) {
			Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if (user instanceof Usuario) {
				model.addObject("user", user);
			}
		}
		model.setViewName("index");
		return model;
	}

	@PreAuthorize("!hasRole('ROLE_ANONYMOUS')")
	@RequestMapping(value = "/venda", method = RequestMethod.GET)
	public ModelAndView vendaIndex() {
		ModelAndView model = new ModelAndView();
		model.setViewName("venda");
 
		return model;
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
