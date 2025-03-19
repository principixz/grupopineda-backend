<style type="text/css">

    @media only screen and (min-width: 600px) {
      .content{

      margin-top:50px;
    }
  /* For tablets: */
  #cant_add{
  /*  padding-top: 0px !important;
    padding-bottom: 0px !important;

  
     padding-left : 0px !important;
    padding-right: 0px !important;*/
    width: 100%;
      text-align: center !important;
    height: 33px;
  }
}
.navigation {
  position: fixed!important;
  width: 250px!important;
  height: 100%!important;
  top: 0!important;
  overflow-y: auto!important;
  overflow-x: hidden!important;
  opacity: 0!important;
  visibility: hidden!important;
  z-index: 99!important;
  -webkit-transition-delay: 300ms!important;
  transition-delay: 300ms!important;
  /*left: 0!important;*/
  right: 0!important;
}
.boton_categorias{
  position: fixed!important;
  right: 10px!important;
  bottom: 45px!important;
  z-index: 1031!important;
}
.navigation.active {
  opacity: 1!important;
  visibility: visible!important;
  -webkit-transition-delay: 0s!important;
  transition-delay: 0s!important;
}

.navigation.active .navigation__inner {
  background-color: #E9EAF3!important;
  -webkit-transform: translate(0, 0)!important;
  transform: translate(0, 0)!important;
  -webkit-transition: background-color 0s linear 599ms, -webkit-transform 300ms linear!important;
  transition: background-color 0s linear 599ms, -webkit-transform 300ms linear!important;
  transition: transform 300ms linear, background-color 0s linear 599ms!important;
  transition: transform 300ms linear, background-color 0s linear 599ms, -webkit-transform 300ms linear!important;
}

.navigation.active .navigation__inner:after {
  width: 300%!important;
  border-radius: 50%!important;
  -webkit-animation: elastic 150ms ease 300.5ms both!important;
  animation: elastic 150ms ease 300.5ms both!important;
}

.navigation__inner {
  position: absolute!important;
  width: 100%!important;
  height: 80%!important;
  top: 115px!important;
  left: 0!important;
  overflow: hidden!important;
  overflow-y: scroll!important;
  z-index: 999999!important;
  -webkit-transform: translate(-100%, 0)!important;
  transform: translate(100%, 0)!important;
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: transform 300ms linear, background-color 0s linear 300ms!important;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
}

.navigation__inner:after {
  content: ''!important;
  position: absolute!important;
  width: 0!important;
  height: 100%!important;
  top: 0!important;
  right: 0!important;
  background-color: #E9EAF3!important;
  border-radius: 50%!important;
  z-index: -1!important;
  -webkit-transition: all 300ms linear!important;
  transition: all 300ms linear!important;
}
@-webkit-keyframes 
elastic {  0% {
 border-radius: 50%!important;
}
45% {
 border-radius: 0!important;
}
65% {
 border-top-right-radius: 40px 50%!important;
 border-bottom-right-radius: 40px 50%!important;
}
80% {
 border-radius: 0!important;
}
90% {
 border-top-right-radius: 20px 50%!important;
 border-bottom-right-radius: 20px 50%!important;
}
100% {
 border-radius: 0!important;
}
}

@keyframes 
elastic {  0% {
 border-radius: 50%!important;
}
45% {
 border-radius: 0!important;
}
65% {
 border-top-right-radius: 40px 50%!important;
 border-bottom-right-radius: 40px 50%!important;
}
80% {
 border-radius: 0!important;
}
90% {
 border-top-right-radius: 20px 50%!important;
 border-bottom-right-radius: 20px 50%!important;
}
100% {
 border-radius: 0!important;
}
}


.sidebar-content {
  background-color: #E9EAF3!important;
  overflow: hidden!important;
}


.categoriaproducto {
  position: relative!important;
  width: 100%!important;
  height: 40px!important;
  padding-left: 10px!important;
  display: flex!important;
  align-items: center!important;
  cursor: pointer!important;
  overflow: hidden!important;
}
.categoriaproducto__photo {
  border-radius: 50%!important;
  margin-right: 1.5rem!important;
}
.categoriaproducto_nombre {
  font-size: 1.2rem!important;
  font-family: "Open Sans", Helvetica, Arial, sans-serif!important;
}
.categoriaproducto__status {
  position: absolute!important;
  top: 2.1rem!important;
  right: 1.5rem!important;
  width: 8px!important;
  height: 8px!important;
  border: 2px solid #00B570!important;
  border-radius: 50%!important;
  opacity: 0!important;
  transition: opacity 0.3s!important;
}
.categoriaproducto__status.online {
  opacity: 1!important;
}

