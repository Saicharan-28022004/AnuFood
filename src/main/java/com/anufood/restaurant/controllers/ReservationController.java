package com.anufood.restaurant.controllers;

import com.anufood.restaurant.model.Reservation;
import com.anufood.restaurant.repositories.ReservationRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

    private final ReservationRepository reservationRepository;

    public ReservationController(ReservationRepository reservationRepository) {
        this.reservationRepository = reservationRepository;
    }

    @GetMapping
    public String showReservationPage(HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/login";
        }
        return "reservation";
    }

    @PostMapping("/book")
    public String bookReservation(@ModelAttribute Reservation reservation, Model model) {
        reservationRepository.save(reservation);
        model.addAttribute("reservation", reservation);
        return "reservation-success";
    }

    @GetMapping("/list")
    public String listReservations(HttpSession session, Model model) {
        String role = (String) session.getAttribute("role");
        if (!"ADMIN".equals(role)) return "redirect:/login";
        List<Reservation> reservations = reservationRepository.findAll();
        model.addAttribute("reservations", reservations);
        return "reservation-list";
    }

    @GetMapping("/confirm/{id}")
    public String confirmReservation(@PathVariable int id) {
        Reservation r = reservationRepository.findById(id).orElse(null);
        if (r != null) { r.setStatus("CONFIRMED"); reservationRepository.save(r); }
        return "redirect:/reservation/list";
    }

    @GetMapping("/cancel/{id}")
    public String cancelReservation(@PathVariable int id) {
        Reservation r = reservationRepository.findById(id).orElse(null);
        if (r != null) { r.setStatus("CANCELLED"); reservationRepository.save(r); }
        return "redirect:/reservation/list";
    }
}
