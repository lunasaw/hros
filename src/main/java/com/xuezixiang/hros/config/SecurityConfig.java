package com.xuezixiang.hros.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.xuezixiang.hros.filter.VerifyCodeFilter;
import com.xuezixiang.hros.model.Hr;
import com.xuezixiang.hros.model.RespBean;
import com.xuezixiang.hros.service.HrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.*;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import java.io.PrintWriter;

/**
 * @Description :

 * @Date: 2019/12/18 19:11
 */

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    HrService hrService;
    @Autowired
    CustomFilterInvocationSecurityMetadataSource customFilterInvocationSecurityMetadataSource;
    @Autowired
    CustomUrlDecisionManager customUrlDecisionManager;
    @Autowired
    VerifyCodeFilter verifyCodeFilter ;
    @Autowired
    MyAuthenticationFailureHandler myAuthenticationFailureHandler;

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(hrService);
    }

    /**
     * @return void
     * @Author xuezixiang
     * @Description ?????????????????????
     * @Date 19:25 2020/2/7
     * @Param [web]
     **/

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/auth/code","/login","/css/**","/js/**", "/index.html", "/img/**", "/fonts/**","/favicon.ico");
    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .addFilterBefore(verifyCodeFilter, UsernamePasswordAuthenticationFilter.class)
                .authorizeRequests()
                //.anyRequest().authenticated()
                .withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
                    @Override
                    public <O extends FilterSecurityInterceptor> O postProcess(O object) {
                        object.setAccessDecisionManager(customUrlDecisionManager);
                        object.setSecurityMetadataSource(customFilterInvocationSecurityMetadataSource);
                        return object;
                    }
                })
                .and().formLogin().usernameParameter("username").passwordParameter("password").loginProcessingUrl("/doLogin")
                .loginPage("/login")
                //??????????????????
                .successHandler((httpServletRequest, httpServletResponse, authentication) -> {
                    httpServletResponse.setContentType("application/json;charset=utf-8");
                    PrintWriter out = httpServletResponse.getWriter();
                    Hr hr = (Hr) authentication.getPrincipal();
                    //???????????????
                    hr.setPassword(null);
                    RespBean ok = RespBean.ok("???????????????", hr);
                    //???hr?????????Sting
                    String s = new ObjectMapper().writeValueAsString(ok);
                    out.write(s);
                    out.flush();
                    out.close();
                })
                //???????????????
                .failureHandler(myAuthenticationFailureHandler)
                //???????????????????????????
                .permitAll()
                .and()
                .logout()
                //????????????
                // .logoutSuccessUrl("")
                .logoutSuccessHandler((httpServletRequest, httpServletResponse, authentication) -> {
                    httpServletResponse.setContentType("application/json;charset=utf-8");
                    PrintWriter out = httpServletResponse.getWriter();
                    out.write(new ObjectMapper().writeValueAsString(RespBean.ok("????????????!")));
                    out.flush();
                    out.close();
                })
                .permitAll()
                .and()
                .csrf().disable().exceptionHandling()
                //?????????????????????????????????????????????????????????
                .authenticationEntryPoint((req, resp, authException) -> {
                    resp.setContentType("application/json;charset=utf-8");
                    resp.setStatus(401);
                    PrintWriter out = resp.getWriter();
                    RespBean respBean = RespBean.error("????????????!");
                    if (authException instanceof InsufficientAuthenticationException) {
                        respBean.setMsg("?????????????????????????????????!");
                    }
                    out.write(new ObjectMapper().writeValueAsString(respBean));
                    out.flush();
                    out.close();
                });
    }
}