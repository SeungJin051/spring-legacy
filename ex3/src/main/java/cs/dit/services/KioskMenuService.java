// KioskMenuService.java
package cs.dit.services;

import cs.dit.model.KioskMenu;
import cs.dit.model.Payment;

import java.util.List;

public interface KioskMenuService {
    void addMenu(KioskMenu menu);
    List<KioskMenu> getAllMenus();
	KioskMenu getMenuById(int menuId);
	void updateMenu(KioskMenu updatedMenu);
	void deleteMenu(int menuId);
	void addOrderedMenu(KioskMenu orderedMenu);
	List<KioskMenu> getAllBasketMenus();
    void savePayment(Payment payment);
	void deletePayment(Payment payment);
	void deleteOneBasket(int itemId);
    List<Payment> getAllPayed();
	void deleteAdminOrder(String impUid);
}

