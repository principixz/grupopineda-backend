<style type="text/css">

@media only screen and (min-width: 600px) {
      .content{

      margin-top:95px;
    }
  /* For tablets: */
  #cant_add{
    padding-top: 4px !important;
    padding-bottom: 4px !important;
    text-align: center !important;
  }
}






.navigation {
  position: fixed;
  width: 250px;
  height: 100%;
  top: 0;
  overflow-y: auto;
  overflow-x: hidden;
  opacity: 0;
  visibility: hidden;
  z-index: 99;
  -webkit-transition-delay: 300ms;
  transition-delay: 300ms;
  /*left: 0;*/
  right: 0;
}
.boton_categorias{
  position: fixed;
  right: 10px;
  bottom: 45px;
  z-index: 1031;
}
.navigation.active {
  opacity: 1;
  visibility: visible;
  -webkit-transition-delay: 0s;
  transition-delay: 0s;
}

.navigation.active .navigation__inner {
  background-color: #E9EAF3;
  -webkit-transform: translate(0, 0);
  transform: translate(0, 0);
  -webkit-transition: background-color 0s linear 599ms, -webkit-transform 300ms linear;
  transition: background-color 0s linear 599ms, -webkit-transform 300ms linear;
  transition: transform 300ms linear, background-color 0s linear 599ms;
  transition: transform 300ms linear, background-color 0s linear 599ms, -webkit-transform 300ms linear;
}

.navigation.active .navigation__inner:after {
  width: 300%;
  border-radius: 50%;
  -webkit-animation: elastic 150ms ease 300.5ms both;
  animation: elastic 150ms ease 300.5ms both;
}

.navigation__inner {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 115px;
  left: 0;
  overflow: hidden;
  overflow-y: scroll;
  z-index: 999999;
  -webkit-transform: translate(-100%, 0);
  transform: translate(100%, 0);
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: transform 300ms linear, background-color 0s linear 300ms;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
}

.navigation__inner:after {
  content: '';
  position: absolute;
  width: 0;
  height: 100%;
  top: 0;
  right: 0;
  background-color: #E9EAF3;
  border-radius: 50%;
  z-index: -1;
  -webkit-transition: all 300ms linear;
  transition: all 300ms linear;
}
@-webkit-keyframes 
elastic {  0% {
 border-radius: 50%;
}
45% {
 border-radius: 0;
}
65% {
 border-top-right-radius: 40px 50%;
 border-bottom-right-radius: 40px 50%;
}
80% {
 border-radius: 0;
}
90% {
 border-top-right-radius: 20px 50%;
 border-bottom-right-radius: 20px 50%;
}
100% {
 border-radius: 0;
}
}

@keyframes 
elastic {  0% {
 border-radius: 50%;
}
45% {
 border-radius: 0;
}
65% {
 border-top-right-radius: 40px 50%;
 border-bottom-right-radius: 40px 50%;
}
80% {
 border-radius: 0;
}
90% {
 border-top-right-radius: 20px 50%;
 border-bottom-right-radius: 20px 50%;
}
100% {
 border-radius: 0;
}
}


.sidebar-content {
  background-color: #E9EAF3;
  overflow: hidden;
}


.categoriaproducto {
  position: relative;
  width: 100%;
  height: 40px;
  padding-left: 10px;
  display: flex;
  align-items: center;
  cursor: pointer;
  overflow: hidden;
}
.categoriaproducto__photo {
  border-radius: 50%;
  margin-right: 1.5rem;
}
.categoriaproducto_nombre {
  font-size: 1.2rem;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}
.categoriaproducto__status {
  position: absolute;
  top: 2.1rem;
  right: 1.5rem;
  width: 8px;
  height: 8px;
  border: 2px solid #00B570;
  border-radius: 50%;
  opacity: 0;
  transition: opacity 0.3s;
}
.categoriaproducto__status.online {
  opacity: 1;
}

.search {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 5.5rem;
  padding-left: 1.5rem;
  background: #fff;
  display: flex;
  align-items: center;
}

svg {
  overflow: visible;
}