.search {
  position: absolute!important;
  bottom: 0!important;
  left: 0!important;
  width: 100%!important;
  height: 5.5rem!important;
  padding-left: 1.5rem!important;
  background: #fff!important;
  display: flex!important;
  align-items: center!important;
}

svg {
  overflow: visible!important;
}

.sidebar {
  z-index: 1!important;
  position: absolute!important;
  top: 0!important;
  left: 0!important;
  display: block!important;
  width: 100%!important;
  height: 100%!important;
}
</style>
<style>
@font-face {
  font-family: 'icomoon'!important;
  src:url('../fonts/icomoon/icomoon.eot?pvm5gj')!important;
  src:url('../fonts/icomoon/icomoon.eot?#iefixpvm5gj') format('embedded-opentype'),
  url('../fonts/icomoon/icomoon.woff?pvm5gj') format('woff'),
  url('../fonts/icomoon/icomoon.ttf?pvm5gj') format('truetype'),
  url('../fonts/icomoon/icomoon.svg?pvm5gj#icomoon') format('svg')!important;
  font-weight: normal!important;
  font-style: normal!important;
  } /* Icons created with icomoon.io/app */
  .footer { display:none!important; }
  #setting_panel_btn{display: none!important;}
  .heading-bg{
    display: none!important;
  }
  .tabs {
    position: relative!important;
    width: 100%!important;
    overflow: hidden!important;
    margin: 1em 0 2em!important;
    font-weight: 300!important;
  }

  /* Nav */
  .tabs nav {
    text-align: center!important;
  }

  .tabs nav ul {
    padding: 0!important;
    margin: 0!important;
    list-style: none!important;
    display: inline-block!important;
  }

  .tabs nav ul li {
    border: 1px solid #becbd2!important;
    border-bottom: none!important;
    /* margin: 0 0.25em!important;*/
    display: block!important;
    float: left!important;
    position: relative!important;
  }

  .tabs nav li.tab-current {
    border: 1px solid #ffffff!important;
    box-shadow: inset 0 2px #ffffff!important;
    border-bottom: none!important;
    z-index: 100!important;
  }

  .tabs nav li.tab-current:before,
  .tabs nav li.tab-current:after {
    content: ''!important;
    position: absolute!important;
    /* height: 1px!important;*/
    right: 100%!important;
    bottom: 0!important;
    width: 1000px!important;
    background: #ffffff!important;
  }

  .tabs nav li.tab-current:after {
    right: auto!important;
    left: 100%!important;
    width: 4000px!important;
  }

  .tabs nav a {
    color: #e2f3fc!important;
    display: block!important;
    font-size: 1.45em!important;
    line-height: 2.5!important;
    padding: 0 1.25em!important;
    white-space: nowrap!important;
  }

  .tabs nav a:hover {
    color: #35383b!important;
  }

  .tabs nav li.tab-current a {
    color: #030303!important;
  }

  /* Icons */
  .tabs nav a:before {
    display: inline-block!important;
    vertical-align: middle!important;
    text-transform: none!important;
    font-weight: normal!important;
    font-variant: normal!important;
    font-family: 'icomoon'!important;
    line-height: 1!important;
    speak: none!important;
    -webkit-font-smoothing: antialiased!important;
    margin: -0.25em 0.4em 0 0!important;
  }

  .icon-.footer { display:none!important; }
  #setting_panel_btn{display: none!important;}
  .page-wrapper{
    min-height: 562px!important;padding-bottom: 0px!important;padding-left: 0px!important;padding-right: 0px!important;
    }d:before {
      content: "\e600"!important;
    }

    .icon-lab:before {
      content: "\e601"!important;
    }

    .icon-cup:before {
      content: "\e602"!important;
    }

    .icon-truck:before {
      content: "\e603"!important;
    }

    .icon-shop:before {
      content: "\e604"!important;
    }

    /* Content */
    .content section {
      font-size: 1.25em!important;
      padding: 2em 0em!important;
      /*display: contents!important;*/
      max-width: 1230px!important;
      margin: 0 auto!important;
    }

    .content section:before,
    .content section:after {
      content: ''!important;
      display: table!important;
    }

    .content section:after {
      clear: both!important;
    }

    /* Fallback example */
    .no-js .content section {
      display: block!important;
      padding-bottom: 2em!important;
      border-bottom: 1px solid #ffffff!important;
    }

    .content section.content-current {
      display: block!important;
    }

    .mediabox {
      float: left!important;
      width: 33%!important;
      padding: 0 25px!important;
    }

    .mediabox img {
      max-width: 100%!important;
      display: block!important;
      margin: 0 auto!important;
    }

    .mediabox h3 {
      margin: 0.75em 0 0.5em!important;
    }

    .mediabox p {
      padding: 0 0 1em 0!important;
      margin: 0!important;
      line-height: 1.3!important;
    }

    /* Example media queries */

    @media screen and (max-width: 52.375em) {
      .tabs nav a span {
        display: none!important;
      }

      .tabs nav a:before {
        margin-right: 0!important;
      }

      .mediabox {
        float: none!important;
        width: auto!important;
        padding: 0 0 35px 0!important;
        font-size: 90%!important;
      }

      .mediabox img {
        float: left!important;
        margin: 0 25px 10px 0!important;
        max-width: 40%!important;
      }

      .mediabox h3 {
        margin-top: 0!important;
      }

      .mediabox p {
        margin-left: 40%!important;
        margin-left: calc(40% + 25px)!important;
      }

      .mediabox:before,
      .mediabox:after {
        content: ''!important;
        display: table!important;
      }

      .mediabox:after {
        clear: both!important;
      }
    }

    @media screen and (max-width: 32em) {
      .tabs nav ul,
      .tabs nav ul li a {
        width: 100%!important;
        padding: 0!important;
      }

      .tabs nav ul li {
        width: 20%!important;
        width: calc(20% + 1px)!important;
        margin: 0 0 0 -1px!important;
      }

      .tabs nav ul li:last-child {
        border-right: none!important;
      }

      .mediabox {
        text-align: center!important;
      }

      .mediabox img {
        float: none!important;
        margin: 0 auto!important;
        max-width: 100%!important;
      }

      .mediabox h3 {
        margin: 1.25em 0 1em!important;
      }

      .mediabox p {
        margin: 0!important;
      }
    }
    @media screen and (max-width: 513px){
      .payment{
    font-size: 10px!important;
    padding-left: 0px!important;
    padding-right: 0px!important;
    height: 52px!important;
    padding-bottom: 32px!important;
      }
      .navigation1.active {
    opacity: 1!important;
    visibility: visible!important;
    -webkit-transition-delay: 0s!important;
    transition-delay: 0s!important;
}

.navigation1 {
    position: fixed!important;
    width: 260px!important;
    height: 335px!important;
    top: 365px!important;
    overflow-y: auto!important;
    overflow-x: hidden!important;
    opacity: 0!important;
    visibility: hidden!important;
    z-index: 99!important;
    -webkit-transition-delay: 300ms!important;
    transition-delay: 300ms!important;
    /* left: 0!important; */
    right: 52px!important;
}
      .iderror{
        width: 300px!important;
      }
      .navigation__inner {
        position: absolute!important;
        width: 100%!important;
        height: 77%!important;
        top: 122px!important;
        left: 0!important;
        overflow: hidden!important;
        overflow-y: scroll!important;
        z-index: 999999!important;
        -webkit-transform: translate(-100%, 0)!important;
        transform: translate(100%, 0)!important;
        -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
        transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
        transition: transform 300ms linear, background-color 0s linear 300ms!important;
        transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
      }
      .claseproducto{
        /*border: 1px solid #6988a5!important;*/
        font-family: sans-serif!important;
        line-height: 1.4!important;
        overflow: hidden!important;
        text-overflow: ellipsis!important;
        height: 50px!important;
        /*width: 50%!important;*/
        margin: auto!important;
      }
      .page-wrapper{
        min-height: 562px!important;
        padding-bottom: 0px!important;
        padding-left: 0px!important;
        padding-right: 0px!important;
      }
      .navbar-fixed-top1 {
        top: 55px!important;
        border-width: 0 0 1px!important; 
      }
      .navbar-fixed-top1 {
        background: #ec432f!important;
        position: fixed!important;
        right: 0!important;
        left:0px!important;
        top: 66px!important;
        z-index: 1030!important;    
      } 
      .slide-nav-toggle .navbar-fixed-top1 {
        background: #ec432f!important;
        position: fixed!important;
        right: 0!important;
        left:223px!important;
        top: 66px!important;
        z-index: 1030!important;    
      } 
      .flotante{
        position: fixed!important; 
        bottom: 0!important;
        left: 0px!important;
        right: 0!important;
        margin-left: 0px!important;
        margin-right: 0px!important;
        height: 40px!important;
        z-index: 1030!important; 
      }

      .slide-nav-toggle .flotante{
        position: fixed!important; 
        bottom: 0!important;
        left: 223px!important;
        right: 0!important;
        margin-left: 0px!important;
        margin-right: 0px!important;
        height: 40px!important;
        z-index: 1030!important; 
      }

      #pos{
        width: 100%!important;
      }
      #identrega{
        width: 100%!important;
      }
      #tipoentregad{
        width: 100%!important;
      }

      #btndetalle{
        font-family: sans-serif!important;  
        font-size: 1.3rem!important;  
        line-height: 0px!important;
        overflow: hidden!important;  
        text-overflow: ellipsis!important;  
        /*white-space: nowrap!important;  width: 70%!important; */
        padding-left: 0px!important; padding-right: 0px!important;  
        margin-right: 0px!important;
      }
      .spandetalle{
        font-family: sans-serif!important;
        font-size: 9px!important;
        line-height: 1.4!important;
        overflow: hidden!important;
        text-overflow: ellipsis!important;
        white-space: initial!important;
        /*width: 50%!important;*/
      }
      * span{
        font-size: 9px!important;
      }
      .divletra{
        font-size: 9px!important;
      }
    }


    @media screen and (min-width: 513px) and (max-width: 770px){
     .claseproducto{
      /*border: 1px solid #6988a5!important;*/
      font-family: sans-serif!important;
      line-height: 1.4!important;
      overflow: hidden!important;
      text-overflow: ellipsis!important;
      height: 50px!important;
      /*width: 50%!important;*/
      margin: auto!important;
    }
    .page-wrapper{
      min-height: 562px!important;
      padding-bottom: 0px!important;
      padding-left: 0px!important;
      padding-right: 0px!important;
    }
    .navbar-fixed-top1 {
      top: 55px!important;
      border-width: 0 0 1px!important; 
    }
    .navbar-fixed-top1 {
      background: #ec432f!important;
      position: fixed!important;
      right: 0!important;
      left:0px!important;
      top: 66px!important;
      z-index: 1030!important;    
    } 
    .slide-nav-toggle .navbar-fixed-top1 {
      background: #ec432f!important;
      position: fixed!important;
      right: 0!important;
      left:223px!important;
      top: 66px!important;
      z-index: 1030!important;    
    } 
    .flotante{
      position: fixed!important; 
      bottom: 0!important;
      left: 0px!important;
      right: 0!important;
      margin-left: 0px!important;
      margin-right: 0px!important;
      height: 40px!important;
      z-index: 1030!important; 
    }

    .slide-nav-toggle .flotante{
      position: fixed!important; 
      bottom: 0!important;
      left: 223px!important;
      right: 0!important;
      margin-left: 0px!important;
      margin-right: 0px!important;
      height: 40px!important;
      z-index: 1030!important; 
    }
    #btndetalle{
      font-family: sans-serif!important;  
      font-size: 1.3rem!important;  
      line-height: 0px!important;
      overflow: hidden!important;  
      text-overflow: ellipsis!important;  
      /*white-space: nowrap!important;  width: 70%!important; */
      padding-left: 0px!important; padding-right: 0px!important;  
      margin-right: 0px!important;
    }
    .spandetalle{
      font-family: sans-serif!important;
      font-size: 9px!important;
      line-height: 1.4!important;
      overflow: hidden!important;
      text-overflow: ellipsis!important;
      white-space: initial!important;
      /*width: 50%!important;*/
    }
    #pos{
      width: 100%!important;
    }
    #identrega{
      width: 100%!important;
    }
    #tipoentregad{
      width: 100%!important;
    }
    .navigation__inner {
      position: absolute!important;
      width: 100%!important;
      height: 90%!important;
      top: 124px!important;
      left: 0!important;
      overflow: hidden!important;
      overflow-y: scroll!important;
      z-index: 999999!important;
      -webkit-transform: translate(-100%, 0)!important;
      transform: translate(100%, 0)!important;
      -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
      transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
      transition: transform 300ms linear, background-color 0s linear 300ms!important;
      transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
    }
  }
  @media screen and (min-width: 770px) and (max-width: 1024px){
   .claseproducto{
    /*border: 1px solid #6988a5!important;*/
    font-family: sans-serif!important;
    line-height: 1.4!important;
    overflow: hidden!important;
    text-overflow: ellipsis!important;
    height: 50px!important;
    /*width: 50%!important;*/
    margin: auto!important;
  }
  .page-wrapper{
    min-height: 562px!important;
    padding-bottom: 0px!important;
    padding-left: 0px!important;
    padding-right: 0px!important;
  }
  .navbar-fixed-top1 {
    top: 55px!important;
    border-width: 0 0 1px!important; 
  }
  .navbar-fixed-top1 {
    background: #ec432f!important;
    position: fixed!important;
    right: 0!important;
    left:0px!important;
    top: 66px!important;
    z-index: 1030!important;    
  } 
  .slide-nav-toggle .navbar-fixed-top1 {
    background: #ec432f!important;
    position: fixed!important;
    right: 0!important;
    left:223px!important;
    top: 66px!important;
    z-index: 1030!important;    
  } 
  .flotante{
    position: fixed!important; 
    bottom: 0!important;
    left: 0px!important;
    right: 0!important;
    margin-left: 0px!important;
    margin-right: 0px!important;
    height: 40px!important;
    z-index: 1030!important; 
  }

  .slide-nav-toggle .flotante{
    position: fixed!important; 
    bottom: 0!important;
    left: 223px!important;
    right: 0!important;
    margin-left: 0px!important;
    margin-right: 0px!important;
    height: 40px!important;
    z-index: 1030!important; 
  }
  #btndetalle{
    font-family: sans-serif!important;  
    font-size: 1.3rem!important;  
    line-height: 0px!important;
    overflow: hidden!important;  
    text-overflow: ellipsis!important;  
    /*white-space: nowrap!important;  width: 70%!important; */
    padding-left: 0px!important; padding-right: 0px!important;  
    margin-right: 0px!important;
  }
  .spandetalle{
    font-family: sans-serif!important;
    font-size: 9px!important;
    line-height: 1.4!important;
    overflow: hidden!important;
    text-overflow: ellipsis!important;
    white-space: initial!important;
    /*width: 50%!important;*/
  }
  .navigation__inner {
    position: absolute!important;
    width: 100%!important;
    height: 90%!important;
    top: 124px!important;
    left: 0!important;
    overflow: hidden!important;
    overflow-y: scroll!important;
    z-index: 999999!important;
    -webkit-transform: translate(-100%, 0)!important;
    transform: translate(100%, 0)!important;
    -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
    transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
    transition: transform 300ms linear, background-color 0s linear 300ms!important;
    transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  }
}
@media screen and (min-width: 1025px) and (max-width: 1400px){
 .claseproducto{
  /*border: 1px solid #6988a5!important;*/
  font-family: sans-serif!important;
  line-height: 1.4!important;
  overflow: hidden!important;
  text-overflow: ellipsis!important;
  height: 50px!important;
  /*width: 50%!important;*/
  margin: auto!important;
}
.page-wrapper{
  min-height: 562px!important;
  padding-bottom: 0px!important;
  padding-left: 0px!important;
  padding-right: 0px!important;
}
.navbar-fixed-top1 {
  top: 55px!important;
  border-width: 0 0 1px!important; 
}
.navbar-fixed-top1 {
  background: #ec432f!important;
  position: fixed!important;
  right: 0!important;
  left:43px!important;
  top: 66px!important;
  z-index: 1030!important;    
} 
.slide-nav-toggle .navbar-fixed-top1 {
  background: #ec432f!important;
  position: fixed!important;
  right: 0!important;
  left:223px!important;
  top: 66px!important;
  z-index: 1030!important;    
} 
.flotante{
  position: fixed!important; 
  bottom: 0!important;
  left: 43px!important;
  right: 0!important;
  margin-left: 0px!important;
  margin-right: 0px!important;
  height: 40px!important;
  z-index: 1030!important; 
}

.slide-nav-toggle .flotante{
  position: fixed!important; 
  bottom: 0!important;
  left: 223px!important;
  right: 0!important;
  margin-left: 0px!important;
  margin-right: 0px!important;
  height: 40px!important;
  z-index: 1030!important; 
}
.navigation__inner {
  position: absolute!important;
  width: 100%!important;
  height: 88%!important;
  top: 124px!important;
  left: 0!important;
  overflow: hidden!important;
  overflow-y: scroll!important;
  z-index: 999999!important;
  -webkit-transform: translate(-100%, 0)!important;
  transform: translate(100%, 0)!important;
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: transform 300ms linear, background-color 0s linear 300ms!important;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
}
}
@media screen and (min-width: 1401px) and (max-width: 1536px){
 .navigation__inner {
  position: absolute!important;
  width: 100%!important;
  height: 80%!important;
  top: 115px!important;
  left: 0!important;
  overflow: hidden!important;
  overflow-y: auto!important;
  /* display: list-item!important; */
  z-index: 999999!important;
  -webkit-transform: translate(-100%, 0)!important;
  transform: translate(100%, 0)!important;
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: transform 300ms linear, background-color 0s linear 300ms!important;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
}
}
@media screen and (min-width: 1537px){
 .navigation__inner {
  position: absolute!important;
  width: 100%!important;
  height: 88%!important;
  top: 115px!important;
  left: 0!important;
  overflow: hidden!important;
  overflow-y: auto!important;
  /* display: list-item!important; */
  z-index: 999999!important;
  -webkit-transform: translate(-100%, 0)!important;
  transform: translate(100%, 0)!important;
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: transform 300ms linear, background-color 0s linear 300ms!important;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
}
}
@media screen and (min-width: 1401px) and (max-width: 2000px){

  #navegadorflotante{
    display: none!important;
  }

  #section-1{
    width: 50%!important;
    float: right!important;
  }

  #section-2{
    width: 50%!important;
    float: right!important;
  }
  .claseproducto{
    /*border: 1px solid #6988a5!important;*/
    font-family: sans-serif!important;
    line-height: 1.4!important;
    overflow: hidden!important;
    text-overflow: ellipsis!important;
    height: 50px!important;
    /*width: 50%!important;*/
    margin: auto!important;
  }
  .page-wrapper{
    min-height: 562px!important;
    padding-bottom: 0px!important;
    padding-left: 0px!important;
    padding-right: 0px!important;
  }
  .navbar-fixed-top1 {
    top: 55px!important;
    border-width: 0 0 1px!important; 
  }
  .navbar-fixed-top1 {
    left: 223px!important;
    background: #ec432f!important;
    position: fixed!important;
    right: 0!important;
    top: 66px!important;
    z-index: 1030!important;
    
  }
  .slide-nav-toggle .navbar-fixed-top1 {
    background: #ec432f!important;
    position: fixed!important;
    right: 0!important;
    left:43px!important;
    top: 66px!important;
    z-index: 1030!important;    
  }

  .flotante{
    position: fixed!important; 
    bottom: 5px!important;
    left: 223px!important;
    right: 0!important;
    margin-left: 0px!important;
    margin-right: 0px!important;
    height: 25px!important;
    z-index: 1030!important; 
  }
  #pos{
    width: 100%!important;
  }
  .slide-nav-toggle .flotante{
    position: fixed!important; 
    bottom: 0!important;
    left: 44px!important;
    right: 0!important;
    margin-left: 0px!important;
    margin-right: 0px!important;
    height: 40px!important;
    z-index: 1030!important; 
  }
  /*.wrapper.theme-1-active .fixed-sidebar-left, .wrapper.theme-3-active .fixed-sidebar-left, .wrapper.theme-6-active .fixed-sidebar-left*/
  .wrapper.slide-nav-toggle.sidebar-hover .flotante{
    position: fixed!important; 
    bottom: 0!important;
    left: 44px!important;
    right: 0!important;
    margin-left: 0px!important;
    margin-right: 0px!important;
    height: 40px!important;
    z-index: 1030!important;  
  }
  #btndetalle{
    font-family: sans-serif!important;  
    font-size: 12px!important;  
    line-height: 1.4!important; 
    overflow: hidden!important;  
    text-overflow: ellipsis!important;  
    /*white-space: nowrap!important;  width: 70%!important; */
    padding-left: 0px!important; padding-right: 0px!important;  
    margin-right: 0px!important;
  }
  .spandetalle{
    font-family: sans-serif!important;
    font-size: 12px!important;
    line-height: 1.4!important;
    overflow: hidden!important;
    text-overflow: ellipsis!important;
    white-space: initial!important;
    /*width: 50%!important;*/
  }
  #navegadorflotante{
    height: 50px!important;
  }
  #scroll_div1 {
    height: 630px!important;
    overflow: auto!important;
    overflow-x: hidden!important!important;
  }

  div #identrega{
    width: 100%!important;
  }

  .telefonoclass{
    width: 50%!important;
    float: left!important;
    padding-right: 10px!important;
  }
  .nombreclass{
    width: 50%!important;
    float: left!important;
    padding-left: 10px!important;

  }
  .direccionclass{
    width: 50%!important;
    float: left!important;
    padding-right: 10px!important;
  }
  .dniclass{
    width: 50%!important;
    float: left!important;
    padding-left: 10px!important;

  }
  .direccionclass, .telefonoclass, .nombreclass, .dniclass{
   margin-bottom: 5px!important;
 }
 .navigation__inner {
  position: absolute!important;
  width: 100%!important;
  height: 88%!important;
  top: 65px!important;
  left: 0!important;
  overflow: hidden!important;
  overflow-y: auto!important;
  /* display: list-item!important; */
  z-index: 999999!important;
  -webkit-transform: translate(-100%, 0)!important;
  transform: translate(100%, 0)!important;
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
  transition: transform 300ms linear, background-color 0s linear 300ms!important;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear!important;
}

}
@media screen and (min-width: 1200px){

/*   .navbar-fixed-top1 {
      top: 55px!important;
      border-width: 0 0 1px!important; 
    }
    .navbar-fixed-top1 {
        background: #ec432f!important;
    position: fixed!important;
    right: 0!important;
    top: 66px!important;
    z-index: 1030!important;
    }*/
  }
  
