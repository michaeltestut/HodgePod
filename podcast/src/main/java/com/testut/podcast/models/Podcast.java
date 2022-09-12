package com.testut.podcast.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

@Entity
@Table(name="podcasts")
public class Podcast {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="*Podcast Name is Required")
	private String podcastName;
	
	@NotEmpty(message="*Host is Required")
	private String podcastHost;
	
	@NotEmpty(message="*Genre is Required")
	private String genre;
	
	@NotEmpty(message="*Description is Required")
	private String podcastDescription;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User creator;

	@OneToMany(mappedBy="podcast", fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	private List<Episode> episodes;
	
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
	
	//Constructor
	public Podcast() {}
	
	
	//Getters +Setters
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPodcastName() {
		return podcastName;
	}

	public void setPodcastName(String podcastName) {
		this.podcastName = podcastName;
	}

	public String getPodcastHost() {
		return podcastHost;
	}

	public void setPodcastHost(String podcastHost) {
		this.podcastHost = podcastHost;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getPodcastDescription() {
		return podcastDescription;
	}

	public void setPodcastDescription(String podcastDescription) {
		this.podcastDescription = podcastDescription;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public List<Episode> getEpisodes() {
		return episodes;
	}

	public void setEpisodes(List<Episode> episodes) {
		this.episodes = episodes;
	}

    
	@PrePersist
    protected void onCreate() {
    	this.createdAt=new Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
    	this.updatedAt=new Date();
    }
}
