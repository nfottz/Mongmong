package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SellerFilesDTO {
  private int userNo;
  private String sellerFilePath;
  private String sellerFileSystemName;  

}