.rounded-circle {
  border-radius: 50%!important!important;
}
img {
  vertical-align: middle!important;
  border-style: none!important;
}
div.scrollmen {
  background-color: #4b5668!important;
  overflow: auto!important;
  white-space: nowrap!important;
}

div.scrollmen a {
  display: inline-block!important;
  color: white!important;
  text-align: center!important;
  padding: 14px!important;
  text-decoration: none!important;
}

div.scrollmen a:hover {
  background-color: #777!important;
}
.modal-dialog.cascading-modal.modal-avatar .modal-header img {
  width: 200px!important;
  height: 200px!important;
  -webkit-box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)!important;
  box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)!important;
  margin-left: auto!important;
  margin-right: auto!important; }

  .pos #pos {
   padding: 0px!important; 
 }
 .pos .contents {
  padding: 0px 0px 0px 0!important;
  padding-left: 10px!important;
  position: relative!important;
  min-height: 440px!important;
  overflow: hidden!important;
}
.sg-phone--header {

}
#wrapper {
  overflow-x:auto!important;
  position: absolute!important;
  z-index: 1!important;
  top: 45px!important;
  bottom: 40px!important;
  left: 0!important;
  width: 100%!important;
  height: 75px!important;
  background-color: #f0f1f2!important;

  /* remove overflow for accesibility */
  overflow: hidden!important;
}
.surface {
  position: absolute!important;
  height: 100%!important;
  -webkit-transform-origin: center center!important;
  transform-origin: center center!important;
  -webkit-backface-visibility: hidden!important;
  backface-visibility: hidden!important;
  -webkit-transform-style: flat!important;
  transform-style: flat!important;
  -webkit-box-sizing: border-box!important;
  -moz-box-sizing: border-box!important;
  -webkit-tap-highlight-color: transparent!important;
  pointer-events: auto!important;
}

