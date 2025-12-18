package lt.codeacademy.services;

import lt.codeacademy.entities.Payment;
import lt.codeacademy.repositories.PaymentRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class PaymentService {

    private final PaymentRepository paymentRepository;

    public PaymentService(PaymentRepository paymentRepository) {
        this.paymentRepository = paymentRepository;
    }

    public Payment savePayment(Payment payment) {
        payment.setPaymentTime(LocalDateTime.now());
        return paymentRepository.save(payment);
    }
    public Payment createPayment(Payment payment) {
        payment.setPaymentStatus("SUCCESS");
        payment.setPaymentMode("RAZORPAY");
        payment.setPaymentTime(LocalDateTime.now());
        return paymentRepository.save(payment);
    }

}
