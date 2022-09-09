package com.testut.podcast.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.testut.podcast.models.Episode;

@Repository
public interface EpisodeRepository extends CrudRepository<Episode,Long>{
	List<Episode> findAll();
}