.sidebar {
  z-index: 1;
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  height: 100%;
}
</style>
<style>
@font-face {
  font-family: 'icomoon';
  src:url('../fonts/icomoon/icomoon.eot?pvm5gj');
  src:url('../fonts/icomoon/icomoon.eot?#iefixpvm5gj') format('embedded-opentype'),
  url('../fonts/icomoon/icomoon.woff?pvm5gj') format('woff'),
  url('../fonts/icomoon/icomoon.ttf?pvm5gj') format('truetype'),
  url('../fonts/icomoon/icomoon.svg?pvm5gj#icomoon') format('svg');
  font-weight: normal;
  font-style: normal;
  } /* Icons created with icomoon.io/app */
  .footer { display:none; }
  #setting_panel_btn{display: none;}
  .heading-bg{
    display: none;
  }
  .tabs {
    position: relative;
    width: 100%;
    overflow: hidden;
    margin: -4em 0 2em;
    font-weight: 300;
  }

  /* Nav */
  .tabs nav {
    text-align: center;
  }

  .tabs nav ul {
    padding: 0;
    margin: 0;
    list-style: none;
    display: inline-block;
  }

  .tabs nav ul li {
    border: 1px solid #becbd2;
    border-bottom: none;
    /* margin: 0 0.25em;*/
    display: block;
    float: left;
    position: relative;
  }

  .tabs nav li.tab-current {
    border: 1px solid #ffffff;
    box-shadow: inset 0 2px #ffffff;
    border-bottom: none;
    z-index: 100;
  }

  .tabs nav li.tab-current:before,
  .tabs nav li.tab-current:after {
    content: '';
    position: absolute;
    /* height: 1px;*/
    right: 100%;
    bottom: 0;
    width: 1000px;
    background: #ffffff;
  }

  .tabs nav li.tab-current:after {
    right: auto;
    left: 100%;
    width: 4000px;
  }

  .tabs nav a {
    color: #e2f3fc;
    display: block;
    font-size: 1.45em;
    line-height: 2.5;
    padding: 0 1.25em;
    white-space: nowrap;
  }

  .tabs nav a:hover {
    color: #35383b;
  }

  .tabs nav li.tab-current a {
    color: #030303;
  }

  /* Icons */
  .tabs nav a:before {
    display: inline-block;
    vertical-align: middle;
    text-transform: none;
    font-weight: normal;
    font-variant: normal;
    font-family: 'icomoon';
    line-height: 1;
    speak: none;
    -webkit-font-smoothing: antialiased;
    margin: -0.25em 0.4em 0 0;
  }

  .icon-.footer { display:none; }
  #setting_panel_btn{display: none;}
  .page-wrapper{
    min-height: 807px;
    padding-bottom: 0px;
    padding-left: 0px;
    padding-right: 0px;
  
    }d:before {
      content: "\e600";
    }

    .icon-lab:before {
      content: "\e601";
    }

    .icon-cup:before {
      content: "\e602";
    }

    .icon-truck:before {
      content: "\e603";
    }

    .icon-shop:before {
      content: "\e604";
    }

    /* Content */
    .content section {
      font-size: 1.25em;
      padding: 2em 0em;
      display: none;
      max-width: 1230px;
      margin: 0 auto;
    }

    .content section:before,
    .content section:after {
      content: '';
      display: table;
    }

    .content section:after {
      clear: both;
    }

    /* Fallback example */
    .no-js .content section {
      display: block;
      padding-bottom: 2em;
      border-bottom: 1px solid #ffffff;
    }

    .content section.content-current {
      display: contents;
    }

    .mediabox {
      float: left;
      width: 33%;
      padding: 0 25px;
    }

    .mediabox img {
      max-width: 100%;
      display: block;
      margin: 0 auto;
    }

    .mediabox h3 {
      margin: 0.75em 0 0.5em;
    }

    .mediabox p {
      padding: 0 0 1em 0;
      margin: 0;
      line-height: 1.3;
    }

    /* Example media queries */

    @media screen and (max-width: 52.375em) {
      .tabs nav a span {
        display: none;
      }

      .tabs nav a:before {
        margin-right: 0;
      }

      .mediabox {
        float: none;
        width: auto;
        padding: 0 0 35px 0;
        font-size: 90%;
      }

      .mediabox img {
        float: left;
        margin: 0 25px 10px 0;
        max-width: 40%;
      }

      .mediabox h3 {
        margin-top: 0;
      }

      .mediabox p {
        margin-left: 40%;
        margin-left: calc(40% + 25px);
      }

      .mediabox:before,
      .mediabox:after {
        content: '';
        display: table;
      }

      .mediabox:after {
        clear: both;
      }
    }

    @media screen and (max-width: 32em) {
      .tabs nav ul,
      .tabs nav ul li a {
        width: 100%;
        padding: 0;
      }

      .tabs nav ul li {
        width: 20%;
        width: calc(20% + 1px);
        margin: 0 0 0 -1px;
      }

      .tabs nav ul li:last-child {
        border-right: none;
      }

      .mediabox {
        text-align: center;
      }

      .mediabox img {
        float: none;
        margin: 0 auto;
        max-width: 100%;
      }

      .mediabox h3 {
        margin: 1.25em 0 1em;
      }

      .mediabox p {
        margin: 0;
      }
    }
    @media screen and (max-width: 513px){

      #pos {

    margin-top: 100px;
}
      .payment{
    font-size: 10px;
    padding-left: 0px;
    padding-right: 0px;
    height: 52px;
    font-size: 16px;
    padding-bottom: 32px;
      }
      
      .navigation1.active {
    opacity: 1;
    visibility: visible;
    -webkit-transition-delay: 0s;
    transition-delay: 0s;
}

