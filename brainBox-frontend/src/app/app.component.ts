import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { MovieService } from './movie.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'brainBox-frontend';

  constructor(private service: MovieService) {}

  movies = this.service.logMovies();

}
