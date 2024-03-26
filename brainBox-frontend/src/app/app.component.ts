import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MovieService } from './movie.service';
import { Movie } from './movie';
import { take } from 'rxjs';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'brainBox-frontend';

  movies: Movie[] = []

  constructor(private service: MovieService) {}

  fetchMovies() {
    this.service.getMovies()
      .pipe(take(1))
      .subscribe(
        (movies) => {
        this.movies = movies;
        console.log(movies);
      }
      );
  }
  

}
