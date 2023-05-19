package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeFilesDTO {

  private int noticeFileNo;
  private int noticeNo;
  private String noticeFilePath;
  private String noticeFileOriginName;
  private String noticeFileSystemName;
}
