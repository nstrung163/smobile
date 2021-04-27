package com.smobile.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "PRODUCT_COMMENT")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductCommentEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "COMMENT_ID", columnDefinition = "bigint")
	private Integer commentId;
	
	@Column(name = "COMMENT_CONTENT", columnDefinition = "text", nullable = false)
	private String commentContent;
	
	@Column(name = "DATE_OF_COMMENT", columnDefinition = "date", nullable = false)
	private Date dateOfComment;
	
	@JoinColumn(name = "USER_ID", referencedColumnName = "USER_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private UserEntity userEntity;
	
	@JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
	@ManyToOne(fetch = FetchType.EAGER)
	private ProductEntity productEntity;
	
}