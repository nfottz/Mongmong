package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewFilesDTO {
	private int reviewFileNo;
	private int reviewNo;
	private String reviewFilePath;
	private String reviewFileOriginName;
	private String reviewFileSystemName;
}
