package com.testut.podcast.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.testut.podcast.models.Podcast;
import com.testut.podcast.models.User;
import com.testut.podcast.services.EpisodeService;
import com.testut.podcast.services.PodcastService;
import com.testut.podcast.services.UserService;

@Controller
public class PodcastController {
	@Autowired
	private UserService userServ;
	
	@Autowired
	private PodcastService podcastServ;
	
	@Autowired
	private EpisodeService episodeServ;
	
	
	@GetMapping("/podcasts/new")
	public String newPodcast(HttpSession session,@ModelAttribute("newPodcast")Podcast newPodcast, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		User user = userServ.findById((Long)session.getAttribute("userId"));
    	model.addAttribute("user", user);
    	return "addPodcast.jsp";
	}
	
	@PostMapping("/podcasts/new")
	public String createPodcast(@Valid @ModelAttribute("newPodcast")Podcast newPodcast, BindingResult result,Model model, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			return "addPodcast.jsp";
		}
		else {
			podcastServ.createPodcast(newPodcast);
			return "redirect:/home";
		}
	}
	
	@GetMapping("/podcasts/{id}")
	public String viewPodcast(Model model, @PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("podcast", podcastServ.findPodcast(id));
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.findById(userId));
		return "viewPodcast.jsp";
	}
	
	@DeleteMapping("/podcasts/delete/{id}")
	public String delete(@PathVariable("id") Long id, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		podcastServ.deletePodcast(id);
		return "redirect:/home";
	}
	
	@GetMapping("/podcasts/{id}/edit")
	public String editPodcast(Model model, @PathVariable("id") Long id,@ModelAttribute("updatedPodcast") Podcast updatedPodcast, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("podcast", podcastServ.findPodcast(id));
		model.addAttribute("originalPodcast",podcastServ.findPodcast(id));
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.findById(userId));
		return "editPodcast.jsp";
	}
	
	@PutMapping("/podcasts/{id}/edit")
	public String updatePodcast(Model model, @PathVariable("id") Long id, @Valid @ModelAttribute("updatedPodcast") Podcast updatedPodcast, BindingResult result, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			model.addAttribute("podcast", podcastServ.findPodcast(id));
			model.addAttribute("originalPodcast", podcastServ.findPodcast(id));
			return "editPodcast.jsp";
		}
		podcastServ.updatePodcast(updatedPodcast);
		return "redirect:/podcasts/{id}";
	}
}
