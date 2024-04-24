package com.study.domain;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class MyBean332 {
    private String stringCol;
    // Wrapper 는 값이 없을 때 null 로 남아있음
    // int 는 기본값이 0이라 의미가 있는 값인지 헷갈리게 함
    private Integer intCol;
    private Double decCol;
    private LocalDate dateCol;
    private LocalDateTime dateTimeCol;
}
