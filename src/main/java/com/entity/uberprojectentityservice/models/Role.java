package com.entity.uberprojectentityservice.models;


import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Role extends BaseModel{

    @Enumerated(value = EnumType.STRING)
    private RoleType roleType;

    @OneToMany(mappedBy = "role",fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    private List<User> userList;
}
