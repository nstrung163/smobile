package com.smobile.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@Service
public class UserServiceImpl implements IUserService {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Autowired
	IUserRepository userRepository;
	
	@Value("${parent.folder.images.account}")
	private String accountFolderPath;

	@Override
	public List<UserEntity> findAllUser() {
		List<UserEntity> users = new ArrayList<UserEntity>();
		try {
			users = userRepository.findAll();
			LOGGER.info("Lấy danh sách người dùng thành công!");
		} catch (Exception e) {
			LOGGER.error("Lây danh sách người dùng thất bại!");
		}
		return users;
	}

	@Override
	public UserEntity findByUserId(Integer userId) {
		UserEntity user = new UserEntity();
		try {
			user = userRepository.findByUserId(userId);
			LOGGER.info("Tìm kiếm người dùng theo id thành công!");
		} catch (Exception e) {
			LOGGER.info("Tìm kiếm người dùng theo id thất bại!");
		}
		return user;
	}

	@Override
	public UserEntity findByUserName(String userName) {
		UserEntity user = new UserEntity();
		try {
			user = userRepository.findByUserName(userName);
			LOGGER.info("Tìm kiếm người dùng theo username thành công!");
		} catch (Exception e) {
			LOGGER.info("Tìm kiếm người dùng theo username thất bại!");
		}
		return user;
	}

	@Override
	public ResponseDataModel addNewUser(UserEntity userEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			MultipartFile avateFile = userEntity.getAvataFile();
			if(avateFile != null && avateFile.getSize() > 0) {
				if(findByUserName(userEntity.getUserName()) != null) {
					responseMsg = "Tên người dùng đã tồn tại!";
					LOGGER.warn(responseMsg);
				} else {
					String avataPath = FileHelper.addNewFile(accountFolderPath, avateFile);
					userEntity.setAvataUrl(avataPath);
					userRepository.saveAndFlush(userEntity);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Đăng ký tài khoản thành công!";
					LOGGER.info(responseMsg);
				}
			} else {
				responseMsg = "Vui lòng chọn ảnh đại diện!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Đăng ký tài khoản thất bại";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

	@Override
	public ResponseDataModel updateUser(UserEntity userEntity) {
		int responseCode = Constants.RESULT_CD_FAIL;
		String responseMsg = StringUtils.EMPTY;
		try {
			MultipartFile avateFile = userEntity.getAvataFile();
			if(avateFile != null && avateFile.getSize() > 0) {
				if(findByUserName(userEntity.getUserName()) != null) {
					String avataPath = FileHelper.editFile(accountFolderPath, avateFile, userEntity.getAvataUrl());
					userEntity.setAvataUrl(avataPath);
					userRepository.saveAndFlush(userEntity);
					responseCode = Constants.RESULT_CD_SUCCESS;
					responseMsg = "Cập nhật tài khoản thành công!";
					LOGGER.info(responseMsg);
				} else {
					responseMsg = "Không tìm thấy tài khoản!";
					LOGGER.warn(responseMsg);
				}
			} else {
				responseMsg = "Vui lòng chọn ảnh đại diện!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Cập nhật tài khoản thất bại";
			LOGGER.error(responseMsg + e.getMessage());
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
				userRepository.deleteById(userId);
				FileHelper.deleteFile(userEntity.getAvataUrl());
				responseCode = Constants.RESULT_CD_SUCCESS;
				responseMsg = "Xóa tài khoản thành công!";
				LOGGER.info(responseMsg);
			} else {
				responseMsg = "Không tìm thấy tài khoản cần xóa!";
				LOGGER.warn(responseMsg);
			}
		} catch (Exception e) {
			responseMsg = "Không tìm thấy tài khoản cần xóa!";
			LOGGER.error(responseMsg + e.getMessage());
		}
		return new ResponseDataModel(responseCode, responseMsg);
	}

}
