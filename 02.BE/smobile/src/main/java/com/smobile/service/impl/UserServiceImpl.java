package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.smobile.common.constant.Constants;
import com.smobile.common.util.FileHelper;
import com.smobile.entity.UserEntity;
import com.smobile.model.ResponseDataModel;
import com.smobile.repository.IUserRepository;
import com.smobile.service.IUserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	IUserRepository userRepository;
	
	@Value("${parent.folder.images.account}")
	private String accountFolderPath;

	@Override
	public List<UserEntity> findAllUser() {
		List<UserEntity> users = new ArrayList<UserEntity>();
		try {
			users = userRepository.findAllUser();
			log.info("Lấy danh sách người dùng thành công!");
		} catch (Exception e) {
			log.error("Lây danh sách người dùng thất bại!");
		}
		return users;
	}

	@Override
	public UserEntity findByUserId(Integer userId) {
		UserEntity user = new UserEntity();
		try {
			user = userRepository.findByUserId(userId);
			log.info("Tìm kiếm người dùng theo id thành công!");
		} catch (Exception e) {
			log.info("Tìm kiếm người dùng theo id thất bại!");
		}
		return user;
	}

	@Override
	public UserEntity findByUserName(String userName) {
		UserEntity user = new UserEntity();
		try {
			user = userRepository.findByUsername(userName);
			log.info("Tìm kiếm người dùng theo username thành công!");
		} catch (Exception e) {
			log.info("Tìm kiếm người dùng theo username thất bại!");
		}
		return user;
	}

	@Override
	public ResponseDataModel addNewUser(UserEntity userEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			MultipartFile avatarFile = userEntity.getAvatarFile();
			if(avatarFile != null && avatarFile.getSize() > 0) {
				if(findByUserName(userEntity.getUsername()) != null) {
					responseMsg = "Tên người dùng đã tồn tại!";
					log.warn(responseMsg);
				} else {
					String avataPath = FileHelper.addNewFile(accountFolderPath, avatarFile);
					userEntity.setAvatarUrl(avataPath);
//					userEntity.setPassword(FileHelper.enrcyptMD5(userEntity.getPassword() + Constants.ENCRYPT_CONSTANTS));
					userRepository.saveAndFlush(userEntity);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Đăng ký tài khoản thành công!";
					log.info(responseMsg);
				}
			} else {
				responseMsg = "Vui lòng chọn ảnh đại diện!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Đăng ký tài khoản thất bại";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg); 
	}

	@Override
	public ResponseDataModel updateUser(UserEntity userEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			MultipartFile avateFile = userEntity.getAvatarFile();
			if(avateFile != null && avateFile.getSize() > 0) {
					String avataPath = FileHelper.editFile(accountFolderPath, avateFile, userEntity.getAvatarUrl());
					userEntity.setAvatarUrl(avataPath);
			}
			userRepository.saveAndFlush(userEntity);
			responseCode = Constants.RESULT_CD_SUCCESS;
			responseMsg = "Cập nhật tài khoản thành công!";
			log.info(responseMsg);
		} catch (Exception e) {
			responseMsg = "Cập nhật tài khoản thất bại";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel deleteUserById(Integer userId) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			UserEntity userEntity = findByUserId(userId);
			if(userEntity != null) {
				userEntity.setStatusUser(0);
				userRepository.saveAndFlush(userEntity);
				FileHelper.deleteFile(userEntity.getAvatarUrl());
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa tài khoản thành công!";
				log.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy tài khoản cần xóa!";
				log.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Không tìm thấy tài khoản cần xóa!";
			log.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public UserEntity login(String username, String password) {
		return userRepository.findUserByUsernameAndPassword(username, password);
	}

}
