<section id="cuatro" class="container-fluid p-0">

    <div class="container-fluid " style="background-color:#35568C">
      <div class="container p-4 ">
        <div class="row p-xl-3 p-5" style="color:azure">
          <div
            class="col-xl-3 col-md-6 col-sm-12 col-12 align-items-center mb-4 d-flex align-items-center 
            justify-content-center  col-lg-4"
            style="text-align:center;"> <a href="https://foristom.org" target="_blank">
              <img id="" class="animated wow tada img-fluid " src="imagenes/logo_foristom_blanco.png"> </a>
          </div>

          <div class="col-xl-3 col-md-6 col-sm-12 col-12 mb-4 col-lg-4 offset-lg-1"><br>
            <span style="font-size: 16px">1<SUP>st</SUP> MRN</span><br>First Meeting of Materials Science, Engineering and Nanotechnology Researchers Network<br />
          </div>
          

          <div class="col-xl-3 col-md-6 col-sm-12 col-12 mb-4 offset-lg-1 col-lg-3"
            style="border-left-color:darkgray; border-left-width: thin; border-left-style: solid">
            <span style="font-size: 16px">Contact information:</span><br />
            <i class="fa fa-envelope"></i>  info@foristom.org<br />

                <!-- Go to www.addthis.com/dashboard to customize your tools -->
                <div class="addthis_inline_follow_toolbox"></div>
            
            <span style="font-size: 12px">
              Copyright 2022 FORISTOM<br />All rights reserved
            </span>
          </div>
        </div>
      </div>
    </div>

  </section>

  <script>

    $(document).ready(function () {


      // popovers Initialization
      $(function () {
        $('[data-toggle="popover"]').popover()
      })


      var myArr = "";

      wow = new WOW({
        boxClass: 'wow', // default
        animateClass: 'animated', // default
        offset: 0, // default
        mobile: true, // default
        live: true // default
      })

      WOW().init();

      //  animación scroll enlaces internos  
      //$('nav a').click(function(e){
      $('nav a').click(function (e) {
        e.preventDefault();		//evitar el eventos del enlace normal
        var strAncla = $(this).attr('href'); //id del ancla
        $('body,html').stop(true, true).animate({
          scrollTop: $(strAncla).offset().top
        }, 1000);
      });

      $('.carousel').carousel({
        interval: 8000
      });

      //$('#logo-u18').addClass('animated slideOutDown');
      //$('#logo-u18').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', alert("hola"));   

    });

  </script>
<!-- Go to www.addthis.com/dashboard to customize your tools -->
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-603434ebc0e070a1"></script>
