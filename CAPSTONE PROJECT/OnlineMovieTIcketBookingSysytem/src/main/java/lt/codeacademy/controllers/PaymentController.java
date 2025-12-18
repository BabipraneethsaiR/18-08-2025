package lt.codeacademy.controllers;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import lt.codeacademy.entities.Booking;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentController {

    @Value("${razorpay.key.id}")
    private String keyId;

    @Value("${razorpay.key.secret}")
    private String keySecret;

    @GetMapping("/payment")
    public String paymentPage(HttpSession session, Model model) throws Exception {

        Booking booking = (Booking) session.getAttribute("currentBooking");
        if (booking == null) {
            return "redirect:/user/dashboard";
        }

        RazorpayClient client = new RazorpayClient(keyId, keySecret);

        JSONObject options = new JSONObject();
        options.put("amount", (int) (booking.getTotalAmount() * 100)); // paise
        options.put("currency", "INR");
        options.put("receipt", "booking_" + booking.getId());

        Order order = client.orders.create(options);

        model.addAttribute("orderId", order.get("id"));
        model.addAttribute("amount", booking.getTotalAmount());
        model.addAttribute("key", keyId);

        return "payment";
    }
}
