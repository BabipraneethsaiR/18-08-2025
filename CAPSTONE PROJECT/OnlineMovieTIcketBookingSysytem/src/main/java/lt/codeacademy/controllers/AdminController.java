package lt.codeacademy.controllers;

import lt.codeacademy.entities.Movie;
import lt.codeacademy.entities.Theatre;
import lt.codeacademy.services.MovieService;
import lt.codeacademy.services.TheatreService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final MovieService movieService;
    private final TheatreService theatreService;

    public AdminController(MovieService movieService, TheatreService theatreService) {
        this.movieService = movieService;
        this.theatreService = theatreService;
    }

    // ---------- ADMIN LOGIN PAGE ----------
    @GetMapping("/login")
    public String adminLogin(Model model, HttpSession session) {

        // ✅ already logged in admin → go to dashboard
        if (session.getAttribute("isAdmin") != null) {
            return "redirect:/admin/dashboard";
        }

        model.addAttribute("isAdminLogin", true);
        return "login";
    }

    // ---------- ADMIN LOGIN PROCESS ----------
    @PostMapping("/login")
    public String processAdminLogin(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {

            // ✅ IMPORTANT: clear any user session
            session.removeAttribute("loggedUser");

            session.setAttribute("isAdmin", true);
            return "redirect:/admin/dashboard";
        }

        model.addAttribute("error", true);
        model.addAttribute("isAdminLogin", true);
        return "login";
    }

    // ---------- ADMIN GUARD ----------
    private boolean isAdmin(HttpSession session) {
        return session.getAttribute("isAdmin") != null;
    }

    // ---------- DASHBOARD ----------
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/admin/login";
        return "admin-dashboard";
    }

    // ---------- MOVIES ----------
    @GetMapping("/movies")
    public String viewMovies(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/admin/login";
        model.addAttribute("movies", movieService.getAllMovies());
        return "admin-movies";
    }

    @GetMapping("/movies/add")
    public String addMoviePage(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/admin/login";
        model.addAttribute("movie", new Movie());
        return "add-movie";
    }

    @PostMapping("/movies/save")
    public String saveMovie(@ModelAttribute Movie movie, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/admin/login";
        movieService.saveMovie(movie);
        return "redirect:/admin/movies";
    }

    // ---------- THEATRES ----------
    @GetMapping("/theatres")
    public String viewTheatres(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/admin/login";
        model.addAttribute("theatres", theatreService.getAllTheatres());
        return "admin-theatres";
    }

    @GetMapping("/theatres/add")
    public String addTheatrePage(Model model, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/admin/login";
        model.addAttribute("theatre", new Theatre());
        return "add-theatre";
    }

    @PostMapping("/theatres/save")
    public String saveTheatre(@ModelAttribute Theatre theatre, HttpSession session) {
        if (!isAdmin(session)) return "redirect:/admin/login";
        theatreService.saveTheatre(theatre);
        return "redirect:/admin/theatres";
    }
}
