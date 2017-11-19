<?php $this->load->view('pages/layout/Head');
?>
  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
          <?php $this->load->view('pages/layout/Leftside');?>
          <?php $this->load->view('pages/layout/Navbar');?>
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>Theme posts</h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_content">
                    <div class="row">
                      
                      <div class="page-title">
                        <div class="title_left">
                              <h3><?php $value = $themed[0];
                              echo $value['theme_name']; 
                             ?></h3>
                         </div>

                          <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right">
                              <div class="input-group">
                                  <div class="buttons">
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      <?php 
                                      if ($offset > 0) {
                                   ?>
                                      <a href="<?php echo base_url()?>index.php/Dashboard/viewThemeImage/<?php echo $value['tid'];?>/<?php echo $offset-1;?>" ><button type="button" class="btn btn-success ">Previous</button></i></a>
                                      <?php }?>
                                      <?php 
                                        if ($count-1 > $offset) {
                                        
                                      ?>
                                      <a href="<?php echo base_url()?>index.php/Dashboard/viewThemeImage/<?php echo $value['tid'];?>/<?php echo $offset+1;?>" ><button type="button" class="btn btn-success ">Next</button></i></a>
                                      <?php }?>
                  
                                  </div>
                              </div>
                          </div>
                         </div>
            </div>

                      <div class="clearfix"></div>
                      <?php if(isset($theme)){ 
                         // print_r($themed);
                        
                          foreach ($theme as $value) {

                      ?>
                      
                      <div class="col-md-4 col-sm-4 col-xs-12 profile_details">
                        <div class="well profile_view">
                          <div class="col-sm-12">
                            <h4 class="brief"><i><?php echo $value['name'];?></i></h4>
                            <br>
                            <div class="center col-xs-12 text-center">
                            <div class="image view view-first">    
                            <a href="#" data-toggle="modal" data-target=".bs-example-modal-lg<?php echo $value['uid'];?>"><img style="width: 100%; display: block; height: 150px" st src="<?php echo base_url().$value['path'];?>" alt="image" /></a>

                             </div> 
                            </div>
                          </div>
                          <div class="col-xs-12 bottom text-right">
                            
                            <div class="col-xs-12 col-sm-12 emphasis">

                              <i class="fa fa-thumbs-o-up"> <a>500</a></i> 
                              <i class="fa fa-thumbs-o-down"> <a>100</a></i> 
                              <i class="fa fa-comments-o"> <a>100</a></i> 
                              <i class="fa fa-share-alt"> <a>100</a></i> 
                              &nbsp;
                              <a href="<?php echo base_url();?>index.php/Dashboard/viewProfile/<?php echo $value['uid'];?>"><button type="button" class="btn btn-primary btn-xs">
                                <i class="fa faa-user"> </i> View Profile
                              </button></a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="modal fade bs-example-modal-lg<?php echo $value['uid'];?>" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                      <div class="modal-content">

                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                          </button>
                          <h4 class="modal-title" id="myModalLabel"><?php echo $value['name'];?></h4>
                        </div>
                        <div class="modal-body">
                          <img style="width: 100%; display: block; height: 400px" st src="<?php echo base_url().$value['path'];?>" alt="image" />
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        
                        </div>

                      </div>
                    </div>
                  </div>
                      <?php  }}?>

                    </div>
                  </div>
                  <div class="page-title">
              <div class="title_left">
                <h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <div class="buttons">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <?php 

                          if ($offset > 0) {
                          ?>
                            <a href="<?php echo base_url()?>index.php/Dashboard/viewThemeImage/<?php echo $value['tid'];?>/<?php echo $offset-1;?>" ><button type="button" class="btn btn-success ">Previous</button></i></a>
                          <?php }?>
                          <?php 
                          if ($count-1 > $offset) {
                                  
                          ?>
                          <a href="<?php echo base_url()?>index.php/Dashboard/viewThemeImage/<?php echo$value['tid'];?>/<?php echo $offset+1;?>" ><button type="button" class="btn btn-success ">Next</button></i></a>
                          <?php }?>
                  
                      </div>
                  </div>
                </div>
              </div>
            </div>
                </div>

              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->



        <?php $this->load->view('pages/layout/Footer');?>
      </div>
    </div>






    <!-- jQuery -->
    <script src="<?php echo base_url();?>assets/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<?php echo base_url();?>assets/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="<?php echo base_url();?>assets/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="<?php echo base_url();?>assets/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="<?php echo base_url();?>assets/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="<?php echo base_url();?>assets/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/jszip/dist/jszip.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="<?php echo base_url();?>assets/vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="<?php echo base_url();?>assets/build/js/custom.min.js"></script>
  
  </body>
</html>
