package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDTO {

  private int noticeNo;
  private String noticeTitle;
  private String noticeRegAt;
  private String noticeModiAt;
  private String noticeContent;
  private int noticeViews;
  private int depth;
  private int groupNo;
  private int groupOrder;
  private int isSecret;
  private String secretPw;
  private int isAnswer;  
}
