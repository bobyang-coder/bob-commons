package com.bob.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by bob on 2017/10/15.
 *
 * @author bob   <bobyang_coder@163.com>
 * @version v1.0
 * @since 2017/10/15
 */
@Controller
@RequestMapping("auth")
public class AuthController {

    @RequestMapping()
    public String hello() {
        return "login";
    }

    @RequestMapping("index")
    public String index() {
        return "index";
    }
}
