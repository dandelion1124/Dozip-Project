package com.dozip.config;

import com.dozip.service.DozipService;
import com.dozip.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SecureUser implements UserDetailsService {

    @Autowired
    DozipService dozipService;

    @Override // 시큐리티는 비밀번호를 시큐리티 내에서 따로 체크하는 곳이 있다. 여기에는 아이디값만 전달한다.
    public UserDetails loadUserByUsername(String mem_id) throws UsernameNotFoundException {

        System.out.println("========== 실행 확인 ============");
        MemberVO m = this.dozipService.login(mem_id); // 시큐리티를 통해 로그인을 하면 해당 로그인 메서드가 실행됨.
        System.out.println(m);

        // 아이디값을 통해 DB에 일치하는 회원이 있는지를 확인하고 해당 회원정보를 담아서
        // User 변수에 DB에서 가져온 아이디, 패스워드, 권한(role)을 담는다.

        List<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(m.getRole()));
        return new User(m.getMem_id(), m.getMem_pwd(), authorities); // 암호화 없이 로그인 할 때는 {noop}을 패스워드 앞에 붙여준다.
    }
}
