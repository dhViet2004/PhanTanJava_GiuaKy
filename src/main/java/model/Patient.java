package model;

import lombok.*;

import java.util.Date;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Patient {
    private String id;
    private String address;
    private Date dateOfBirth;

}
