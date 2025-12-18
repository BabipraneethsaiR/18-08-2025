package lt.codeacademy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentSuccessController {

    @GetMapping("/payment-success")
    public String success() {
        return "payment-success";
    }
}
