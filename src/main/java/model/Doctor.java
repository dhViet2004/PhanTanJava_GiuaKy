package model;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Doctor {
    private String id;
    private String name;
    private String phone;
    private String speciality;
}
