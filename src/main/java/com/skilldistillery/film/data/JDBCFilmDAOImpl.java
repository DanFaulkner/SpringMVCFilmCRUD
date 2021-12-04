package com.skilldistillery.film.data;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

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

	// in progress need to return booleans if it was created or not
	@Override
	public boolean createFilm(Film film) throws SQLException {

		Connection conn = DriverManager.getConnection(URL, user, pass);
		conn.setAutoCommit(false);
		String sql = "INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		stmt.setString(1, film.getTitle());
		stmt.setString(2, film.getDescription());
		stmt.setDate(3, film.getReleaseYear());

		// go back and figure these out
		stmt.setInt(4, film.getLanguage().getId());

		stmt.setInt(5, film.getRentalDuration());
		stmt.setDouble(6, film.getRentalRate());
		stmt.setInt(7, film.getLength());
		stmt.setDouble(8, film.getReplacementCost());
		stmt.setString(9, film.getRating().toString());
		stmt.setString(10, film.getSpecialFeatures());

		int updateCount = stmt.executeUpdate();
		if (updateCount == 1) {
			ResultSet keys = stmt.getGeneratedKeys();
			if (keys.next()) {
				int newFilmId = keys.getInt(1);
				film.setId(newFilmId);
			}
		} else {
			return false;
		}

		stmt.close();
		conn.commit();
		return true;
	}

	@Override
	public Film getFilmById(int filmId) throws SQLException {
		String sql = "SELECT language.id as 'language_id', language.name as 'language_name', film.id, film.title, film.description, film.release_year, language.name, film.rental_duration, film.rental_rate, film.length, film.replacement_cost, film.rating, film.special_features FROM film JOIN language ON film.language_id = language.id WHERE film.id = ?";

		try (Connection conn = DriverManager.getConnection(URL, user, pass);
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, filmId);

			try (ResultSet rs = stmt.executeQuery()) {
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
					return film;
				}
			}
		}

		return null;
	}

	@Override
	public List<Film> getFilmByKeyword(String keyword) throws SQLException {
		List<Film> films = new ArrayList();
		String sql = "SELECT id FROM film WHERE title LIKE ? OR description LIKE ?";
		Connection conn;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");
			ResultSet filmResult = stmt.executeQuery();
			while (filmResult.next()) {
				films.add(getFilmById(filmResult.getInt(1)));
			}
			filmResult.close();
			stmt.close();
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return films;
	}

	@Override
	public boolean updateFilm(Film film) throws SQLException {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "UPDATE film SET title=? WHERE id=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, film.getTitle());
			stmt.setInt(2, film.getId());
			int updateCount = stmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Attempting rollback");
				}
			}
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteFilm(Film film) throws SQLException {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(URL, user, pass);
			conn.setAutoCommit(false);
			String sql = "DELETE FROM film_actor WHERE film_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());
			int updateCount = stmt.executeUpdate();
			sql = "DELETE FROM film WHERE id = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, film.getId());
			updateCount = stmt.executeUpdate();
			conn.commit();

		} catch (SQLException e) {
			e.printStackTrace();
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("Attempting rollback");
				}
			}
			return false;
		}
		return true;
	}

}
