@extends('layouts.index')

@section('konten')
<div class="main-panel">
    <div class="content-wrapper">
      <div class="page-header mb-4">
        <h3 class="page-title">
          <span class="page-title-icon bg-gradient-primary text-white me-2">
            <i class="mdi mdi-format-list-bulleted menu-icon"></i>
          </span>Home <i class="mdi mdi-chevron-right"></i> Log Aplikasi
        </h3>

      </div>
      <div class="row">
        <div class="col-12 grid-margin">
          <div class="card">
            <div class="card-body">
              <div class="table-responsive">
                <table id="example" class="table table-striped" style="width:100%">
                  <thead>
                    <tr>
                      <th class="col-md-1 text-center">No</th>
                      <th class="col-md-5 text-center">Waktu</th>
                      <th class="text-center">Pengguna</th>
                      <th class="text-center">Aktifitas</th>
                      <th class="text-center">Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>{{-- Data pertama --}}</tr>
                    <tr>{{-- Data kedua --}}</tr>
                    <tr>{{-- Data ketiga --}}</tr>
                    <tr>{{-- Data ketiga --}}</tr>
                    <tr>{{-- Data ketiga --}}</tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    <!-- content-wrapper ends -->
</div>
    
@endsection