import { Component, OnInit, ViewChild } from '@angular/core';
import { ModalDirective, BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { SharedService } from '../../../global/services/shared.service';
import { AlertService } from '../../../global/services/alert.service';
import { NgForm } from '@angular/forms';

@Component({
  selector: 'app-role-management',
  templateUrl: './role-management.component.html',
  styleUrls: ['./role-management.component.scss'],
})
export class RoleManagementComponent implements OnInit {
  title = 'User Account';
  localUrl = 'settings/role-management/';
  rowsFetched;
  loading: boolean;
  loader = false;
  offset = 0;
  cols = [];
  @ViewChild('modalAddEdit') modalAddEdit: ModalDirective;
  editId: number;
  email;
  name;
  center_name;
  center_city;
  center_mobile;
  center_address;
  billing_notes;

  users:any = [];
  showActions = true;
  showAdd = true;
  newEntry = false;


  constructor(
    private srvShared: SharedService,
    private srvAlert: AlertService
  ){}

  ngOnInit(){
    this.loadUsers();
  }
  loadUsers(){
    this.loader = true;
    
    this.srvShared.post(this.localUrl+'fetch-users', {}).subscribe(res=>{
      for(let i in res){
        let u = res[i];
        u['role'] = u['role'].split(",");
        u['disRoles'] = [];
        for(let r of u['role']){
          if(r == 'fd') u['disRoles'].push("Front Desk");
          if(r == 'rd') u['disRoles'].push("Reporting Desk");
        }
        u['role'] = {
          fd: u['role'].includes('fd'),
          rd: u['role'].includes('rd'),
        };
        u['disRoles'] = u['disRoles'].join(", ");

        u['showEdit'] = false;
        u['password'] = '';

      }
      this.users = res;
      this.showActions = true;
      this.showAdd = true;
      this.newEntry = false;
      this.loader = false;
    })
  }
  addUser(){
    this.users.push({
      id: -1,
      name: '',
      email: '',
      password: '',
      disRoles: '',
      role: {
        fd: false,
        rd: false,
      },
      showEdit: true,
    })
    this.showActions = false;
    this.showAdd = false;
    this.newEntry = true;
  }
  saveUser(user){
    if(this.loader) return;

    let role:any = [];
    if(user.role.fd) role.push('fd');
    if(user.role.rd) role.push('rd');
    role = role.join(",");

    this.loader = true;
    let data = {
      id: user.id,
      name: user.name,
      email: user.email,
      role: role,
    };
    if(user.password) data['password'] = user.password;
    this.srvShared.post(this.localUrl+'save-user', data).subscribe(res=>{
      this.loader = false;
      this.srvAlert.updateSuccess();
      this.loadUsers();
    });
  }
  saveNewUser(user){
    if(this.loader) return;
    if(!user.password) return;

    let role:any = [];
    if(user.role.fd) role.push('fd');
    if(user.role.rd) role.push('rd');
    role = role.join(",");

    this.loader = true;
    this.srvShared.post(this.localUrl+'save-new-user', {
      name: user.name,
      email: user.email,
      role: role,
      password: user.password,
    }).subscribe(res=>{
      this.loader = false;
      this.srvAlert.updateSuccess();
      this.loadUsers();
    });
  }
  deleteUser(user){
    if(!confirm("Are you sure want to delete "+user.name+"?")) return;
    this.showActions = false;
    this.showAdd = true;
    this.newEntry = true;

    this.srvShared.post(this.localUrl+'delete-user', {
      id: user.id
    }).subscribe(res=>{
      this.loader = false;
      this.srvAlert.updateSuccess();
      this.loadUsers();
    });
  }
}
