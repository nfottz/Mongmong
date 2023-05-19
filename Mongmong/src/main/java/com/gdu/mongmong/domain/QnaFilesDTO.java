package com.gdu.mongmong.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QnaFilesDTO {
	private int qnaFileNo;
	private int qnaNo;
	private int userNo;
	private String qnaFilePath;
	private String qnaFileOriginName;
	private String qnaFileSystemName;
}
