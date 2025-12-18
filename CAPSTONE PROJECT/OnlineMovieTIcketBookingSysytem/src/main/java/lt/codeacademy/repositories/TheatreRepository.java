package lt.codeacademy.repositories;

import lt.codeacademy.entities.Theatre;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TheatreRepository extends JpaRepository<Theatre, Long> {
}
