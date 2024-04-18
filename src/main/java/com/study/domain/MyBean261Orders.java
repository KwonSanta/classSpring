package com.study.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MyBean261Orders {
    private int id;
    private int customerId;
    private int employeeId;
    private String date;
    private int shipperId;
}
