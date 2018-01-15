package com.dao;

import com.beans.User;

public interface UserDao {
	/**
	 * 根据id修改用户信息
	 * @param User
	 * @return boolean
	 */
	public boolean updateUserById(User user);
	/**
	 * 根据id查询用户信息
	 * @param id
	 * @return user
	 */
	public User findUserById(int id);
	
	 /**
     * 查找用户名和密码
     * @param username 登录用户名 
     * @param password 密码
     * @return user
     */
	public User findByUsername(String username);
	
	/**
	 * 注册 新增用户
	 * @param user
	 * @return boolean
	 */
	public boolean insertUser(User user);
}
