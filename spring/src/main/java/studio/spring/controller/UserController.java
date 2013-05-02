package studio.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import studio.spring.model.User;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private final static Map<String, User> users = new HashMap<String, User>();
	
	public UserController(){
		users.put("张起灵", new User("张起灵", "闷油瓶", "02200059", "menyouping@yeah.net"));  
        users.put("李寻欢", new User("李寻欢", "李探花", "08866659", "lixunhuan@gulong.cn"));  
        users.put("拓拔野", new User("拓拔野", "搜神记", "05577759", "tuobaye@manhuang.cc"));  
        users.put("孙悟空", new User("孙悟空", "美猴王", "03311159", "sunhouzi@xiyouji.zh"));
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String addUser(Model model){
		model.addAttribute(new User());
		return "user/add";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addUser(User user){
		users.put(user.getUsername(), user);
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="/list")
	public String list(Model model){
		model.addAttribute("users", users);
		model.addAttribute(new User());
		return "user/list";
	}
	
	@RequestMapping(value="/{myname}", method=RequestMethod.GET)
	public String show(@PathVariable String myname, Model model){
		model.addAttribute(users.get(myname));
		return "user/show";
	}
	
	@RequestMapping(value="/{myname}/update", method=RequestMethod.GET)
	public String update(@PathVariable String myname, Model model){
		model.addAttribute(users.get(myname));
		return "user/update";
	}
	
	@RequestMapping(value="/{myname}/update",method=RequestMethod.POST)
	public String update(User user){
		users.put(user.getUsername(), user);
		return "redirect:/user/list";
	}
	
	@RequestMapping(value="/{myname}/delete", method=RequestMethod.GET)  
    public String delete(@PathVariable String myname){
        users.remove(myname);  
        return "redirect:/user/list"; //删除完成后显示当前存在的所有用户信息  
    } 
	
	@RequestMapping(value="/show_json", method=RequestMethod.GET)
	@ResponseBody
	public User showJson(){
		User user = new User();
		user.setUsername("airman");
		user.setNickname("三哥");
		user.setEmail("airman@gmail.com");
		return user;
	}
	
	@RequestMapping(value="/add_json", method=RequestMethod.POST)
	@ResponseBody
	public User addUserJson(User user){
		return user;
	}
}
