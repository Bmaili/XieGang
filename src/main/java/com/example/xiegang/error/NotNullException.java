package com.example.xiegang.error;

import com.example.xiegang.enums.ResultEnum;
import com.example.xiegang.vo.ResponseResult;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


/**
 * 参数规范检验
 *
 * @date 12:42 2022/4/4
 */

@ControllerAdvice
@ResponseBody
@Slf4j
public class NotNullException {
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseResult exceptionHandler(IllegalArgumentException e) {
        log.error("请求携带的参数不符合规范! ");
        return new ResponseResult(ResultEnum.BAD_REQUEST);
    }
}