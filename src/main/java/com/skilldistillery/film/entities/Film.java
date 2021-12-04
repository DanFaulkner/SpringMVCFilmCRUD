package com.skilldistillery.film.entities;

import java.sql.Date;
import java.util.List;
import java.util.Objects;

public class Film {

	private int id;
	private String title;
	private String description;
	private int releaseYear;
	private Language language;
	private int rentalDuration;
	private double rentalRate;
	private Integer length;
	private double replacementCost;
	private Rating rating;
	private String specialFeatures;
	private List<Actor> actors;
	private Category category;

	public List<Actor> getActors() {
		return actors;
	}

	public void setActors(List<Actor> actors) {
		this.actors = actors;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getReleaseYear() {
		return releaseYear;
	}

	public void setReleaseYear(int releaseYear) {
		this.releaseYear = releaseYear;
	}

	public Language getLanguage() {
		return language;
	}

	public void setLanguage(Language language) {
		this.language = language;
	}

	public int getRentalDuration() {
		return rentalDuration;
	}

	public void setRentalDuration(int rentalDuration) {
		this.rentalDuration = rentalDuration;
	}

	public double getRentalRate() {
		return rentalRate;
	}

	public void setRentalRate(double rentalRate) {
		this.rentalRate = rentalRate;
	}

	public Integer getLength() {
		return length;
	}

	public void setLength(Integer length) {
		this.length = length;
	}

	public double getReplacementCost() {
		return replacementCost;
	}

	public void setReplacementCost(double replacementCost) {
		this.replacementCost = replacementCost;
	}

	public Rating getRating() {
		return rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}

	public String getSpecialFeatures() {
		return specialFeatures;
	}

	public void setSpecialFeatures(String specialFeatures) {
		this.specialFeatures = specialFeatures;
	}

	@Override
	public String toString() {
		return "Film [id=" + id + ", title=" + title + ", description=" + description + ", releaseYear=" + releaseYear
				+ ", language=" + language + ", rentalDuration=" + rentalDuration + ", rentalRate=" + rentalRate
				+ ", length=" + length + ", replacementCost=" + replacementCost + ", rating=" + rating
				+ ", specialFeatures=" + specialFeatures + ", actors=" + actors + ", category=" + category + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(description, id, language, length, rating, releaseYear, rentalDuration, rentalRate,
				replacementCost, specialFeatures, title);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Film other = (Film) obj;
		return Objects.equals(description, other.description) && id == other.id
				&& Objects.equals(language, other.language) && Objects.equals(length, other.length)
				&& Objects.equals(rating, other.rating) && Objects.equals(releaseYear, other.releaseYear)
				&& rentalDuration == other.rentalDuration
				&& Double.doubleToLongBits(rentalRate) == Double.doubleToLongBits(other.rentalRate)
				&& Double.doubleToLongBits(replacementCost) == Double.doubleToLongBits(other.replacementCost)
				&& Objects.equals(specialFeatures, other.specialFeatures) && Objects.equals(title, other.title);
	}

}
