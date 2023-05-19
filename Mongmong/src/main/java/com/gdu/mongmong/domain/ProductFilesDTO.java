package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductFilesDTO {
	private int prodFileNo;
	private int prodNo;
	private String prodFilePath;
	private String prodFileOriginName;
	private String prodFileSystemName;
}
