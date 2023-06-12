package com.godcoder.myhome;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.util.Optional;
import java.util.UUID;

@EnableJpaAuditing(modifyOnCreate = false)     // @EnableJpaAuditing(modifyOnCreate = false) 시 UpdateID는 null로 저장된다.
@SpringBootApplication
public class MyhomeApplication {

	public static void main(String[] args) {
		SpringApplication.run(MyhomeApplication.class, args);
	}

	// 스프링 데이터 JPA Auditing 사용 시 ==============================================
	private String createdByID = "IN_ADMIN";

	@Bean
	public AuditorAware<String> auditorProvider() {
//		return new AuditorAware<String>() {
//			@Override
//			public Optional<String> getCurrentAuditor() {
//				return Optional.of(UUID.randomUUID().toString());
//			}
//		};
		// 람다 형태의 1줄로 바꾸기..
		// 세션정보 가져와서 User_ID를 세팅해 주면된다.
		return () -> Optional.of(UUID.randomUUID().toString());
//		return () -> Optional.of(createdByID);
	}
	// 스프링 데이터 JPA Auditing 사용 시 ==============================================

}
