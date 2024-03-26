import { Injectable } from '@angular/core';
import { Movie } from './movie';
import { HttpClient } from '@angular/common/http';
import { Observable, take } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  url: string = "/api/movies"
  constructor(private http: HttpClient) { }

  getMovies(): Observable<Movie[]> {
    return this.http.get<Movie[]>(this.url);
  }

 
  
}


