package com.testut.podcast.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.testut.podcast.models.Podcast;

@Repository
public interface PodcastRepository extends CrudRepository<Podcast,Long> {
	List<Podcast> findAll();
}
