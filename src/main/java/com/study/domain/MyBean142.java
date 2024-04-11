package com.study.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

// getter, setter, toString, equals, hashCode
// 필수 필드를 세팅하는 생성자
@Data
@AllArgsConstructor
public class MyBean142 {
    private String id;
    private String name;
    private Integer age;

    public MyBean142() {
    }
}
