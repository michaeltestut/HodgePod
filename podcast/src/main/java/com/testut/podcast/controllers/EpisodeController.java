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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.testut.podcast.models.Episode;
import com.testut.podcast.services.AmazonClient;
import com.testut.podcast.services.EpisodeService;
import com.testut.podcast.services.PodcastService;
import com.testut.podcast.services.UserService;

@Controller
public class EpisodeController {
	
	@Autowired
	private PodcastService podcastServ;
	
	@Autowired
	private EpisodeService episodeServ;
	
	@Autowired
	private UserService userServ;
	
	@Autowired
	private AmazonClient amazonClient;

	@GetMapping("/podcasts/{id}/episodes/add")
	public String addEpisode(HttpSession session,@PathVariable("id") Long id,@ModelAttribute("newEpisode") Episode newEpisode, Model model ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("podcast", podcastServ.findPodcast(id));
		return "addEpisode.jsp";
	}
	
	@PostMapping("/podcasts/{podcast_id}/episodes/add")
	public String createEpisode(@Valid @ModelAttribute("newEpisode") Episode newEpisode, BindingResult result, Model model, HttpSession session,@PathVariable("podcast_id") Long podcast_id,@RequestPart(value = "file") MultipartFile file) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			model.addAttribute("podcast", podcastServ.findPodcast(podcast_id));
			return "addEpisode.jsp";
		}
		model.addAttribute("podcast", podcastServ.findPodcast(podcast_id));
		String url=this.amazonClient.uploadFile(file);
		newEpisode.setEpisodeURL(url);
		episodeServ.createEpisode(newEpisode);
		return "redirect:/podcasts/{podcast_id}";
	}
	
	@GetMapping("/podcasts/{podcast_id}/episodes/{episode_id}")
	public String viewEpisode(HttpSession session,@PathVariable("podcast_id") Long podcast_id, @PathVariable("episode_id")Long episode_id, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.findById(userId));
		model.addAttribute("podcast", podcastServ.findPodcast(podcast_id));
		model.addAttribute("episode", episodeServ.findEpisode(episode_id));
		return("viewEpisode.jsp");
	}
	
	@GetMapping("/podcasts/{podcast_id}/episodes/{episode_id}/edit")
	public String editEpisode(HttpSession session,@ModelAttribute("updatedEpisode") Episode updatedEpisode, @PathVariable("podcast_id") Long podcast_id, @PathVariable("episode_id")Long episode_id, Model model) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		model.addAttribute("podcast", podcastServ.findPodcast(podcast_id));
		model.addAttribute("episode", episodeServ.findEpisode(episode_id));
		model.addAttribute("originalEpisode", episodeServ.findEpisode(episode_id));
		return "editEpisode.jsp";
	}
	
	@PutMapping("/podcasts/{podcast_id}/episodes/{id}/edit")
	public String updateEpisode(@PathVariable("id")Long id,@PathVariable("podcast_id")Long podcast_id,@Valid @ModelAttribute("updatedEpisode") Episode updatedEpisode,BindingResult result,Model model,HttpSession session  ) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		if(result.hasErrors()) {
			model.addAttribute("episode", episodeServ.findEpisode(id));
			model.addAttribute("originalEpisode", episodeServ.findEpisode(id));
			return "editEpisode.jsp";
		}
		episodeServ.updateEpisode(updatedEpisode);
		return "redirect:/podcasts/{podcast_id}";
	}
	
	@DeleteMapping("/podcasts/{podcast_id}/episodes/{id}/delete")
	public String delete(@PathVariable("id") Long id, @PathVariable("podcast_id")Long podcast_id, HttpSession session) {
		if (session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		episodeServ.deleteEpisode(id);
		return "redirect:/podcasts/{podcast_id}";
	}
	
}
