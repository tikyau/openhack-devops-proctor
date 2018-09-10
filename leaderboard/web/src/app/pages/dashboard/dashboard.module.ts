import { NgModule } from '@angular/core';
import { NgxEchartsModule } from 'ngx-echarts';
import { ThemeModule } from '../../@theme/theme.module';
import { DashboardComponent } from './dashboard.component';
import { SolarComponent } from './solar/solar.component';
import { ServiceStatusComponent } from './servicestatus/servicestatus.component';

@NgModule({
  imports: [
    ThemeModule,
    NgxEchartsModule,
    // FontAwesomeModule,
    // AngularFontAwesomeModule,
  ],
  declarations: [
    DashboardComponent,
    SolarComponent,
    ServiceStatusComponent,
  ],
  // exports:[
  //   FontAwesomeModule,
  //   AngularFontAwesomeModule,
  // ]
})
export class DashboardModule { }
