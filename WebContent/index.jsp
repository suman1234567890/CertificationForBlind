<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Certificate for Blinds</title>
    <meta name="keywords" content="Snakes" />
    <meta name="description" content="A project of TGMC" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    
    <link href="css/styles.css" rel="stylesheet" type="text/css" />
    <link href="css/colorbox.css" rel="stylesheet" />
    
    <link href="css/templatemo_style1.css" rel="stylesheet" type="text/css" />
    <link href="images/icon.ico" rel="icon" type="image/x-icon" />
    <link href="css/pascal/pascal.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="css/nivo-slider.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="css/slide.css" rel="stylesheet" type="text/css" media="screen" />
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
    
    
	 
	    <script src="js/jquery.colorbox.js" type="text/javascript"></script>
    <script src="js/slide.js" type="text/javascript"></script>
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="scripts/gettheme.js"></script>
    
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxwindow.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxvalidator.js"></script> 
     
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script> 
    <script type="text/javascript" src="jqwidgets/jqxexpander.js"></script> 
    <script type="text/javascript" src="jqwidgets/globalization/jquery.global.js"></script> 
    <script type="text/javascript" src="jqwidgets/jqxcalendar.js"></script> 
    <script type="text/javascript" src="jqwidgets/jqxdatetimeinput.js"></script> 
    <script type="text/javascript" src="jqwidgets/jqxmaskedinput.js"></script>
    <script type="text/javascript">

        function clearText(field) {

            if (field.defaultValue == field.value) field.value = '';

            else if (field.value == '') field.value = field.defaultValue;

        }
    </script>

    <script type="text/javascript">
    var theme='classic';
    function capitaliseFirstLetter(string) {
        return string.charAt(0).toUpperCase() + string.slice(1);
    }
    function displayEvent(event) {
        var eventData = 'Event: ' + capitaliseFirstLetter(event.type);
        if (event.type === 'moved') {
            eventData += ', X: ' + event.args.x + ', Y: ' + event.args.y;
        }
        if (event.type === 'hide') {
            eventData += ', Dialog result: ';
            if (event.args.dialogResult.OK) {
                eventData += 'OK';
            } else if (event.args.dialogResult.Cancel) {
                eventData += 'Cancel';
            } else {
                eventData += 'None';
            }
        }
        $('#events').jqxPanel('prepend', '<div style="margin-top: 5px;">' + eventData + '</div>');
        $('#events').jqxPanel('value', 1000);
    }
    function addEventListeners() {
        //Closed event
        $('#eventWindow').bind('hide', function (event) {
            displayEvent(event);
        });
        //Dragstarted event
        $('#eventWindow').bind('moved', function (event) {
            displayEvent(event);
        });
        //Open event
        $('#eventWindow').bind('show', function (event) {
            displayEvent(event);
        });
        $('#showWindowButton').mousedown(function () {
            $('#eventWindow').jqxWindow('show');
        });
    }
    function createElements(theme) {
       
        $('#eventWindow').jqxWindow({ maxHeight: 550, maxWidth: 310, minHeight: 450, minWidth: 310, height: 450, width: 310,
            theme: theme, resizable: false, isModal: true, modalOpacity: 0.3,
            okButton: $('#ok'), cancelButton: $('#cancel')
        });
        $('#events').jqxPanel({ theme: theme, height: '250px', width: '450px' });
        $('#showWindowButton').jqxButton({ theme: theme, width: '100px', height: '25px' });
        
    }
        $(document).ready(function () {
            //Examples of how to assign the ColorBox event to elements
            $(".group1").colorbox({ rel: 'group1' });
            $(".group2").colorbox({ rel: 'group2', transition: "fade" });
            $(".group3").colorbox({ rel: 'group3', transition: "none", width: "75%", height: "75%" });
            $(".group4").colorbox({ rel: 'group4', slideshow: true });
            $(".ajax").colorbox();
            $(".youtube").colorbox({ iframe: true, innerWidth: 425, innerHeight: 344 });
            $(".iframe").colorbox({ iframe: true, width: "80%", height: "80%" });
            $(".inline").colorbox({ inline: true, width: "50%" });
            $(".callbacks").colorbox({
                onOpen: function () { alert('onOpen: colorbox is about to open'); },
                onLoad: function () { alert('onLoad: colorbox has started to load the targeted content'); },
                onComplete: function () { alert('onComplete: colorbox has displayed the loaded content'); },
                onCleanup: function () { alert('onCleanup: colorbox has begun the close process'); },
                onClosed: function () { alert('onClosed: colorbox has completely closed'); }
            });

            //Example of preserving a JavaScript event for inline calls.
            $("#click").click(function () {
                $('#click').css({ "background-color": "#f00", "color": "#fff", "cursor": "inherit" }).text("Open this window again and this message will still be here.");
                return false;
            });
            var theme='classic';
            addEventListeners();
            createElements(theme);
            //$("#jqxWidget").css('visibility', 'visible');
            var theme = 'classic';
            //$('#sendButton').jqxButton({ width: 60, height: 25, theme: theme });
            $('#acceptInput').jqxCheckBox({ width: 130, theme: theme });
            $('#sendButton').bind('click', function () {
                $('#testForm').jqxValidator('validate');
            });
            $("#ssnInput").jqxMaskedInput({ mask: '###-##-####', height: 22, theme: theme });
            $("#phoneInput").jqxMaskedInput({ mask: '(###)###-####', height: 22, theme: theme });
            $("#zipInput").jqxMaskedInput({ mask: '###-##-####', height: 22, theme: theme });
            $('.text-input').addClass('jqx-input');
            if (theme.length > 0) {
                $('.text-input').addClass('jqx-input-' + theme);
            }
            var date = new Date();
            date.setFullYear(2012, 0, 1);
            $('#birthInput').jqxDateTimeInput({ theme: theme, height: 22, value: $.jqx._jqxDateTimeInput.getDateTime(date) });
            $("#register").jqxExpander({ width: '300px', theme: theme, showArrow: false, toggleMode: 'none' });
            // initialize validator.
            $('#testForm').jqxValidator({
             rules: [
                    { input: '#userInput', message: 'Username is required!', action: 'keyup, blur', rule: 'required' },
                    { input: '#userInput', message: 'Your username must be between 3 and 12 characters!', action: 'keyup', rule: 'length=3,12' },
                    { input: '#realNameInput', message: 'Your real name must contain only letters!', action: 'keyup', rule: 'notNumber' },
                    { input: '#realNameInput', message: 'Your real name must be between 3 and 12 characters!', action: 'keyup', rule: 'length=3,12' },
                    { input: '#birthInput', message: 'Your birth date must be between 1/1/1900 and 1/1/2012.', action: 'valuechanged', rule: function () {
                        var date = $('#birthInput').jqxDateTimeInput('value');
                        var result = date.dateTime.getFullYear() >= 1900 && date.dateTime.getFullYear() <= 2012;
                        return result;
                    }
                    },
                    { input: '#passwordInput', message: 'Password is required!', action: 'keyup', rule: 'required' },
                    { input: '#passwordInput', message: 'Your password must be between 4 and 12 characters!', action: 'keyup', rule: 'length=4,12' },
                    { input: '#passwordConfirmInput', message: 'Password is required!', action: 'keyup', rule: 'required' },
                    { input: '#passwordConfirmInput', message: 'Passwords doesn\'t match!', action: 'keyup, focus', rule: function (input) {
                        if (input.val() === $('#passwordInput').val()) {
                            return true;
                        }
                        return false;
                    }
                    },
                    { input: '#emailInput', message: 'E-mail is required!', action: 'keyup', rule: 'required' },
                    { input: '#emailInput', message: 'Invalid e-mail!', action: 'keyup', rule: 'email' },
                    { input: '#ssnInput', message: 'Invalid SSN!', action: 'valuechanged, blur', rule: 'ssn' },
                    { input: '#phoneInput', message: 'Invalid phone number!', action: 'valuechanged, blur', rule: 'phone' },
                    { input: '#zipInput', message: 'Invalid zip code!', action: 'valuechanged, blur', rule: 'zipCode' },
                    { input: '#acceptInput', message: 'You have to accept the terms', action: 'change', rule: 'required', position: 'right:0,0'}], theme: theme
            });
            
        });
    </script>
    <script type="text/javascript" src="js/jquery.bgpos.js"></script>
    <script type="text/javascript">

        $(function () {
            $('#a a')
		.css({ backgroundPosition: "-20px 35px" })
		.mouseover(function () {
		    $(this).stop().animate({ backgroundPosition: "(-20px 94px)" }, { duration: 500 })
		})
		.mouseout(function () {
		    $(this).stop().animate({ backgroundPosition: "(40px 35px)" }, { duration: 200, complete: function () {
		        $(this).css({ backgroundPosition: "-20px 35px" })
		    }
		    })
		})
            $('#b a')
		.css({ backgroundPosition: "0 0" })
		.mouseover(function () {
		    $(this).stop().animate({ backgroundPosition: "(-150px 0)" }, { duration: 500 })
		})
		.mouseout(function () {
		    $(this).stop().animate({ backgroundPosition: "(-300px 0)" }, { duration: 200, complete: function () {
		        $(this).css({ backgroundPosition: "0 0" })
		    }
		    })
		})
            $('#c a')
		.css({ backgroundPosition: "0 0" })
		.mouseover(function () {
		    $(this).stop().animate({ backgroundPosition: "(0 -250px)" }, { duration: 500 })
		})
		.mouseout(function () {
		    $(this).stop().animate({ backgroundPosition: "(0 0)" }, { duration: 500 })
		})
            $('#d a')
		.css({ backgroundPosition: "0 0" })
		.mouseover(function () {
		    $(this).stop().animate({ backgroundPosition: "(0 -250px)" }, { duration: 500 })
		})
		.mouseout(function () {
		    $(this).stop().animate({ backgroundPosition: "(0 0)" }, { duration: 500 })
		})
        });
        
        
    </script>
        
    <style type="text/css">
        .text-input
        {
            height: 18px;
            width: 150px;
            z-index: 2000;
        }
        .text-input:focus
        {
            border: 1px solid #777;
        }
        .register-table
        {
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .register-table td, tr
        {
            margin: 0px;
            padding: 2px;
            border-spacing: 0px;
            border-collapse: collapse;
            color: #000;
            font-family: Verdana;
            font-size: 12px;
        }
        h3 
        {
            display: inline-block;
            margin: 0px;
        }
    </style>
    <script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
    <script type="text/javascript">
    jQuery(window).load(function(){
        jQuery("#nivoslider-373").nivoSlider({
            effect:"sliceUpDown",
            slices:8,
            boxCols:8,
            boxRows:4,
            animSpeed:1000,
            pauseTime:3000,
            startSlide:0,
            directionNav:true,
            directionNavHide:true,
            controlNav:true,
            controlNavThumbs:false,
            controlNavThumbsFromRel:true,
        
        });
    });

    </script>
</head>
<body>
	<div style="visibility: hidden;height: 0px;position:absolute; z-index: 2000;" id="jqxWidget" >
        
        <div style="width: 100%; height: 650px; border: 0px solid #ccc; margin-top: 10px;"
            id="mainDemoContainer">
            
            
            <div id="eventWindow">
                <div>
                    <img width="14" height="14" src="../../images/help.png" alt="" />
                    Modal Window</div>
                <div>
                    <div>
                       <!--  Starting of FORM -->
                        <div id="register">
					        <div><h3>Register</h3></div>
					        <div>
					            <form id="testForm" action="./">
					                <table class="register-table">
					                    <tr>
					                        <td>Username:</td>
					                        <td><input type="text" id="userInput" class="text-input" /></td>
					                    </tr>
					                    <tr>
					                        <td>Password:</td>
					                        <td><input type="password" id="passwordInput" class="text-input" /></td>
					                    </tr>
					                    <tr>
					                        <td>Confirm password:</td>
					                        <td><input type="password" id="passwordConfirmInput" class="text-input" /></td>
					                    </tr>
					                    <tr>
					                        <td>Real name:</td>
					                        <td><input type="text" id="realNameInput" class="text-input" /></td>
					                    </tr>
					                    <tr>
					                        <td>Birth date:</td>
					                        <td><div id="birthInput"></div></td>
					                    </tr>
					                    <tr>
					                        <td>E-mail:</td>
					                        <td><input type="text" id="emailInput" class="text-input" /></td>
					                    </tr>
					                    <tr>
					                        <td>SSN:</td>
					                        <td><div id="ssnInput"></div></td>
					                    </tr>
					                    <tr>
					                        <td>Phone:</td>
					                        <td><div id="phoneInput"></div></td>
					                    </tr>
					                    <tr>
					                        <td>Zip code:</td>
					                        <td><div id="zipInput"></div></td>
					                    </tr>
					                    <tr>
					                        <td colspan="2" style="padding: 5px;"><div id="acceptInput" style="margin-left: 50px;">I accept terms</div></td>
					                    </tr>
					                    <tr>
					                        <td colspan="1" style="text-align: center;"><input type="button" value="Send" id="ok" /></td>
					                        <td colspan="1" style="text-align: center;"><input type="button" value="Cancel" id="cancel" /></td>
					                    </tr>
					                    
					                </table>
					            </form>
					        </div>
   						 </div>
                       <!--  Endding of FORM -->
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Login -->
    <div id="toppanel">
        <div id="panel">
            <div class="content clearfix">
                <div class="left">
                    <h1>
                        Welcome to Certificate for Blind</h1>
                    <h2>
                        Feel Free to register yourself</h2>
                    <p class="grey">
                        Certificate for Blind is a wonderful platform providing knowledge, help and support to blind and partially sighted people of all ages.
                        They can get certified from here.  We listen, we understand, we act.
                        </p>
                    
                </div>
                <div class="left">
                    <form class="clearfix" action="LoginAuth" method="post">
                    <h1 class="padlock">
                        Member Login</h1>
                    <label class="grey" for="log">
                        Username:</label>
                    <input class="field" type="text" name="log" id="log" value="" size="23" />
                    <label class="grey" for="pwd">
                        Password:</label>
                    <input class="field" type="password" name="pwd" id="pwd" size="23" />
                    <label>
                        <input name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" />
                        &nbsp;Remember me</label>
                    <div class="clear">
                    </div>
                    <input type="submit" name="submit" value="Login" class="bt_login" />
                    <a class="lost-pwd" href="#">Lost your password?</a>
                    </form>
                </div>
                <div class="left right">
                    <form action="SendMail" method="post">
                    <h1>
                        Not a member yet? Sign Up!</h1>
                    <label class="grey" for="signup">
                        Username:</label>
                    <input class="field" type="text" name="signup" id="signup" value="" size="23" />
                    <label class="grey" for="email">
                        Email:</label>
                    <input class="field" type="text" name="email" id="email" size="23" />
                    <label>
                        A password will be e-mailed to you.</label>
                    <input type="submit" name="submit" value="Register" id="showWindowButton" class="bt_register" />
                    </form>
                </div>
            </div>
        </div>
        <!-- /login -->
        <!-- The tab on top -->
        <div class="tab">
            <ul class="login">
                <li class="left">&nbsp</li>
                <li>Hello Guest!</li>
                <li id="toggle"><a id="open" class="open" href="#">Log In | Register</a> <a id="close"
                    style="display: none;" class="close" href="#">Close Panel</a> </li>
                <li class="right">&nbsp;</li>
            </ul>
        </div>
        <!-- / top -->
    </div>
    <!--panel -->
    <div id="templatemo_site_title_bar_wrapper">
        <div id="site_title">
       
        
            <img alt="The Great Mind Challenge" height="90px" width="300px" align="left" 
                src="images/tgmc%20logo.png"/>
            <h1>
                <br />
                <br />
                <a href="#" target="_parent">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Certificate for blinds
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;A project of The Great Mind Challenge : Devleoped by SNAKES</span></a>
            </h1>
        </div>
    </div>
    <!-- end of site title bar wrapper -->
    <div id="templatemo_banner_wrapper">
        <div id="templatemo_banner">
            <div id="wrapper">
                <a>&nbsp </a>
                <div class="slider-wrapper theme-pascal">
                    <div class="ribbon">
                    </div>
                    <div id="nivoslider-373" class="nivoSlider">
                        <img src="images/s1.jpg" alt="" />
                        <img src="images/s2.jpg" alt="" />
                        <img src="images/s3.jpg" alt="" title="#htmlcaption" />
                        <img src="images/s4.jpg" alt="" title="#htmlcaption" />
                        <img src="images/s5.jpg" alt="" title="#htmlcaption" />
                    </div>
                    <div id="nivoslider-373-caption-0" class="nivo-html-caption">
                        <strong>Alone we can do so little; together we can do so much.</strong>
                    </div>
                </div>
            </div>
            <script src="js/jquery.chili-2.2.js" type="text/javascript"></script>
            <script src="js/recipes.js" type="text/javascript"></script>
            <div class="cleaner">
            </div>
        </div>
    </div>
    <!-- end of templatemo_banner_wrapper -->
    <div id="templatemo_menu_wrapper">
        <div id="templatemo_menu">
            <ul id="a">
                <li><a href="Features.htm" class="iframe">Home</a></li>
                <li><a href="Features.htm" class="iframe">Exam</a></li>
                <li><a href="Features.htm" class="iframe">Advise</a></li>
                <li><a href="Features.htm" class="iframe">Forum</a></li>
                <li><a href="Features.htm" class="iframe">FAQ</a></li>
                <li><a href="Features.htm" class="iframe">Contact US</a></li>
            </ul>
        </div>
        <!-- end of menu -->
    </div>
    <!-- end of menu wrapper -->
    <div id="templatemo_content">
        <div id="main_column">
            <br />
            <br />
            <div class="cleaner">
            </div>
        </div>
        <!-- end of main column -->
        <div id="side_column">
            <br />
            <br />
        </div>
        <!-- end of side column -->
        <div class="cleaner">
        </div>
    </div>
    <!-- end of content -->
    <div id="templatemo_footer_wrapper">
        <div id="templatemo_footer">
            <ul class="footer_menu">
                <li><a href="#">Home</a></li>
                <li><a href="#">Snakes</a></li>
                <li><a href="#">Snakes</a></li>
                <li><a href="#">Snakes</a></li>
                <li><a href="#">Snakes</a></li>
            </ul>
        </div>
    </div>
    <!-- end of footer wrapper -->
    

</body>
</html>