#scroll_div1{
padding-top: 61px;
 overflow: auto;
 overflow-x:hidden!important;
}




.content section {
    font-size: 1.25em;
    padding: 0em; 
    display: none;
    max-width: 1230px;
    margin: 0 auto;
}

.navigation1 {
    position: fixed;
    width: 260px;
    height: 335px;
    top: 365px;
    overflow-y: auto;
    overflow-x: hidden;
    opacity: 0;
    visibility: hidden;
    z-index: 99;
    -webkit-transition-delay: 300ms;
    transition-delay: 300ms;
    /* left: 0; */
    right: 52px;
}
      .iderror{
        width: 300px;
      }
      .navigation__inner {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 55px;
        left: 0;
        overflow: hidden;
        overflow-y: scroll;
        z-index: 999999;
        -webkit-transform: translate(-100%, 0);
        transform: translate(100%, 0);
        -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
        transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
        transition: transform 300ms linear, background-color 0s linear 300ms;
        transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
      }
      .claseproducto{
        /*border: 1px solid #6988a5;*/
        font-family: sans-serif;
        line-height: 1.4;
        overflow: hidden;
        text-overflow: ellipsis;
        height: 50px;
        /*width: 50%;*/
        margin: auto;
      }
      .page-wrapper{
        min-height: 634px;
        padding-bottom: 0px;
        padding-left: 0px;
        padding-right: 0px;
      }
      .navbar-fixed-top1 {
        top: 55px;
        border-width: 0 0 1px; 
      }
      .navbar-fixed-top1 {
        background: #cf8909;
        position: fixed;
        right: 0;
        left:0px;
        top: 0px;
        z-index: 1030;    
      } 
      .slide-nav-toggle .navbar-fixed-top1 {
        background: #cf8909;
        position: fixed;
        right: 0;
        left:223px;
        top: 66px;
        z-index: 1030;    
      } 
      .flotante{
        position: fixed; 
        bottom: 0;
        left: 0px;
        right: 0;
        margin-left: 0px;
        margin-right: 0px;
        height: 40px;
        z-index: 1030; 
      }

      .slide-nav-toggle .flotante{
        position: fixed; 
        bottom: 0;
        left: 223px;
        right: 0;
        margin-left: 0px;
        margin-right: 0px;
        height: 40px;
        z-index: 1030; 
      }

      #pos{
        width: 100%;
      }
      #identrega{
        width: 100%;
      }
      #tipoentregad{
        width: 100%;
      }

      #btndetalle{
        font-family: sans-serif;  
        font-size: 1.3rem;  
        line-height: 0px;
        overflow: hidden;  
        text-overflow: ellipsis;  
        /*white-space: nowrap;  width: 70%; */
        padding-left: 0px; padding-right: 0px;  
        margin-right: 0px;
      }
      .spandetalle{
        font-family: sans-serif;
        font-size: 9px;
        line-height: 1.4;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: initial;
        /*width: 50%;*/
      }
      * span{
        font-size: 9px;
      }
      .divletra{
        font-size: 9px;
      }
    }


    @media screen and (min-width: 513px) and (max-width: 770px){
      #pos{
    margin-top: 100px;

      }
     .claseproducto{
      /*border: 1px solid #6988a5;*/
      font-family: sans-serif;
      line-height: 1.4;
      overflow: hidden;
      text-overflow: ellipsis;
      height: 50px;
      /*width: 50%;*/
      margin: auto;
    }
    .page-wrapper{
      min-height: 630px;
      padding-bottom: 0px;
      padding-left: 0px;
      padding-right: 0px;
    }
    .navbar-fixed-top1 {
      top: 55px;
      border-width: 0 0 1px; 
    }
    .navbar-fixed-top1 {
      background: #cf8909;
      position: fixed;
      right: 0;
      left:0px;
      top: 0px;
      z-index: 1030;    
    } 
    .slide-nav-toggle .navbar-fixed-top1 {
      background: #cf8909;
      position: fixed;
      right: 0;
      left:223px;
      top: 66px;
      z-index: 1030;    
    } 
    .flotante{
      position: fixed; 
      bottom: 0;
      left: 0px;
      right: 0;
      margin-left: 0px;
      margin-right: 0px;
      height: 40px;
      z-index: 1030; 
    }

    .slide-nav-toggle .flotante{
      position: fixed; 
      bottom: 0;
      left: 223px;
      right: 0;
      margin-left: 0px;
      margin-right: 0px;
      height: 40px;
      z-index: 1030; 
    }
    #btndetalle{
      font-family: sans-serif;  
      font-size: 1.3rem;  
      line-height: 0px;
      overflow: hidden;  
      text-overflow: ellipsis;  
      /*white-space: nowrap;  width: 70%; */
      padding-left: 0px; padding-right: 0px;  
      margin-right: 0px;
    }
    .spandetalle{
      font-family: sans-serif;
      font-size: 9px;
      line-height: 1.4;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: initial;
      /*width: 50%;*/
    }
    #pos{
      width: 100%;
    }
    #identrega{
      width: 100%;
    }
    #tipoentregad{
      width: 100%;
    }
    .navigation__inner {
      position: absolute;
      width: 100%;
      height: 100%;
      top: 55px;
      left: 0;
      overflow: hidden;
      overflow-y: scroll;
      z-index: 999999;
      -webkit-transform: translate(-100%, 0);
      transform: translate(100%, 0);
      -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
      transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
      transition: transform 300ms linear, background-color 0s linear 300ms;
      transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
    }
  }
  @media screen and (min-width: 770px) and (max-width: 1024px){
   .claseproducto{
    /*border: 1px solid #6988a5;*/
    font-family: sans-serif;
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 50px;
    /*width: 50%;*/
    margin: auto;
  }
  .page-wrapper{
    min-height: 562px;
    padding-bottom: 0px;
    padding-left: 0px;
    padding-right: 0px;
  }
  .navbar-fixed-top1 {
    top: 55px;
    border-width: 0 0 1px; 
  }
  .navbar-fixed-top1 {
    background: #cf8909;
    position: fixed;
    right: 0;
    left:0px;
    top: 66px;
    z-index: 1030;    
  } 
  .slide-nav-toggle .navbar-fixed-top1 {
    background: #cf8909;
    position: fixed;
    right: 0;
    left:223px;
    top: 66px;
    z-index: 1030;    
  } 
  .flotante{
    position: fixed; 
    bottom: 0;
    left: 0px;
    right: 0;
    margin-left: 0px;
    margin-right: 0px;
    height: 40px;
    z-index: 1030; 
  }

  .slide-nav-toggle .flotante{
    position: fixed; 
    bottom: 0;
    left: 223px;
    right: 0;
    margin-left: 0px;
    margin-right: 0px;
    height: 40px;
    z-index: 1030; 
  }
  #btndetalle{
    font-family: sans-serif;  
    font-size: 1.3rem;  
    line-height: 0px;
    overflow: hidden;  
    text-overflow: ellipsis;  
    /*white-space: nowrap;  width: 70%; */
    padding-left: 0px; padding-right: 0px;  
    margin-right: 0px;
  }
  .spandetalle{
    font-family: sans-serif;
    font-size: 9px;
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: initial;
    /*width: 50%;*/
  }
  .navigation__inner {
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0px;
    left: 0;
    overflow: hidden;
    overflow-y: scroll;
    z-index: 999999;
    -webkit-transform: translate(-100%, 0);
    transform: translate(100%, 0);
    -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
    transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
    transition: transform 300ms linear, background-color 0s linear 300ms;
    transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
  }
}
@media screen and (min-width: 1025px) and (max-width: 1400px){
 .claseproducto{
  /*border: 1px solid #6988a5;*/
  font-family: sans-serif;
  line-height: 1.4;
  overflow: hidden;
  text-overflow: ellipsis;
  height: 50px;
  /*width: 50%;*/
  margin: auto;
}
.page-wrapper{
  min-height: 562px;
  padding-bottom: 0px;
  padding-left: 0px;
  padding-right: 0px;
}
.navbar-fixed-top1 {
  top: 55px;
  border-width: 0 0 1px; 
}
.navbar-fixed-top1 {
  background: #cf8909;
  position: fixed;
  right: 0;
  left:43px;
  top: 66px;
  z-index: 1030;    
} 
.slide-nav-toggle .navbar-fixed-top1 {
  background: #cf8909;
  position: fixed;
  right: 0;
  left:223px;
  top: 66px;
  z-index: 1030;    
} 
.flotante{
  position: fixed; 
  bottom: 0;
  left: 43px;
  right: 0;
  margin-left: 0px;
  margin-right: 0px;
  height: 40px;
  z-index: 1030; 
}

.slide-nav-toggle .flotante{
  position: fixed; 
  bottom: 0;
  left: 223px;
  right: 0;
  margin-left: 0px;
  margin-right: 0px;
  height: 40px;
  z-index: 1030; 
}
.navigation__inner {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0px;
  left: 0;
  overflow: hidden;
  overflow-y: scroll;
  z-index: 999999;
  -webkit-transform: translate(-100%, 0);
  transform: translate(100%, 0);
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: transform 300ms linear, background-color 0s linear 300ms;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
}
}
@media screen and (min-width: 1401px) and (max-width: 1536px){
 .navigation__inner {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0px;
  left: 0;
  overflow: hidden;
  overflow-y: auto;
  /* display: list-item; */
  z-index: 999999;
  -webkit-transform: translate(-100%, 0);
  transform: translate(100%, 0);
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: transform 300ms linear, background-color 0s linear 300ms;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
}
}
@media screen and (min-width: 1537px){
 .navigation__inner {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0px;
  left: 0;
  overflow: hidden;
  overflow-y: auto;
  /* display: list-item; */
  z-index: 999999;
  -webkit-transform: translate(-100%, 0);
  transform: translate(100%, 0);
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: transform 300ms linear, background-color 0s linear 300ms;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
}
}
@media screen and (min-width: 1025px) and (max-width: 2000px){

  #navegadorflotante{
    display: none;
  }



  #section-2{
    width: 50%;
    float: right;
  }
  .claseproducto{
    /*border: 1px solid #6988a5;*/
    font-family: sans-serif;
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    height: 50px;
    /*width: 50%;*/
    margin: auto;
  }

  .navbar-fixed-top1 {
    top: 55px;
    border-width: 0 0 1px; 
  }
  .navbar-fixed-top1 {
    left: 223px;
    background: #cf8909;
    position: fixed;
    right: 0;
    top: 66px;
    z-index: 1030;
    
  }
  .slide-nav-toggle .navbar-fixed-top1 {
    background: #cf8909;
    position: fixed;
    right: 0;
    left:43px;
    top: 66px;
    z-index: 1030;    
  }

  .flotante{
    position: fixed;
    bottom: -4px;
    left: 0px;
    right: 0;
    margin-left: 0px;
    margin-right: 0px;
    height: 40px;
    z-index: 1030;
  }
  #pos{
    width: 100%;
  }
  .slide-nav-toggle .flotante{
    position: fixed; 
    bottom: 0;
    left: 44px;
    right: 0;
    margin-left: 0px;
    margin-right: 0px;
    height: 40px;
    z-index: 1030; 
  }
  /*.wrapper.theme-1-active .fixed-sidebar-left, .wrapper.theme-3-active .fixed-sidebar-left, .wrapper.theme-6-active .fixed-sidebar-left*/
  .wrapper.slide-nav-toggle.sidebar-hover .flotante{
    position: fixed; 
    bottom: 0;
    left: 44px;
    right: 0;
    margin-left: 0px;
    margin-right: 0px;
    height: 40px;
    z-index: 1030;  
  }
  #btndetalle{
    font-family: sans-serif;  
    font-size: 12px;  
    line-height: 1.4; 
    overflow: hidden;  
    text-overflow: ellipsis;  
    /*white-space: nowrap;  width: 70%; */
    padding-left: 0px; padding-right: 0px;  
    margin-right: 0px;
  }
  .spandetalle{
    font-family: sans-serif;
    font-size: 12px;
    line-height: 1.4;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: initial;
    /*width: 50%;*/
  }
  #navegadorflotante{
    height: 50px;
  }
  #scroll_div1 {
    padding-top: 28px;
    height: 630px;
    overflow: auto;
    overflow-x: hidden!important;
  }

  div #identrega{
    width: 100%;
  }

  .telefonoclass{
    width: 50%;
    float: left;
    padding-right: 10px;
  }
  .nombreclass{
    width: 50%;
    float: left;
    padding-left: 10px;

  }
  .direccionclass{
    width: 50%;
    float: left;
    padding-right: 10px;
  }
  .dniclass{
    width: 50%;
    float: left;
    padding-left: 10px;

  }
  .direccionclass, .telefonoclass, .nombreclass, .dniclass{
   margin-bottom: 5px;
 }
 .navigation__inner {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0px;
  left: 0;
  overflow: hidden;
  overflow-y: auto;
  /* display: list-item; */
  z-index: 999999;
  -webkit-transform: translate(-100%, 0);
  transform: translate(100%, 0);
  -webkit-transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: background-color 0s linear 300ms, -webkit-transform 300ms linear;
  transition: transform 300ms linear, background-color 0s linear 300ms;
  transition: transform 300ms linear, background-color 0s linear 300ms, -webkit-transform 300ms linear;
}

}
@media screen and (min-width: 1200px){

/*   .navbar-fixed-top1 {
      top: 55px;
      border-width: 0 0 1px; 
    }
    .navbar-fixed-top1 {
        background: #cf8909;
    position: fixed;
    right: 0;
    top: 66px;
    z-index: 1030;
    }*/
  }
  
