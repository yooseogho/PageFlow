package com.example.demo.service.member;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.example.demo.dao.member.*;

@Service
public class MemberService {
  @Autowired
  MemberDao memberDao;
}
