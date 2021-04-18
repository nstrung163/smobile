package com.smobile.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "USER")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ID", columnDefinition = "bigint")
	private Integer userId;

	@Column(name = "USER_NAME", columnDefinition = "nvarchar(45)", nullable = false)
	private String userName;

	@Column(name = "PASSWORD", columnDefinition = "nvarchar(45)", nullable = false)
	private String password;

	@Column(name = "FULL_NAME", columnDefinition = "nvarchar(100)", nullable = false)
	private String fullName;

	@Column(name = "PHONE_NUMBER", columnDefinition = "nvarchar(13)", nullable = false)
	private String phoneNumber;

	@Column(name = "AVATA_URL", columnDefinition = "text", nullable = false)
	private String avatarUrl;

	@Column(name = "EMAIL", columnDefinition = "nvarchar(50)", nullable = true)
	private String email;

	@Column(name = "BIRTHDAY", columnDefinition = "date", nullable = false)
	private Date birthday;

	@Column(name = "GENDER", columnDefinition = "nvarchar(40)", nullable = false)
	private String gender;

	@Column(name = "ROLE_USER", columnDefinition = "nvarchar(40) default 'ROLE_USER'", nullable = true)
	private String roleUser;

	@Transient
	private MultipartFile avatarFile;

	@JsonIgnore
	@OneToMany(mappedBy = "userEntity", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<RateProductEntity> rateProductSet;

	@JsonIgnore
	@OneToMany(mappedBy = "userEntity", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<ProductCommentEntity> productCommentEntitySet;

	@JsonIgnore
	@OneToMany(mappedBy = "userEntity", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<PurchaseEntity> purchaseEntitySet;
}