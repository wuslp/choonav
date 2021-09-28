package cnav.error.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error/*")
public class ErrorController {
	
		@RequestMapping("404.cnav")
		public String Error404() {
			return "error/404";
		}

		@RequestMapping("500.cnav")
		public String Error500() {
			return "error/500";
		}

		@RequestMapping
		public String Error() {
			return "error/error";
		}

}
