package com.skilldistillery.film.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Category;
import com.skilldistillery.film.entities.Film;
import com.skilldistillery.film.entities.Language;
import com.skilldistillery.film.entities.Rating;

@Service
public class JDBCFilmDAOImpl implements FilmDAO {

	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";
	private static final String user = "student";
	private static final String pass = "student";

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean createFilm(Film film) throws SQLException {
		String sql = "INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try (Connection conn = DriverManager.getConnection(URL, user, pass);
				PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
			conn.setAutoCommit(false);

			stmt.setString(1, film.getTitle());
			stmt.setString(2, film.getDescription());
			stmt.setDate(3, film.getReleaseYear());
			stmt.setInt(4, film.getLanguage().getId());
			stmt.setInt(5, film.getRentalDuration());
			stmt.setDouble(6, film.getRentalRate());
			stmt.setInt(7, film.getLength());
			stmt.setDouble(8, film.getReplacementCost());
			stmt.setString(9, film.getRating().toString());
			stmt.setString(10, film.getSpecialFeatures());

			int updateCount = stmt.executeUpdate();
			if (updateCount == 0) {
				return false;
			}
			ResultSet keys = stmt.getGeneratedKeys();

			if (keys.next()) {
				int newFilmId = keys.getInt(1);
				film.setId(newFilmId);
			}

		}

		return true;
	}

	
	// category and actor info to select statement and set them
	@Override
	public Film getFilmById(int filmId) throws SQLException {
		String sql = "SELECT language.id as 'language_id', language.name as 'language_name', film.id, film.title, film.description, film.release_year, language.name, film.rental_duration, film.rental_rate, film.length, film.replacement_cost, film.rating, film.special_features, cat.name as 'category_name', cat.id as 'category_id' FROM film JOIN language ON film.language_id = language.id  JOIN film_category catt ON film.id = catt.film_id JOIN category cat ON catt.category_id = cat.id WHERE film.id = ?";

		try (Connection conn = DriverManager.getConnection(URL, user, pass);
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, filmId);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				Film film = new Film();
				film.setId(rs.getInt("id"));
				film.setTitle(rs.getString("title"));
				film.setDescription(rs.getString("description"));
				film.setReleaseYear(rs.getDate("release_year"));

				Language language = new Language();
				language.setId(rs.getInt("language_id"));
				language.setName(rs.getString("language_name"));
				film.setLanguage(language);

				film.setRentalDuration(rs.getInt("rental_duration"));
				film.setRentalRate(rs.getDouble("rental_rate"));
				film.setLength(rs.getInt("length"));
				film.setReplacementCost(rs.getDouble("replacement_cost"));
				film.setRating(Rating.valueOf(rs.getString("rating")));
				film.setSpecialFeatures(rs.getString("special_features"));
				
				Category category = new Category();
				category.setId(rs.getInt("category_id"));
				category.setName(rs.getString("category_name"));
				film.setCategory(category);
				
				film.setActors(getActorsByFilmId(filmId));
				return film;
			}
		}

		return null;
	}

	@Override
	public List<Film> getFilmByKeyword(String keyword) throws SQLException {
		List<Film> films = new ArrayList<>();
		String sql = "SELECT id FROM film WHERE title LIKE ? OR description LIKE ?";
		try (Connection conn = DriverManager.getConnection(URL, user, pass);
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			ResultSet filmResult = stmt.executeQuery();
			while (filmResult.next()) {
				films.add(getFilmById(filmResult.getInt(1)));
			}

		}
		return films;
	}

	@Override
	public boolean updateFilm(Film film) throws SQLException {
		String sql = "UPDATE film SET title=?,  description=?, release_year=?, language_id=?, rental_duration=?, rental_rate=?, length=?, replacement_cost=?, rating=?, special_features=? WHERE id=?";

		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			try (PreparedStatement stmt = conn.prepareStatement(sql)) {
				conn.setAutoCommit(false);
				stmt.setString(1, film.getTitle());
				stmt.setString(2, film.getDescription());
				stmt.setDate(3, film.getReleaseYear());
				stmt.setInt(4, film.getLanguage().getId());
				stmt.setInt(5, film.getRentalDuration());
				stmt.setDouble(6, film.getRentalRate());
				stmt.setInt(7, film.getLength());
				stmt.setDouble(8, film.getReplacementCost());
				stmt.setString(9, film.getRating().toString());
				stmt.setString(10, film.getSpecialFeatures());
				stmt.setInt(11, film.getId());

				stmt.executeUpdate();
				conn.commit();
			} catch (SQLException e) {
				conn.rollback();
				throw e;
			}
		}
		return true;
	}

	@Override
	public boolean deleteFilm(Film film) throws SQLException {
		String sql = "DELETE FROM film WHERE film_id = ?";
		try (Connection conn = DriverManager.getConnection(URL, user, pass)) {
			try (PreparedStatement stmt = conn.prepareStatement(sql)) {

				conn.setAutoCommit(false);
				stmt.setInt(1, film.getId());
				int updateCount = stmt.executeUpdate();
				stmt.setInt(1, film.getId());
				updateCount = stmt.executeUpdate();
				conn.commit();

			} catch (SQLException e) {
				conn.rollback();
				throw e;
			}
		}

		return true;
	}
	
	private List<Actor> getActorsByFilmId(int filmId) throws SQLException{
		List<Actor> actors = new ArrayList<>();
		String sql = "SELECT id, first_name, last_name FROM actor JOIN film_actor ON actor.id = film_actor.actor_id WHERE film_id = ?";
		Actor actor = new Actor();
		try(Connection conn = DriverManager.getConnection(URL, user, pass)){
			try(PreparedStatement stmt = conn.prepareStatement(sql)){
				stmt.setInt(1, filmId);
				ResultSet rs = stmt.executeQuery();
				while (rs.next()) {
					actor.setId(rs.getInt("id"));
					actor.setFirstName(rs.getString("first_name"));
					actor.setLastName(rs.getString("last_name"));
					actors.add(actor);
				}
			}
		}
		
		return actors;
	}

}
