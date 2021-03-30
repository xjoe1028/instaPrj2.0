package com.ryan.insta.cotroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ryan.insta.InstaPrjApplication;
import com.ryan.insta.data.Cheat;
import com.ryan.insta.data.Comment;
import com.ryan.insta.data.RequestData;
import com.ryan.insta.data.Reward;
import com.ryan.insta.data.Student;

@Controller
@RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE)
public class IndexController {
	
	private static final Logger log = LoggerFactory.getLogger(IndexController.class);

	// 從 application.properties 中讀取配置，如取不到預設值為congratulations
	@Value("${application.msg:congratulations}")
	private String msg;

	/**
	 * 預設頁<br/>
	 * @RequestMapping("/") 和 @RequestMapping 是有區別的
	 * 如果不寫引數，則為全域性預設頁，加入輸入404頁面，也會自動訪問到這個頁面。 如果加了引數“/”，則只認為是根頁面。
	 */
//	@RequestMapping("/index")
//	public String index(Map<String, Object> map) {
////		System.out.println("application.msg is ====>>" + msg);
////		map.put("msg", msg);
//		return "index";
//	}
	
	@RequestMapping("/")
	public String index1(Map<String, Object> map) {
		log.info("in index1() ==> return index1");
		return "index1";
	}
	
	@RequestMapping("/cheat")
	public String afterCheat(Model model) throws JsonProcessingException, InterruptedException {
		log.info("in afterCheat() ==> return index2");
		return "index2";
	}

	@RequestMapping("/send")
	public String afterSend(@RequestBody RequestData request, Model model) throws InterruptedException, IOException {
		log.info("in send");
		ObjectMapper om = new ObjectMapper();
//		RequestData req = om.readValue(map, RequestData.class);
//		System.out.println(om.writeValueAsString(request));
		
		
		String url = request.getUrl();
		String tag = request.getTag();
		String keyword = request.getKeyword();
		String repeat = request.getRepeat();
		List<Reward> rewardList = request.getRewards();
		List<Cheat> cheatList = request.getCheat_list();
		try {
			List<Comment> returnData = CommentController.doLottery(url, tag, keyword, repeat, rewardList, cheatList);
			model.addAttribute("returnData",returnData);
		}catch(ArrayIndexOutOfBoundsException e) {
			model.addAttribute("returnData","留言不重複時，留言數小於中獎人數");
		}		
		return "result";
	}

}