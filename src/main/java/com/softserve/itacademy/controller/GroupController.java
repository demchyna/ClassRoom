package com.softserve.itacademy.controller;

import com.softserve.itacademy.request.DisableRequest;
import com.softserve.itacademy.request.GroupRequest;
import com.softserve.itacademy.response.GroupResponse;
import com.softserve.itacademy.service.GroupService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/api/v1/groups")
public class GroupController {

    private final GroupService groupService;

    public GroupController(GroupService groupService) {
        this.groupService = groupService;
    }

    @GetMapping
    public ResponseEntity<List<GroupResponse>> findAll() {
        return new ResponseEntity<>(groupService.findAll(), HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        groupService.delete(id);
        return new ResponseEntity<>(OK);
    }

    @PatchMapping("/{id}/disabled")
    public ResponseEntity<Void> updateDisabled(@PathVariable Integer id, @RequestBody DisableRequest disableRequest) {
        groupService.updateDisabled(id, disableRequest.isDisabled());
        return new ResponseEntity<>(OK);
    }

    @GetMapping("/{id}/groups")
    public ResponseEntity<List<GroupResponse>> findGroupsByOwner(@PathVariable("id") Integer ownerId) {
        return new ResponseEntity<>(groupService.findByOwner(ownerId), OK);
    }

    @GetMapping("/student/{id}")
    public ResponseEntity<List<GroupResponse>> findByStudent(@PathVariable("id") Integer id) {
        return new ResponseEntity<>(groupService.findByStudent(id), OK);
    }
}
