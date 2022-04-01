package net.daum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {

	@RequestMapping("/faq_0")
	public String faq_0() {
		return "faq/faq_0";
	}
	@RequestMapping("/faq_1")
	public String faq_1() {
		return "faq/faq_1";
	}
	@RequestMapping("/faq_2")
	public String faq_2() {
		return "faq/faq_2";
	}
	@RequestMapping("/faq_3")
	public String faq_3() {
		return "faq/faq_3";
	}
	@RequestMapping("/faq_4")
	public String faq_4() {
		return "faq/faq_4";
	}
	@RequestMapping("/faq_5")
	public String faq_5() {
		return "faq/faq_5";
	}
	@RequestMapping("/faq_6")
	public String faq_6() {
		return "faq/faq_6";
	}
	@RequestMapping("/faq_7")
	public String faq_7() {
		return "faq/faq_7";
	}
}
