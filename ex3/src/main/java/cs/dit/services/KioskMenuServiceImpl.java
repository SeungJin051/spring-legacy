// KioskMenuServiceImpl.java
package cs.dit.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cs.dit.mapper.KioskMenuMapper;
import cs.dit.model.KioskMenu;
import cs.dit.model.Payment;

import java.util.List;

@Service
@Transactional
public class KioskMenuServiceImpl implements KioskMenuService {

    @Autowired
    private KioskMenuMapper kioskMenuMapper;

    @Override
    public void addMenu(KioskMenu menu) {
        kioskMenuMapper.addMenu(menu);
    }

    @Override
    public List<KioskMenu> getAllMenus() {
        return kioskMenuMapper.getAllMenus();
    }

    @Override
    public KioskMenu getMenuById(int menuId) {
        return kioskMenuMapper.getMenuById(menuId);
    }

    @Override
    public void updateMenu(KioskMenu menu) {
        kioskMenuMapper.updateMenu(menu);
    }

    @Override
    public void deleteMenu(int menuId) {
        kioskMenuMapper.deleteMenu(menuId);
    }

    @Override
    public void addOrderedMenu(KioskMenu orderedMenu) {
        kioskMenuMapper.addOrderedMenu(orderedMenu);
    }

    @Override
    public List<KioskMenu> getAllBasketMenus() {
        return kioskMenuMapper.getAllBasketMenus();
    }

    @Override
    public void savePayment(Payment payment) {
    	kioskMenuMapper.savePayment(payment);
    }
    
	@Override
    public void deletePayment(Payment payment) {
    	kioskMenuMapper.deletePayment(payment);
    }
	
	@Override
    public void deleteOneBasket(int itemId) {
        kioskMenuMapper.deleteOneBasket(itemId);
    }
	
	@Override
	public List<Payment> getAllPayed() {
        return kioskMenuMapper.getAllPayed();
    }
	
    @Override
    public void deleteAdminOrder(String itemId) {
        kioskMenuMapper.deleteAdminOrder(itemId);
    }

}
