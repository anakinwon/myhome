package com.pisien.myhome.validator;

import com.pisien.myhome.entity.Board;
import com.pisien.myhome.entity.User;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.thymeleaf.util.StringUtils;

@Component
public class AccountValidator implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object obj, Errors errors) {
        User u = (User) obj;
        if(StringUtils.isEmpty(u.getUsername())) {
            errors.rejectValue("username", "key", "사용자ID를 입력하세요");
        }
        if(StringUtils.isEmpty(u.getPassword())) {
            errors.rejectValue("password", "key", "비밀번호를 입력하세요");
        }
        if(StringUtils.isEmpty(u.getRealName())) {
            errors.rejectValue("realName", "key", "성명을 입력하세요");
        }
    }
}
