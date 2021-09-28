import { SafeHtmlPipe } from './pipes/desanitizer';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TableModule } from 'primeng/table';
import { DropdownModule } from 'primeng/dropdown';
import { ProgressBarModule } from 'primeng/progressbar';
import { TooltipModule } from 'primeng/tooltip';
import { ToastModule } from 'primeng/toast';

@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    TableModule,
    DropdownModule,
    ProgressBarModule,
    TooltipModule,
    ToastModule,
  ],
  exports: [
    CommonModule,
    FormsModule,
    TableModule,
    DropdownModule,
    ProgressBarModule,
    TooltipModule,
    ToastModule,
    SafeHtmlPipe,
  ],
  declarations: [
    SafeHtmlPipe,
  ]
})
export class GlobalModule {}
