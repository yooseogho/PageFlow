package com.example.demo.dto.notice;

import java.util.*;

import com.example.demo.entity.notice.*;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Page {
  private Long prev;
  private Long start;
  private Long end;
  private Long next;
  private Long pageno;
  private List<Notice> notice;
}
