package com.skilldistillery.film.data;

import java.sql.SQLException;

import com.skilldistillery.film.entities.Film;

public interface FilmDAO {
	public boolean createFilm(Film film) throws SQLException;
	public Film getFilmById(int id) throws SQLException;
	public Film getFilmByKeyword(String keyword) throws SQLException;
	public boolean updateFilm(Film film) throws SQLException;
	public boolean deleteFilmById(int id) throws SQLException;
}
