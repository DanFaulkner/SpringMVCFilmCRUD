package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.skilldistillery.film.data.FilmDAO;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO dao;

	@GetMapping({ "/", "/index" })
	public String index(Model model) {
		model.addAttribute("message", "I'm ALIVE!");
		return "home";
	}

}
