package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerFilesDTO {
  private int UserNo;
  private String SellerFilePath;
  private String SellerFileOriginName;
  private String SellerFileSystemName;  

}
