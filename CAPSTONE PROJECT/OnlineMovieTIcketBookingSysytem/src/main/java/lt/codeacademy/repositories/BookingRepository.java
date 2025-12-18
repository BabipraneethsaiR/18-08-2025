package lt.codeacademy.repositories;

import lt.codeacademy.entities.Booking;
import lt.codeacademy.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {

    List<Booking> findByUser(User user);
}
