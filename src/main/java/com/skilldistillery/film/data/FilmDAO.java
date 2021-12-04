package com.skilldistillery.film.data;

import java.sql.SQLException;
import java.util.List;

import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	public boolean createFilm(Film film) throws SQLException;
	public Film getFilmById(int id) throws SQLException;
	public List<Film> getFilmByKeyword(String keyword) throws SQLException;
	public boolean updateFilm(Film film) throws SQLException;
	public boolean deleteFilm(Film film) throws SQLException;
}