.mam {
  position: relative!important;
  white-space: normal!important;
  width: 300px!important;
  height: -webkit-calc(100% - 30px)!important;
  height: -moz-calc(100% - 30px)!important;
  height: -ms-calc(100% - 30px)!important;
  height: calc(100% - 30px)!important;
  display: inline-block!important;
}

footer.mbm {
  position: absolute!important;
  bottom: 0!important;
  width: 100%!important;
}

#scroller {
  position: absolute!important;
  white-space: nowrap!important;
  z-index: 1!important;
  -webkit-tap-highlight-color: rgba(0,0,0,0)!important;
  height: 100%!important;
  -webkit-transform: translateZ(0)!important;
  -moz-transform: translateZ(0)!important;
  -ms-transform: translateZ(0)!important;
  -o-transform: translateZ(0)!important;
  transform: translateZ(0)!important;
  -webkit-touch-callout: none!important;
  -webkit-user-select: none!important;
  -moz-user-select: none!important;
  -ms-user-select: none!important;
  user-select: none!important;
  -webkit-text-size-adjust: none!important;
  -moz-text-size-adjust: none!important;
  -ms-text-size-adjust: none!important;
  -o-text-size-adjust: none!important;
  text-size-adjust: none!important;
}

.footer {
  width: 100%!important;
  height: 40px!important;
  position: absolute!important;
  bottom: 0!important;
  background-color: #293f54!important;
}