.rounded-circle {
  border-radius: 50%!important;
}
img {
  vertical-align: middle;
  border-style: none;
}
div.scrollmen {
  background-color: #4b5668;
  overflow: auto;
  white-space: nowrap;
}

div.scrollmen a {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px;
  text-decoration: none;
}

div.scrollmen a:hover {
  background-color: #777;
}
.modal-dialog.cascading-modal.modal-avatar .modal-header img {
  width: 200px;
  height: 200px;
  -webkit-box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  margin-left: auto;
  margin-right: auto; }

  .pos #pos {
   padding: 0px; 
 }
 .pos .contents {
  padding: 0px 0px 0px 0;
  padding-left: 10px;
  position: relative;
  min-height: 440px;
  overflow: hidden;
}
.sg-phone--header {

}
#wrapper {
  overflow-x:auto;
  position: absolute;
  z-index: 1;
  top: 45px;
  bottom: 40px;
  left: 0;
  width: 100%;
  height: 75px;
  background-color: #f0f1f2;

  /* remove overflow for accesibility */
  overflow: hidden;
}
.surface {
  position: absolute;
  height: 100%;
  -webkit-transform-origin: center center;
  transform-origin: center center;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  -webkit-transform-style: flat;
  transform-style: flat;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  -webkit-tap-highlight-color: transparent;
  pointer-events: auto;
}

