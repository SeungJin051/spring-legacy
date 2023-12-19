// KioskMenuController.java
package cs.dit.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cs.dit.model.KioskMenu;
import cs.dit.services.KioskMenuService;

@Controller
@RequestMapping("/kiosk")
@PropertySource("classpath:application.properties")
public class KioskMenuController {

    @Autowired
    private KioskMenuService kioskMenuService;


    @Value("${upload.directory}")
    private String uploadDirectory;
    
    @GetMapping("/admin-write")
    public String showAdminWritePage(Model model) {
        // Add any model attributes needed for the form display
        model.addAttribute("menu", new KioskMenu());
        return "admin-write"; // Assuming your JSP file is named "admin-write.jsp"
    }
    
    @GetMapping("/admin-menu")
    public String showAdminMenuPage(Model model) {
        List<KioskMenu> menus = kioskMenuService.getAllMenus();
        // Log or debug menus
        System.out.println("Menus: " + menus);
        model.addAttribute("menus", menus);
        return "admin-menu";  // Assuming your JSP file is named "admin-menu.jsp"
    }
    
    @PostMapping("/admin-upload")
    public String handleFileUpload(@RequestParam("image") MultipartFile file,
                                   @RequestParam("name") String name,
                                   @RequestParam("price") String price,
                                   @RequestParam("info") String info,
                                   RedirectAttributes redirectAttributes) {

        if (!file.isEmpty()) {
            try {
                // Save the file to the server or cloud storage

                // Save data to the database
                KioskMenu menu = new KioskMenu();
                menu.setImage(file.getOriginalFilename()); // You may want to store the path or filename in the database
                menu.setName(name);
                menu.setPrice(price);
                menu.setInfo(info);
                kioskMenuService.addMenu(menu);

                redirectAttributes.addFlashAttribute("message", "File and data successfully uploaded!");
                
                // Transfer the file to the specified directory
                File destFile = new File(uploadDirectory + File.separator + file.getOriginalFilename());
                file.transferTo(destFile);            
                System.out.println("Upload directory created: " + uploadDirectory);
                System.out.println("File transferred to: " + destFile.getAbsolutePath());
                System.out.println("File transferred to: " + uploadDirectory + File.separator + file.getOriginalFilename());

                } catch (Exception e) {
                e.printStackTrace();
                redirectAttributes.addFlashAttribute("error", "Error uploading file.");
            }
        } else {
            redirectAttributes.addFlashAttribute("error", "Please select a file to upload.");
        }

        return "redirect:/kiosk/admin-menu";
    }

    @GetMapping("/admin-update")
    public String showUpdatePage(@RequestParam("id") int menuId, Model model) {
        KioskMenu menu = kioskMenuService.getMenuById(menuId);
        model.addAttribute("menu", menu);
        return "admin-update";
    }
    
    @PostMapping("/admin-update")
    public String updateMenu(@ModelAttribute KioskMenu updatedMenu) {
        try {
            MultipartFile imageFile = updatedMenu.getImageFile();

            if (imageFile != null && !imageFile.isEmpty()) {
                File destFile = new File(uploadDirectory + File.separator + imageFile.getOriginalFilename());
                imageFile.transferTo(destFile);
                System.out.println("File transferred to: " + destFile.getAbsolutePath());
                updatedMenu.setImage(imageFile.getOriginalFilename());
            }

            kioskMenuService.updateMenu(updatedMenu);

            return "redirect:/kiosk/admin-menu";
        } catch (Exception e) {
            e.printStackTrace();
            return "admin-update?id=" + updatedMenu.getId() + "&error=1";
        }
    }

    @GetMapping("/delete-menu")
    public String deleteMenu(@RequestParam("id") int menuId) {
        kioskMenuService.deleteMenu(menuId);

        return "redirect:/kiosk/admin-menu";
    }
    
    @GetMapping("/menu-order")
    public String showMenuOrderPage(@RequestParam("id") int menuId, Model model) {
        KioskMenu menu = kioskMenuService.getMenuById(menuId);
        model.addAttribute("menu", menu);
        return "menu-order";
    }
    
    @PostMapping("/menu-order")
    public String handleMenuOrderForm(@ModelAttribute KioskMenu kioskMenu, RedirectAttributes redirectAttributes) {
        try {
            KioskMenu menu = new KioskMenu();

            menu.setImage(kioskMenu.getImage());
            menu.setName(kioskMenu.getName());
            menu.setPrice(kioskMenu.getPrice());
            menu.setInfo(kioskMenu.getInfo());

            kioskMenuService.addOrderedMenu(menu);
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Error ordering menu.");
        }

        return "redirect:/kiosk/menu"; 
    }

    @GetMapping("/deleteBasketMenu")
    public String deleteBasketMenu(@RequestParam("id") int itemId) {
        kioskMenuService.deleteOneBasket(itemId);

        return "redirect:/kiosk/menu";
    }
}
