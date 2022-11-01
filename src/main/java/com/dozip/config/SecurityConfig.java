package com.dozip.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(WebSecurity web) {
        web
                .ignoring() // spring security 필터 타지 않도록 설정
                .antMatchers("/resources/**", "/partners/**"); // 정적 리소스 무시, 파트너스 페이지 무시
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors().disable()      // cors 비활성화
                .csrf().disable();      // csrf 비활성화
                /*.headers().frameOptions().disable();*/

        http.authorizeRequests()
                .antMatchers("/dozip/home", "/dozip/login", "/dozip/id_login",
                        "/dozip/login_ok", "/dozip/member_join", "/dozip/member_join_ok", "/dozip/mIDcheck",
                        "/dozip/find_login", "/dozip/find_id", "/dozip/find_pwd","/comm/sessionInfo").permitAll()
                .antMatchers("/dozip/**").hasAuthority("MEMBER") //인가
                .antMatchers("/admin/**").hasAuthority("ADMIN");

        http.formLogin()                                    // form 을 통한 login 활성화
                .loginPage("/dozip/loginGo2")            // 로그인 페이지 URL 설정 , 설정하지 않는 경우 default 로그인 페이지 노출
                .loginProcessingUrl("/dozip/login_ok")  //해당 매퍼주소가 들어오면 로그인을 실행한다.
                .usernameParameter("mem_id") // 로그인 form에 설정되어있는 name을 파라미터 값에 셋팅해준다.
                .passwordParameter("mem_pwd")
                .defaultSuccessUrl("/dozip/home") //로그인 완료 후 이동할 페이지
                .successHandler(new LoginSuccessHandler()) //로그인 성공 후 실행할 action 지정
                .failureHandler(new LoginFailureHandler()) //로그인 실패 후 실행할 action 지정
                .permitAll();

        http.logout()
                .logoutSuccessUrl("/dozip/home") //로그아웃 후 이동할 페이지 지정
                .permitAll();
    }
}