.pullToRefresh {
  -webkit-transform : translate3d(0,0,0)!important;
  -moz-transform    : translate3d(0,0,0)!important;
  -ms-transform     : translate3d(0,0,0)!important;
  transform         : translate3d(0,0,0)!important;
  position: absolute!important;
  width: 100%!important;
  height: 50px!important;
  top: -50px!important;
  text-align: center!important;
  line-height: 50px!important;
}
.pullToLoadMore {
  -webkit-transform: translate3d(0, 0, 0)!important;
  -moz-transform: translate3d(0, 0, 0)!important;
  -ms-transform: translate3d(0, 0, 0)!important;
  transform: translate3d(0, 0, 0)!important;
  height: 50px!important;
  text-align: center!important;
  line-height: 50px!important;
}

.pullToRefresh > .icon, .pullToLoadMore > .icon {
  -webkit-transition : -webkit-transform 300ms!important;
  -moz-transition    : -moz-transform 300ms!important;
  -ms-transition     : -ms-transform 300ms!important;
  transition         : transform 300ms!important;

  -webkit-transform : translate3d(0,0,0)!important;
  -moz-transform    : translate3d(0,0,0)!important;
  -ms-transform     : translate3d(0,0,0)!important;
  transform         : translate3d(0,0,0)!important;
  padding: 0 5px!important;
}
.pullToRefresh > .icon.trigger, .pullToLoadMore > .icon.trigger {
  -webkit-transform : translate3d(0,0,0) rotate(180deg)!important;
  -moz-transform    : translate3d(0,0,0) rotate(180deg)!important;
  -ms-transform     : translate3d(0,0,0) rotate(180deg)!important;
  transform         : translate3d(0,0,0) rotate(180deg)!important;
}

