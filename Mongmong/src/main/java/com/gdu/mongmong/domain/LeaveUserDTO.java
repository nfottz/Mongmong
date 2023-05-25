package com.gdu.mongmong.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LeaveUserDTO {

    private String userId;
    private String email;
    private Date joinedAt;
    private Date leavedAt;
    private int reason;
    private String message;
}
