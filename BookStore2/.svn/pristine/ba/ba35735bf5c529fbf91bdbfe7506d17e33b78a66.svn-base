package com.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.beans.User;
import com.dao.UserDao;
import com.service.UserService;

@Service
@Qualifier("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;
	
	@Override
	public boolean updateUserById(User user) {	
		return userDao.updateUserById(user);
	}

	@Override
	public User findUserById(int id) {
		User user = userDao.findUserById(id);
		return user;
	}

	@Override
	public User checkLogin(String username, String password) {
		User user = userDao.findByUsername(username);
		if(user != null && user.getPassword().equals(password)){
            return user;
        }else{
        	return null;
        }        	
	}

	@Override
	public boolean insertUser(User user) {		
		return userDao.insertUser(user);
	}
}
