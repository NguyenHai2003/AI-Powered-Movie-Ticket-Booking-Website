package poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class LienHeController {
	@RequestMapping("lienhe")
	public String lienhe(ModelMap model) {
		model.addAttribute("user", LoginController.kh);
		return "lienhe";
	}
}