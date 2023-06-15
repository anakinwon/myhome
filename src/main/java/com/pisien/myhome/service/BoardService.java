package com.pisien.myhome.service;

import com.pisien.myhome.entity.Board;
import com.pisien.myhome.entity.User;
import com.pisien.myhome.repository.BoardRepository;
import com.pisien.myhome.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService {

    @Autowired
    private BoardRepository boardRepository;

    @Autowired
    private UserRepository userRepository;

    public Board save(String username, Board board) {
        User user = userRepository.findByUsername(username);
        board.setUser(user);
        return boardRepository.save(board);
    }

}
