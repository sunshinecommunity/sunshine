package com.sunshine.dao;

/**
 * 用户表的 mapper接口，主要功能为用户登陆注册 增删改查
 * 
 * @author 云和数据-李颜
 *
 */
import com.sunshine.model.User;

public interface UserDao {
	
	/**
	 * 用户注册信息
	 * 
	 * @param user
	 * @return
	 */
	  Integer saveUser(User user);

	
	/**
	 * 修改个人信息
	 * 
	 * @param user
	 */
	 void updateUser(User user);
	
	
	/**
	 * 删除用户
	 * 
	 * @param user
	 */
	 void  removeUser(String id);
	 
	/**
	 * 用户登陆 
	 *
	 */
	String login(String userName,String pwd);
	
	/**
	 * 
	 * 用户查询
	 */
	User getuser(String id);
	
	
	
	
}
