package com.example.demo.notice.dto;

import java.util.*;

import com.example.demo.notice.entity.Notice;

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