.mam {
  position: relative;
  white-space: normal;
  width: 300px;
  height: -webkit-calc(100% - 30px);
  height: -moz-calc(100% - 30px);
  height: -ms-calc(100% - 30px);
  height: calc(100% - 30px);
  display: inline-block;
}

footer.mbm {
  position: absolute;
  bottom: 0;
  width: 100%;
}

#scroller {
  position: absolute;
  white-space: nowrap;
  z-index: 1;
  -webkit-tap-highlight-color: rgba(0,0,0,0);
  height: 100%;
  -webkit-transform: translateZ(0);
  -moz-transform: translateZ(0);
  -ms-transform: translateZ(0);
  -o-transform: translateZ(0);
  transform: translateZ(0);
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  -webkit-text-size-adjust: none;
  -moz-text-size-adjust: none;
  -ms-text-size-adjust: none;
  -o-text-size-adjust: none;
  text-size-adjust: none;
}

.footer {
  width: 100%;
  height: 40px;
  position: absolute;
  bottom: 0;
  background-color: #293f54;
}

.pullToRefresh {
  -webkit-transform : translate3d(0,0,0);
  -moz-transform    : translate3d(0,0,0);
  -ms-transform     : translate3d(0,0,0);
  transform         : translate3d(0,0,0);
  position: absolute;
  width: 100%;
  height: 50px;
  top: -50px;
  text-align: center;
  line-height: 50px;
}
.pullToLoadMore {
  -webkit-transform: translate3d(0, 0, 0);
  -moz-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  height: 50px;
  text-align: center;
  line-height: 50px;
}

