package lt.codeacademy.controllers;

import lt.codeacademy.entities.Booking;
import lt.codeacademy.entities.Movie;
import lt.codeacademy.entities.Theatre;
import lt.codeacademy.entities.User;
import lt.codeacademy.services.BookingService;
import lt.codeacademy.services.MovieService;
import lt.codeacademy.services.TheatreService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@Controller
@RequestMapping("/user")
public class UserController {

    private final MovieService movieService;
    private final TheatreService theatreService;
    private final BookingService bookingService;

    public UserController(MovieService movieService,
                          TheatreService theatreService,
                          BookingService bookingService) {
        this.movieService = movieService;
        this.theatreService = theatreService;
        this.bookingService = bookingService;
    }

    // USER DASHBOARD
    @GetMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("movies", movieService.getAllMovies());
        return "user-dashboard";
    }

    // BOOKING PAGE
    @GetMapping("/book")
    public String bookingPage(Model model) {
        model.addAttribute("movies", movieService.getAllMovies());
        model.addAttribute("theatres", theatreService.getAllTheatres());
        model.addAttribute("booking", new Booking());
        return "booking";
    }

    // ✅ CREATE BOOKING (FIXED)
    @PostMapping("/book")
    public String createBooking(@ModelAttribute Booking booking,
                                @RequestParam Long movieId,
                                @RequestParam Long theatreId,
                                HttpSession session) {

        // 1️⃣ Logged-in user
        User user = (User) session.getAttribute("loggedUser");
        if (user == null) {
            return "redirect:/login";
        }
        booking.setUser(user);

        // 2️⃣ Movie
        Movie movie = movieService.getMovieById(movieId).orElseThrow();
        booking.setMovie(movie);

        // 3️⃣ Theatre
        Theatre theatre = theatreService.getTheatreById(theatreId).orElseThrow();
        booking.setTheatre(theatre);

        // 4️⃣ Show date
        booking.setShowDate(LocalDate.now());

        // 5️⃣ TOTAL AMOUNT CALCULATION ⭐⭐⭐
        double total = movie.getPrice() * booking.getNumberOfTickets();
        booking.setTotalAmount(total);

        // 6️⃣ Save booking
        Booking savedBooking = bookingService.createBooking(booking);

        // 7️⃣ Store for payment
        session.setAttribute("currentBooking", savedBooking);

        return "redirect:/payment";
    }
}
