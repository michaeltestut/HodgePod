package com.testut.podcast.models;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
@Entity
@Table(name="episodes")
public class Episode {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty(message="*Episode Title is Required")
	private String episodeTitle;
	
	@NotEmpty(message="*Episode Description is Required")
	private String episodeDescription;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="podcast_id")
	private Podcast podcast;
	
	//Add media
	@NotNull(message="*Must Upload Episode (.mp3)")
	private String episodeURL;
	
	//Add Likes feature here eventually(Many to Many relationship)
	


	@Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
    
	@PrePersist
    protected void onCreate() {
    	this.createdAt=new Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
    	this.updatedAt=new Date();
    }
    
    
	//getters+setters
    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEpisodeTitle() {
		return episodeTitle;
	}

	public void setEpisodeTitle(String episodeTitle) {
		this.episodeTitle = episodeTitle;
	}

	public String getEpisodeDescription() {
		return episodeDescription;
	}

	public void setEpisodeDescription(String episodeDescription) {
		this.episodeDescription = episodeDescription;
	}

	public Podcast getPodcast() {
		return podcast;
	}

	public void setPodcast(Podcast podcast) {
		this.podcast = podcast;
	}
	

	public String getEpisodeURL() {
		return episodeURL;
	}
	
	public void setEpisodeURL(String episodeURL) {
		this.episodeURL = episodeURL;
	}
    
    //constructor
    

	public Episode() {}

}