.pullToRefresh > .icon, .pullToLoadMore > .icon {
  -webkit-transition : -webkit-transform 300ms;
  -moz-transition    : -moz-transform 300ms;
  -ms-transition     : -ms-transform 300ms;
  transition         : transform 300ms;

  -webkit-transform : translate3d(0,0,0);
  -moz-transform    : translate3d(0,0,0);
  -ms-transform     : translate3d(0,0,0);
  transform         : translate3d(0,0,0);
  padding: 0 5px;
}
.pullToRefresh > .icon.trigger, .pullToLoadMore > .icon.trigger {
  -webkit-transform : translate3d(0,0,0) rotate(180deg);
  -moz-transform    : translate3d(0,0,0) rotate(180deg);
  -ms-transform     : translate3d(0,0,0) rotate(180deg);
  transform         : translate3d(0,0,0) rotate(180deg);
}

.pullToRefresh > .icon.loading, .pullToLoadMore > .icon.loading {
  -webkit-animation : spin .6s linear infinite;
  -moz-animation    : spin .6s linear infinite;
  -ms-animation     : spin .6s linear infinite;
  animation         : spin .6s linear infinite;
}

@-webkit-keyframes spin { from { -webkit-transform: rotate(180deg); } to { -webkit-transform: rotate(540deg); } }
@-moz-keyframes spin    { from { -moz-transform: rotate(180deg); }    to { -moz-transform: rotate(540deg); } }
@-ms-keyframes spin     { from { -ms-transform: rotate(180deg); }     to { -ms-transform: rotate(540deg); } }
@keyframes spin         { from { transform: rotate(180deg); }         to { transform: rotate(540deg); } }

