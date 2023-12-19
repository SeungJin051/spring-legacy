package cs.dit.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cs.dit.mapper.AdminMapper;
import cs.dit.model.Admin;
import cs.dit.model.KioskMenu;
import cs.dit.model.Payment;
import cs.dit.services.KioskMenuService;

@Controller
@RequestMapping("/kiosk")
@PropertySource("classpath:application.properties")
public class KioskController {

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private KioskMenuService kioskMenuService;

    @GetMapping("/index")
    public void index() {
    }
    
    @GetMapping("/menu")
    public String menu(Model model) {
        List<KioskMenu> menus = kioskMenuService.getAllMenus();
        model.addAttribute("menus", menus);

        List<KioskMenu> basketItems = kioskMenuService.getAllBasketMenus();
        model.addAttribute("basketItems", basketItems);
        return "menu";
    }

    @GetMapping("/admin-login")
    public String adminLogin(@RequestParam(required = false) String id,
                             @RequestParam(required = false) String password,
                             Model model) {
        if (id == null && password == null) {
            // This is a request to show the login form
            return "admin-login";
        } else {
            // This is a form submission, process the login
            Admin admin = adminMapper.getAdminById(id);

            if (admin != null && admin.getPassword().equals(password)) {
                // Login successful
                return "redirect:/kiosk/admin-menu";
            } else {
                // Login failed
                model.addAttribute("error", "Invalid credentials");
                return "admin-login";
            }
        }
    }

    
    @GetMapping("/admin-order")
    public String adminOrder(Model model) {
        List<Payment> payments = kioskMenuService.getAllPayed();
        model.addAttribute("payments", payments);
        return "admin-order";
    } 
    
    @GetMapping("/deleteAdminOrder")
    public String deleteAdminOrder(@RequestParam("impUid") String impUid) {
        kioskMenuService.deleteAdminOrder(impUid);

        return "redirect:/kiosk/admin-order";
    }
    
    @GetMapping("/payment")
    public String redirectPayment() {
        return "kiosk/payment";
    }
    
    @GetMapping("/paymentSuccess")
    public String paymentSuccess() {
        return "kiosk/paymentSuccess";
    }

    @PostMapping("/paymentDone")
    public String processPayment(@ModelAttribute Payment payment) {
    	kioskMenuService.savePayment(payment);
    	kioskMenuService.deletePayment(payment);
        return "redirect:/kiosk/menu";
    }
}
