package model;

import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Department {
    private String id;
    private String location;
    private String name;
}