.table > tbody > tr > td{
  padding: 3px !important;
}

#descripcion {
  display: block;
  width: 100%;
  border: 1px solid #b6b8bb;
  padding: 0 5px;
  overflow: hidden;
  height: 60px;
  border-radius: 10px;
  -webkit-border-radius: 10px;
  color: #435584;
}
#body-producto-desc-cantidad {
  margin-top: 15px;
  width: 100%;
  height: 50px;
  position: relative;
  display: block;
}
#body-producto-desc-cantidad > input {
  border-radius: 5px;
  -webkit-border-radius: 5px;
  border: 1px solid #aaa;
  font-family: Arial, "MS Trebuchet", sans-serif;
  font-size: 17px;
  width: 100px;
  position: absolute;
  top: 0;
  left: 80px;
  padding: 0 5px;
  text-align: right;
}

#body-producto-desc-cantidad > label {
  text-shadow: 15px;
  color: #555;
  font-weight: 700;
  position: absolute;
  top: 6px;
  left: 0;
}


.scroll::-webkit-scrollbar {
  width: 10px;
}

.scroll::-webkit-scrollbar-track {
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
  border-radius: 5px;
}

.scroll::-webkit-scrollbar-thumb {
  border-radius: 5px;
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5); 
}

#cuerpo::-webkit-scrollbar-track
{
  -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
  background-color: #F5F5F5;
  opacity: 0.5;
}

#cuerpo::-webkit-scrollbar
{
  width: 6px;
  background-color: #F5F5F5;
  opacity: 0.5;
}

#cuerpo::-webkit-scrollbar-thumb
{
  background-color: #000000;
  opacity: 0.5;
}
@media screen and (min-width: 1401px) and (max-width: 1536px){
  .page-wrapper{
    min-height: 720px;
    padding-bottom: 0px;
    padding-left: 0px;
    padding-right: 0px;
  }
}  
@media screen and (min-width: 1537px) and (max-width: 1706px){
  .page-wrapper{
    min-height: 800px;
    padding-bottom: 0px;
    padding-left: 0px;
    padding-right: 0px;
  }
} 
@media screen and (min-width: 1707px) and (max-width: 1920px){
  .page-wrapper{
    min-height: 907px;
    padding-bottom: 0px;
    padding-left: 0px;
    padding-right: 0px;
  }
}  
</style>
