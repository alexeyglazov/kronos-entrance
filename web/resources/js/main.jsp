var dataChanged = false;

var projectCodeForm;
var projectCodesList;
var timeSheet;
var ownTimeReport;
var timeSheetReport;
var generalDirectorReport;
var codeDetailReport;
var globalManagement;
var countryManagement;
var notificationManagement;
var crm;
var hr;
var rightsManager;
var monthCloser;
var employeeManager;
var employeeSalaryManager;
var budgetManager;
var areaLoginForm;

var blockUITimer = null;
$(function() {
    normalizeContentSize();
    $(window).resize(normalizeContentSize);
    $(window).bind("beforeunload", checkDataChanged);
    if(initializer != null) {
        initializer.call();
    }
    $(document).ajaxStart(function() {
        blockUI();
    });
    $(document).ajaxStop(function() {
        unblockUI();
    });
});
function blockUI() {
    blockUITimer = setTimeout(function() {
            $.blockUI({message: '<h1><img src="' + imagePath + 'wait30trans.gif" /> Waiting for server response...</h1>'})
        },
        300
    );
}
function unblockUI() {
    clearTimeout(blockUITimer);
    setTimeout(function() {
            $.unblockUI();
        },
        500
    );
}
function normalizeContentSize() {
    var windowHeight = $(window).height();
    var windowWidth = $(window).width();
    $("#content").height(windowHeight - 115);
}
function initProjectCodeForm() {
    projectCodeForm = new ProjectCodeForm();
    projectCodeForm.init();
}
function initProjectCodesList() {
    projectCodesList = new ProjectCodesList();
    projectCodesList.init();
}
function initTimeSheet() {
    timeSheet = new TimeSheet();
    timeSheet.init();
}
function initOwnTimeReport() {
    ownTimeReport = new OwnTimeReport("ownTimeReport", "ownTimeReportContainer");
    ownTimeReport.init();
}
function initTimeSheetReport() {
    timeSheetReport = new TimeSheetReport("timeSheetReport", "timeSheetReportContainer");
    timeSheetReport.init();
}
function initGeneralDirectorReport() {
    generalDirectorReport = new GeneralDirectorReport("generalDirectorReport", "generalDirectorReportContainer");
    generalDirectorReport.init();
}
function initCodeDetailReport() {
    codeDetailReport = new CodeDetailReport("codeDetailReport", "codeDetailReportContainer");
    codeDetailReport.init();
}
function initGlobalManagement() {
    globalManagement = new GlobalManagement();
    globalManagement.init();
}
function initCountryManagement() {
    countryManagement = new CountryManagement();
    countryManagement.init();
}
function initNotificationManagement() {
    notificationManagement = new NotificationManagement("notificationManager", "notificationManagement");
    notificationManagement.init();
}
function initCRM() {
    crm = new CRM();
    crm.init();
}
function initHR() {
    hr = new HR();
    hr.init();
}
function initRights() {
    rightsManager = new RightsManager();
    rightsManager.init();
}
function initMonthCloser() {
    monthCloser = new MonthCloser("monthCloser", "monthCloser_container");
    monthCloser.init();
}
function initEmployeeManager() {
    employeeManager = new EmployeeManager("employeeManager", "employeeManager_container");
    employeeManager.init();
}
function initEmployeeSalaryManager() {
    employeeSalaryManager = new EmployeeSalaryManager("employeeSalaryManager", "employeeSalaryManager_container");
    employeeSalaryManager.init();
}
function initBudgetManager() {
    budgetManager = new BudgetManager("budgetManager", "budgetManager_container");
    budgetManager.init();
}
function initAreaLoginForm() {
    var areaId = getCookie("areaId");
    areaLoginForm = new AreaLoginForm({"login": "", "password": "", "areaId": areaId}, "areaLoginForm", "areaLoginFormContainer");
    areaLoginForm.init();
}

