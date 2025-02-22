package com.pisien.myhome.service;

import com.pisien.myhome.entity.Board;
import com.pisien.myhome.entity.Role;
import com.pisien.myhome.entity.User;
import com.pisien.myhome.repository.BoardRepository;
import com.pisien.myhome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = { Exception.class })
    public User save(User user) {
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(encodedPassword);

        user.setRealName(user.getRealName());
        user.setPhone(user.getPhone());
        user.setEmail(user.getEmail());
        user.setUseYn(true);

        Role role = new Role();
        role.setId(5l);             // ROLE_USER 권한
        user.getRoles().add(role);

//        Role role2 = new Role();
//        role2.setId(6l);             // ROLE_ADMIN 권한
//        user.getRoles().add(role2);

        User savedUser = userRepository.save(user);

        // 사용자 가입인사글 자동작성
        Board board = new Board();
        board.setTitle("안녕하세요! 가입인사 드려요");
        board.setContent("반갑습니다. 잘 부탁 드립니다!");
        board.setUser(savedUser);
        boardRepository.save(board);

        return savedUser;
    }

}
