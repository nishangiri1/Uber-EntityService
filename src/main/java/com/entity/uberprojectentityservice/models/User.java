package com.entity.uberprojectentityservice.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.springframework.format.annotation.NumberFormat;

@Entity
@Getter
@Setter
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
@Inheritance(strategy = InheritanceType.JOINED)
public class User extends BaseModel{
    @Column(nullable = false)
    private String fullName;

    @Column(unique = true)
    @Email(message = "not a valid email")
    private String email;

    @Column(unique = true)
    @Pattern(regexp = "^\\d{10}$", message = "Phone number must be exactly 10 digits")
    private String phoneNumber;

    @Column(nullable = false)
    private String password;

    @OneToOne
    private ExactLocation lastKnownLocation;

    @OneToOne
    private ExactLocation home;

    @ManyToOne(fetch = FetchType.EAGER,cascade = CascadeType.MERGE)
    @JoinColumn(name="role_id",referencedColumnName = "id")
    @JsonBackReference
    private Role role;


}
