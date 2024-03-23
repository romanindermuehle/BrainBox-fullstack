import { Injectable } from '@angular/core';
import { Movie } from './movie';

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  movies: Movie[] = []
  url: string = "https://brainbox.labcraftapi.online/api/movies"
  constructor() { }

  async logMovies(): Promise<JSON> {
    const response = await fetch("/api/movies");
    const movies = await response.json();
    return (movies);
  }
  
}


