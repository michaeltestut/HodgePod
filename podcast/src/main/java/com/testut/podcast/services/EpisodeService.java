package com.testut.podcast.services;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.testut.podcast.models.Episode;
import com.testut.podcast.repositories.EpisodeRepository;

@Service
public class EpisodeService {
	
	@Autowired
	private EpisodeRepository episodeRepo;
	
	
	public Episode createEpisode(Episode episode) {
		return episodeRepo.save(episode);
	}
	
	public List<Episode> allEpisodes(){
		return episodeRepo.findAll();
	}
	
	public Episode findEpisode(Long id) {
		Optional<Episode> optionalEpisode = episodeRepo.findById(id);
		if(optionalEpisode.isPresent()) {
			return optionalEpisode.get();
		}
		else {
			return null;
		}
	}
	
	public Episode updateEpisode(Episode episode) {
		return episodeRepo.save(episode);
	}
	
	public void deleteEpisode(Long id) {
		Optional<Episode> optionalEpisode=episodeRepo.findById(id);
		if(optionalEpisode.isPresent()) {
			episodeRepo.deleteById(id);
		}
	}
}