function doAlert(title, message, okContext, okHandler) {
    $("#alertPopup").html(message);
    $("#alertPopup").dialog({
        title: title,
        modal: true,
        position: 'center',
        buttons: {
            Ok: function() {
                $(this).dialog( "close" );
                if(okContext != null && okHandler != null) {
                    okHandler.call(okContext);
                }
            }
	}
    }
    );
}
function doConfirm(title, message, okContext, okHandler, cancelContext, cancelHandler) {
    $("#alertPopup").html(message);
    $("#alertPopup").dialog({
        title: title,
        modal: true,
        position: 'center',
        buttons: {
            Ok: function() {
                $(this).dialog( "close" );
                if(okContext != null && okHandler != null) {
                    okHandler.call(okContext);
                }
            },
            Cancel: function() {
                $(this).dialog( "close" );
                if(cancelContext != null && cancelHandler != null) {
                    cancelHandler.call(cancelContext);
                }
            }
	}
    }
    );
}
function showErrors(errors) {
    var message = "";
    for(var key in errors) {
        message += errors[key] + "<br />";
    }
    doAlert("Validation error", message, null, null);
}
function getJSON(object) {
 if(JSON) {
     return JSON.stringify(object);
 }
 if(object == null) {
  return "null";
 }
 if(object.constructor == Array) {
  var json = "[";
  var counter = 0;
  for(var key in object) {
   if(counter > 0) {
    json += ", ";
   }
   json += getJSON(object[key]);
   counter++;
  }
  json += "]"
  return json;
 } else if(object.constructor == String){
  return "\"" + object.replace(new RegExp("\n",'g'), "\\n") + "\"";
 } else if(object.constructor == Number){
  return object;
 } else if(object.constructor == Boolean){
  return object;
 } else {
  var json = "{";
  var counter = 0;
  for(var key in object) {
   if(counter > 0) {
    json += ", ";
   }
   json += "\"" + key + "\" : " + getJSON(object[key]);
   counter++;
  }
  json += "}"
  return json;
 }
}
function clone(object) {
    return jQuery.parseJSON(getJSON(object));
}
function getDays(year, month) {
    var startTime = new Date(year, month, 1, 0, 0, 0, 0);
    var daySpan = 1000 * 60 * 60 * 24;
    for(var i = 27; i <= 31; i++) {
       var currentTime  = new Date();
       currentTime.setTime(startTime.getTime() + i * daySpan);
       if(currentTime.getMonth() != startTime.getMonth()) {
           return i;
       }
    }
    return 31;
}

String.prototype.startsWith = function(prefix) {
    return this.indexOf(prefix) === 0;
}
function size(object) {
    var count = 0;
    for(var key in object) {
        count++;
    }
    return count;
}

