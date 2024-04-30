package com.study.mapper;

import com.study.domain.MyBean258Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Mapper08 {

    @Select("""
            <script>
            SELECT * FROM Employees
            WHERE LastName = 'abc'
            <if test="false">
                OR FirstName = 'abc'
            </if>
            </script>
                                   """)
    List<MyBean258Employee> query1();

    @Select("""
            <script>
                SELECT * FROM my_table
                <if test="lastName != null">
                    -- lastName 이 null 이 아닐 때 코드들
                    -- #{lastName}...
                </if>
                <if test="lastName == null">
                    -- lastName 이 null 일 때 실행되는 코드
                </if>
            </script> 
            """)
    Object query2(MyBean258Employee e);

    @Select("""
            <script>
                SELECT * FROM my_table
                <if test="firstName == 'lee'">
                    -- firstName 이 lee 일 때 실행되는 코드
                </if>
                <if test="firstName != 'lee'">
                    -- firstName 이 lee 가 아닐 때 실행되는 코드
                </if>
            </script>
            """)
    Object query3(MyBean258Employee e);

    @Select("""
            <script>
                SELECT * FROM my_table
                <if test="firstName == null">
                    -- firstName 이 null 일 때 포함되는 코드
                </if>
                <if test="firstName != null">
                    -- firstName 이 null 아닐 때 포함되는 코드
                </if>
                <if test="firstName == 'lee'">
                    -- firstName 이 "lee" 일때 포함되는 코드
                </if>
            </script>
            """)
    Object query4(MyBean258Employee e);

    @Select("""
            <script>
                SELECT * FROM my_table
                <trim prefix="WHERE" prefixoOerrides="OR">
                    <if test="lastName != null">
                    OR    LastName = #{lastName}
                    </if>
                    <if test="firstName != null">
                    OR    firstName = #{firstName}
                    </if>
                </trim>
            </script>
            """)
    Object query5(MyBean258Employee e);

    @Select("""
            <script>
                <bind name="patternKeyword" value='"%" + keyword + "%"'/>
                SELECT * FROM my_table
                WHERE content LIKE ${patternKeyword}
            </script>
            """)
    Object query6(String keyword);

//    @Select("""
//            <script>
//            <![CDATA[
//            SELECT * FROM Products
//            /*WHERE Price &lt; 5*/
//            WHERE Price < 5
//            ]]>
//            </script>
//            """)
//    Object query7();
}
