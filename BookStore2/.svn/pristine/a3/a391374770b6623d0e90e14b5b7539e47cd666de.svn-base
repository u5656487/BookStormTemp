package com.service;

import com.beans.User;

public interface UserService {
	/**
	 * 根据id修改用户信息
	 * 参数：User
	 * 返回：变更条数  int类型
	 */
	public boolean updateUserById(User user);
	/**
	 * 根据id查询用户信息
	 * 参数：id
	 * 返回：User
	 */
	public User findUserById(int id);
	
	/**
	 * 根据名字 密码登录
	 * @param username
	 * @param password
	 * @return
	 */
	public User checkLogin(String username,String password);

	/**
	 * 注册 新增用户
	 * @param user
	 * @return boolean
	 */
	public boolean insertUser(User user);
}
