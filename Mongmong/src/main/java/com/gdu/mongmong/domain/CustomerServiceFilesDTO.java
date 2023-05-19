package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerServiceFilesDTO {

	private int csFileNo;
	private int csNo;
	private String csFilePath;
	private String csFileOriginName;
	private String csFileSystemName;
}
