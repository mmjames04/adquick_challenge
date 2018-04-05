import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ApiService } from '../api.service';
import { Billboard } from '../billboard';
import { User } from '../user';

@Component({
  selector: 'app-billboard-list',
  templateUrl: './billboard-list.component.html',
  styleUrls: ['./billboard-list.component.css']
})
export class BillboardListComponent implements OnInit {
  public billboards = ['id', 'vendor_name', 'unit_id', 'price', 'start_date', 'end_date', 'latitude', 'longitude', 'creative_asset']
  public rows: Array<Billboard>;

  constructor(public apiService: ApiService, public router: Router) {}

  ngOnInit() {
    this.apiService.get("billboards").subscribe((data: Billboard[])=>{
      this.rows = data;
    })
  }

}
