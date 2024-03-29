<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	    <title>Welcome</title>
	    <link rel='Stylesheet' href="../../jqwidgets/styles/jqx.base.css" type="text/css" />
	    <link rel='Stylesheet' href="../../jqwidgets/styles/jqx.darkblue.css" type="text/css" />
	    <script type="text/javascript" src="../../scripts/jquery-1.7.1.min.js" ></script>
	    <script type="text/javascript" src="../../scripts/gettheme.js" ></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxcore.js" ></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxdata.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxmenu.js" ></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxbuttons.js" ></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxexpander.js" ></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxnavigationbar.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxscrollbar.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxlistbox.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxdropdownlist.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxgrid.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxgrid.pager.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxgrid.selection.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxwindow.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxpanel.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxtabs.js"></script>
	    <script type="text/javascript" src="../../jqwidgets/jqxcheckbox.js"></script>
	    <script type="text/javascript" src="../../scripts/MyScript.js"></script>
	    <script type="text/javascript">
	    <% HttpSession session1= request.getSession(); 
	    if(session1.getAttribute("userid")==null)
	    {
	    	//response.sendRedirect("../../index.jsp");
	    }
	    else{
	    	String userid=session1.getAttribute("userid").toString();%>
	    	
	        var userid=<%=userid%>;
	        
	        <%}%>
	        
	    </script>
	    <script type="text/javascript">
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
            $('#ok').jqxButton({ theme: theme, height: '25px', width: '65px' });
            $('#cancel').jqxButton({ theme: theme, height: '25px', width: '65px' });
            $('#eventWindow').jqxWindow({ maxHeight: 150, maxWidth: 280, minHeight: 30, minWidth: 250, height: 145, width: 270,
                theme: theme, resizable: false, isModal: true, modalOpacity: 0.3,
                okButton: $('#ok'), cancelButton: $('#cancel')
            });
            $('#events').jqxPanel({ theme: theme, height: '250px', width: '450px' });
            $('#showWindowButton').jqxButton({ theme: theme, width: '100px', height: '25px' });
        }
        $(document).ready(function () {
            var theme = $.data(document.body, 'theme', theme);
            if (theme == undefined) theme = '';
            addEventListeners();
            createElements(theme);
            $("#jqxWidget").css('visibility', 'visible');
        });
    </script>
	</head>

	<body>
	    <div style="visibility: hidden;" id="jqxWidget">
        <input type="button" value="Show" id="showWindowButton" />
        <div style="width: 100%; height: 650px; border: 0px solid #ccc; margin-top: 10px;"
            id="mainDemoContainer">
            <div>Events Log:</div>
            <div id="events" style="width: 300px; height: 200px; border-width: 0px;">
            </div>
            <div id="eventWindow">
                <div>
                    <img width="14" height="14" src="../../images/help.png" alt="" />
                    Modal Window</div>
                <div>
                    <div>
                        Please click "OK", "Cancel" or the close button to close the modal window. The dialog
                        result will be displayed in the events log.
                    </div>
                    <div>
                    <div style="float: right; margin-top: 15px;">
                        <input type="button" id="ok" value="OK" style="margin-right: 10px" />
                        <input type="button" id="cancel" value="Cancel" />
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</body>
</html>