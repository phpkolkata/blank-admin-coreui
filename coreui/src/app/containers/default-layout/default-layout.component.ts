import { SharedService } from './../../global/services/shared.service';
import { Component, OnInit } from '@angular/core';
import { navItems } from '../../_nav';
import { AuthService } from '../../global/services/auth.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-dashboard',
  templateUrl: './default-layout.component.html',
  styleUrls: ['./default-layout.component.css'],
})
export class DefaultLayoutComponent implements OnInit {
  public sidebarMinimized = true;
  public navItems = navItems;
  public isAdmin = false;
  public isFrontDesk = false;
  public calenderDate: any = new Date();
  public taskTitle = '';
  public todoList:any = [];
  public disNameRole = '';

  constructor(private authService: AuthService, private srvShared: SharedService, private router: Router) {
    this.isAdmin = authService.getRole().includes('ad');
    this.isFrontDesk = authService.getRole().includes('fd') || authService.getRole().includes('ad')
    
    let u = authService.getUser();
    this.disNameRole = u.name + ' ('+u.role+')';
  }
  ngOnInit() {
    this.fetchTodoList();
  }
  addToDo(){
    this.srvShared.post('dashboard/todolist/add', {
        title: this.taskTitle,
        time: this.srvShared.dateFormat(this.calenderDate, "yyyy-MM-dd HH-mm-ss"),
    }).subscribe(res=>{
      this.taskTitle = '';
      this.fetchTodoList();
    });
  }
  fetchTodoList(){
    this.srvShared.post('dashboard/todolist/fetch', {}).subscribe(res=>{
      this.todoList = res;
    });
  }
  deleteTodoList(id){
    this.srvShared.post('dashboard/todolist/delete', {id}).subscribe(res=>{
      this.fetchTodoList();
    });
  }
  toggleMinimize(e) {
    this.sidebarMinimized = e;
  }
  navBill() {
    this.router.navigateByUrl('/', { skipLocationChange: true }).then(() => {
      this.router.navigate(['/billing/patient']);
    });
  }
  logout() {
    this.authService.logout();
  }
}
