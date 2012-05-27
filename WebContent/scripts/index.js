var theme = 'classic';
$(document).ready(function () {
	createElements(theme);
    $("#jqxWidget").css('visibility', 'visible');
});
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