function isDateValid(text) {
    var tmp = text.split(".");
    if(tmp.length != 3) {
        return false;
    }
    return true;
}
function parseDateString(text) {
    var tmp = text.split(".");
    return new Date(tmp[2], tmp[1] - 1, tmp[0]);
}
function getYearMonthDateFromDateString(text) {
    if(text == null || jQuery.trim(text) == "") {
        return null;
    }
    var tmp = text.split(".");
    return {
        "year": parseInt(tmp[2]),
        "month": parseInt(tmp[1] - 1),
        "dayOfMonth": parseInt(tmp[0] - 0) // -0 is used to fix parse problem
    };
}
function getDaysInRange(start, end) {
    if(compareYearMonthDate(start, end) != -1) {
        return 0;
    }
    var startDate = new Date(start.year, start.month, start.dayOfMonth, 0, 0, 0, 0);
    var endDate = new Date(end.year, end.month, end.dayOfMonth, 0, 0, 0, 0);
    return Math.round((endDate.getTime() - startDate.getTime()) / (1000*60*60*24));
}
function getStringFromRange(start, end) {
    if(start == null && end == null) {
        return "";
    } else if(start == null && end != null) {
        return "..." + getStringFromYearMonthDate(end);
    } else if(start != null && end == null) {
        return getStringFromYearMonthDate(start) + "...";
    } else {
        return getStringFromYearMonthDate(start) + "..." + getStringFromYearMonthDate(end);
    }
}
function getStringFromYearMonthDate(obj) {
    if(obj == null) {
        return "";
    }
    var dateStr = "" + obj.dayOfMonth;
    if(dateStr.length == 1 ) {
        dateStr = '0' + dateStr;
    }
    var monthStr = "" + (obj.month + 1);
    if(monthStr.length == 1 ) {
        monthStr = '0' + monthStr;
    }
    return dateStr + '.' + monthStr + '.' + obj.year;
}
function getShiftedYearMonthDate(day, n) {
    var date = new Date(day.year, day.month, day.dayOfMonth, 12, 0, 0, 0);
    var shiftedDate = new Date(date.getTime() + n * 24 * 60 * 60 * 1000);
    return {
        "year": shiftedDate.getFullYear(),
        "month": shiftedDate.getMonth(),
        "dayOfMonth": shiftedDate.getDate()
    }
}
function compareYearMonthDate(o1, o2) {
    if(o1==null && o2==null) {
        return 0;
    }
    if(o1!=null && o2==null) {
        return 1;
    }
    if(o1==null && o2!=null) {
        return -1;
    }
    var date1 = new Date(o1.year, o1.month, o1.dayOfMonth, 0, 0, 0, 0);
    var date2 = new Date(o2.year, o2.month, o2.dayOfMonth, 0, 0, 0, 0);
    if(date1.getTime() <  date2.getTime()) {
        return -1;
    } else if(date1.getTime() >  date2.getTime()) {
        return 1;
    }
    return 0;
}
function isIntersected(start1, end1, start2, end2) {
    if(compareYearMonthDate(start1, start2) == 0 ) {
        return true;
    } else if(compareYearMonthDate(start1, start2) == -1){
        if(end1 == null) {
            return true;
        } else if(compareYearMonthDate(start2, end1) == 1) {
            return false;
        } else {
            return true;
        }
    } else {
        if(end2 == null) {
            return true;
        } else if(compareYearMonthDate(start1, end2) == 1) {
            return false;
        } else {
            return true;
        }
    }
    return false;
}
function CalendarVisualizer() {

}
CalendarVisualizer.prototype.getHtml = function(calendar) {
    if(calendar == null) {
        return null;
    } else {
        var dateStr = "" + calendar.dayOfMonth;
        if(dateStr.length == 1 ) {
            dateStr = '0' + dateStr;
        }
        var monthStr = "" + (calendar.month + 1);
        if(monthStr.length == 1 ) {
            monthStr = '0' + monthStr;
        }
        return dateStr + '.' + monthStr + '.' + calendar.year;
    }
}
var calendarVisualizer = new CalendarVisualizer();
function MinutesAsHoursVisualizer() {

}
MinutesAsHoursVisualizer.prototype.getHtml = function(value) {
    if(value == null) {
        return null;
    } else {
        return value/60;
    }
}
var minutesAsHoursVisualizer = new MinutesAsHoursVisualizer();

function split( val ) {
    return val.split( /,\s*/ );
}
function extractLast( term ) {
    return split( term ).pop();
}
function checkDataChanged() {
    if(dataChanged) {
        if(document.all) {
            return "There are unsaved data in the form.";
        } else {
            return "You are about to leave this page.\nThere are unsaved data in the form.\nPress OK to leave it. Press Cancel to stay here."
        }
    } else {
        blockUI();
    }
}

function setCookie (name, value, expires, path, domain, secure) {
      document.cookie = name + "=" + escape(value) +
        ((expires) ? "; expires=" + expires : "") +
        ((path) ? "; path=" + path : "") +
        ((domain) ? "; domain=" + domain : "") +
        ((secure) ? "; secure" : "");
}

function getCookie(name) {
	var cookie = " " + document.cookie;
	var search = " " + name + "=";
	var setStr = null;
	var offset = 0;
	var end = 0;
	if (cookie.length > 0) {
		offset = cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = cookie.indexOf(";", offset)
			if (end == -1) {
				end = cookie.length;
			}
			setStr = unescape(cookie.substring(offset, end));
		}
	}
	return(setStr);
}
function deleteCookie(name) {
    setCookie(name, null, {expires: -1})
}
