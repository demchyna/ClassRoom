package com.softserve.itacademy.response;

import com.softserve.itacademy.entity.Assignment;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GroupResponse {

    private Integer id;
    private String name;
    private Integer ownerId;
    private Boolean disabled;
    private Integer imageId;

    private Set<CourseResponse> courses;

    private Set<UserResponse> users;

    private ChatRoomResponse chatRoom;

    private Set<Assignment> assignments;
}
