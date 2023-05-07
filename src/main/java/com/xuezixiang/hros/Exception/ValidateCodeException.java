package com.xuezixiang.hros.Exception;


import org.springframework.security.core.AuthenticationException;


/**
 * @Description :
 * @Date: 2023/2/8 7:24
 */

public class ValidateCodeException extends AuthenticationException  {

    public ValidateCodeException(String msg) {
        super(msg);
    }


}