.pullToRefresh > .icon.loading, .pullToLoadMore > .icon.loading {
  -webkit-animation : spin .6s linear infinite!important;
  -moz-animation    : spin .6s linear infinite!important;
  -ms-animation     : spin .6s linear infinite!important;
  animation         : spin .6s linear infinite!important;
}

@-webkit-keyframes spin { from { -webkit-transform: rotate(180deg)!important; } to { -webkit-transform: rotate(540deg)!important; } }
@-moz-keyframes spin    { from { -moz-transform: rotate(180deg)!important; }    to { -moz-transform: rotate(540deg)!important; } }
@-ms-keyframes spin     { from { -ms-transform: rotate(180deg)!important; }     to { -ms-transform: rotate(540deg)!important; } }
@keyframes spin         { from { transform: rotate(180deg)!important; }         to { transform: rotate(540deg)!important; } }

.table > tbody > tr > td{
  padding: 3px !important!important;
}
#scroll_div1{
/* height: 550px!important;*/
 overflow: auto!important;
 overflow-x:hidden!important!important;
}
#descripcion {
  display: block!important;
  width: 100%!important;
  border: 1px solid #b6b8bb!important;
  padding: 0 5px!important;
  overflow: hidden!important;
  height: 60px!important;
  border-radius: 10px!important;
  -webkit-border-radius: 10px!important;
  color: #435584!important;
}
#body-producto-desc-cantidad {
  margin-top: 15px!important;
  width: 100%!important;
  height: 50px!important;
  position: relative!important;
  display: block!important;
}
#body-producto-desc-cantidad > input {
  border-radius: 5px!important;
  -webkit-border-radius: 5px!important;
  border: 1px solid #aaa!important;
  font-family: Arial, "MS Trebuchet", sans-serif!important;
  font-size: 17px!important;
  width: 100px!important;
  position: absolute!important;
  top: 0!important;
  left: 80px!important;
  padding: 0 5px!important;
  text-align: right!important;
}

#body-producto-desc-cantidad > label {
  text-shadow: 15px!important;
  color: #555!important;
  font-weight: 700!important;
  position: absolute!important;
  top: 6px!important;
  left: 0!important;
}


.scroll::-webkit-scrollbar {
  width: 10px!important;
}

.scroll::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3)!important; 
  border-radius: 5px!important;
}

.scroll::-webkit-scrollbar-thumb {
  border-radius: 5px!important;
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5)!important; 
}

#cuerpo::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3)!important;
  background-color: #F5F5F5!important;
  opacity: 0.5!important;
}

#cuerpo::-webkit-scrollbar
{
  width: 6px!important;
  background-color: #F5F5F5!important;
  opacity: 0.5!important;
}

#cuerpo::-webkit-scrollbar-thumb
{
  background-color: #000000!important;
  opacity: 0.5!important;
}  
</style>
