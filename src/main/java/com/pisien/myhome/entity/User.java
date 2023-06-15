package com.pisien.myhome.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedBy;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static lombok.AccessLevel.PROTECTED;

@Entity
@Data @Getter
@NoArgsConstructor(access = PROTECTED)
@EntityListeners(AuditingEntityListener.class)
public class User extends BaseEntity  {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(min=4, max=50, message = "사용자ID는 4자 ~ 50자 이내 필수입력입니다.")
    private String username;
    @NotNull
    @Size(min=4, max=100, message = "비밀번호는 4자 ~ 30자 이내 필수입력입니다.")
    private String password;

    @NotNull
    @Size(min=2, max=30, message = "성명은 2자 ~ 30자 이내 필수입력입니다.")
    private String realName;

    private String phone;
    private String email;
    private Boolean useYn;

    @JsonIgnore
    @ManyToMany
    @JoinTable(
            name = "user_role",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles = new ArrayList<>();

    //    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    @JsonIgnore
    private List<Board> boards = new ArrayList<>();

    @CreatedDate
    private LocalDateTime createdDate;       // 생성일시
    @LastModifiedDate
    private LocalDateTime lastModifiedDate;  // 수정일시

    @CreatedBy
    private String createdBy;                // 생성자ID
    @LastModifiedBy
    private String lastModifiedBy;           // 수정자ID

}
