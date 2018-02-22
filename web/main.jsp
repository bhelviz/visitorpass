<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" href="css/jquery-ui.css">
	<script src="js/jquery-1.10.2.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script>
	$(function() {
		$( "#validfrom" ).datepicker({ dateFormat: "dd-mm-yy" } );
		$( "#validupto" ).datepicker({ dateFormat: "dd-mm-yy" } );		
	});
	</script>
</head>
<!--oncontextmenu="return false"-->
<body> 
<c:choose>
	<c:when test="${not empty sessionScope.login}">
	
<div align="center"><br/>
<p><a href="reports.jsp">Reports</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp">Logout</a></p>
    <table width="60%">
		<col width="22%">
		<col width="38%">
		<col width="40%">
		<tr>
			<td rowspan="2" style="text-align: center">
				<img src="img/logo.png">
			</td>
			<td style="text-align: center" colspan="2" >
				<div>
				<span style="font: normal 140% 'myFirstFont', arial, sans-serif;color: #6648B0;margin: 8px;padding: 0 0 24px 0;text-shadow: 1px 1px #FFF;">
				BHEL (HPVP) Visakhapatnam
				</span>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center">
				<span style="font: normal 160% 'myFirstFont', arial, sans-serif;color: #6648B0;margin: 8px;padding: 0 0 24px 0;text-shadow: 1px 1px #FFF;">
				<b><u>Visitor Pass System</u></b>
				</span>
			</td>
		</tr>	
		<tr>
            <td valign="top" colspan="2" style="text-align: center">
                <form id='ui'>                
                    <h4>Visitor Information</h4>
            </td>
			<td style="text-align: center" rowspan="8">
                <h4>WEBCAM IMAGE</h4>
                <!-- First, include the JPEGCam JavaScript Library -->

                <script type="text/javascript" src="webcam.js"></script>

                <script type="text/javascript" src="yui/yahoo-min.js"></script>

                <script type="text/javascript" src="yui/event-min.js"></script>

                <script type="text/javascript" src="yui/connection-core.js"></script>

                <script type="text/javascript" src="yui/connection-min.js"></script>

                <!-- Configure a few settings -->

                <script language="JavaScript" type="text/javascript">
                    webcam.set_api_url('test.php');
                    webcam.set_quality(90); // JPEG quality (1 - 100)
                    webcam.set_shutter_sound(true); // play shutter click sound
                </script>

                <!-- Next, write the movie to the page at 320x240 -->

                <script language="JavaScript" type="text/javascript">
                    document.write(webcam.get_html(240, 240));
                </script>

                <!-- Some buttons for controlling things -->
                <!-- Code to handle the server response (see test.php) -->

                <script language="JavaScript" type="text/javascript">
                    webcam.set_hook('onComplete', 'my_completion_handler');

                    function mobileNoValidate() {
                        var mobileDom = document.getElementById('mobileno');
                        if (mobileDom) {
                            var x = mobileDom.value;
                            var re10digit = /^\d{10}$/;
                            if (x.search(re10digit) == -1) {
                                alert("Invalid Mobile No");
                                return false;
                            };
                        };
                        return true;
                    }

                    function emailValidate() {
                        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                        var emailDom = document.getElementById('email');
                        if (emailDom) {
                            if (emailDom.value.search(emailPattern) == -1) {
                                alert('Invalid Email Id');
                                return false;
                            };
                        };
                        return true;
                    }

                    function take_snapshot() {
						/*
						if (!mobileNoValidate()) {
							return false;
					   };
					    /*
						if (!emailValidate()) {
							return false;
						};
						*/
						if(document.getElementById("uname").value == ''){
							alert('Enter Visitor\'s Name');
							return false;
						}
						if(document.getElementById("desg").value == ''){
							alert('Enter Visitor\'s Designation');
							return false;
						}
						if(document.getElementById("from").value == ''){
							alert('Enter From');
							return false;
						}
                        if(document.getElementById("validfrom").value == ''){
							alert('Enter Validfrom Date');
							return false;
						}
                        if(document.getElementById("validupto").value == ''){
							alert('Enter Validupto Date');
							return false;
						}
						
						if(confirm('Create Visitor Pass?')){
							var d1 = new Date();
							var chkin1 = ('0' + d1.getDate()).slice(-2)+'-'+('0' + (d1.getMonth() + 1)).slice(-2)+'-'+d1.getFullYear()+'    '+d1.getHours()+':'+d1.getMinutes();
							document.getElementById("chkin").value = chkin1;
							//alert(document.getElementById("chkin").value);return false;
							var formUI = document.getElementById('ui');
							//alert(encodeURIComponent(formUI.from.value));
							//return false;	
							if (formUI) {
								var url = 'test.php?dt=' + (new Date()).getTime();
								if (formUI.uname && formUI.uname.value) {
									url += '&un=' + escape(formUI.uname.value);
								};

								if (formUI.meet && formUI.meet.value) {
									url += '&mt=' + escape(formUI.meet.value);
								};

								if (formUI.from && formUI.from.value) {
									url += '&cpname=' + encodeURIComponent(formUI.from.value);
								};
								if (formUI.representinglist && formUI.representinglist.value) {
									url += '&ra=' + escape(formUI.representinglist.value);
								};

								if (formUI.mobileno && formUI.mobileno.value) {
									url += '&mn=' + escape(formUI.mobileno.value);
								};

								if (formUI.email && formUI.email.value) {
									url += '&em=' + escape(formUI.email.value);
								};
								if (formUI.desg && formUI.desg.value) {
									url += '&desg=' + escape(formUI.desg.value);
								};
								if (formUI.va && formUI.va.value) {
									url += '&va=' + encodeURIComponent(formUI.va.value);
								};
								if (formUI.validfrom && formUI.validfrom.value) {
									url += '&validfrom=' + escape(formUI.validfrom.value);
								};
								if (formUI.veh && formUI.veh.value) {
									url += '&veh=' + escape(formUI.veh.value);
								};
								if (formUI.validupto && formUI.validupto.value) {
									url += '&validupto=' + escape(formUI.validupto.value);
								};
								if (formUI.mobilemake && formUI.mobilemake.value) {
									url += '&mh=' + escape(formUI.mobilemake.value);
								};
								if (formUI.laptopmake && formUI.laptopmake.value) {
									url += '&lm=' + escape(formUI.laptopmake.value);
								};
								if (formUI.laptopsn && formUI.laptopsn.value) {
									url += '&lsn=' + escape(formUI.laptopsn.value);
								};
								//url = encodeURI(url);
								if (formUI.chkin && formUI.chkin.value) {
									url += '&chkin=' + escape(formUI.chkin.value);
								};
								//url = encodeURI(url);
								webcam.set_api_url(url);
								//webcam.set_api_url('snaps/');
							};
							webcam.snap();
						}
                    }

                    clearLogin = function() {
                        var domLogin = document.getElementById('ui');
                        if (domLogin) {
                            domLogin.reset();
                        }
                    }

                    function GetString(Str, startTagName, endTagName) {
                        return Str.substring((Str.indexOf(startTagName) + startTagName.length), Str.indexOf(endTagName));
                    }

                    function my_completion_handler(msg) {
                        // extract URL out of PHP output
                        var output = msg;
						var image_url = GetString(msg, '<urlsrc>', '</urlsrc>');
						var usrid = GetString(msg, '<id>', '</id>');
						var fname = GetString(msg, '<fname>', '</fname>');
						var tomeet = GetString(msg, '<tomeet>', '</tomeet>');
						var comingfrom = GetString(msg, '<comingfrom>', '</comingfrom>');
						var mobile = GetString(msg, '<mobile>', '</mobile>');
						var email = GetString(msg, '<email>', '</email>');
						var checkin = GetString(msg, '<checkin>', '</checkin>');
						var status = GetString(msg,'<status>','</status>');
						var desg = GetString(msg,'<desg>','</desg>');
						var va = GetString(msg,'<va>','</va>');
						var vf = GetString(msg,'<vf>','</vf>');
						var vt = GetString(msg,'<vt>','</vt>');
						var mh = GetString(msg,'<mh>','</mh>');
						var veh = GetString(msg,'<veh>','</veh>');
						var lm = GetString(msg,'<lm>','</lm>');
						var lsn = GetString(msg,'<lsn>','</lsn>');
						var chkin2 = GetString(msg,'<chkin>','</chkin>');
						
                        webcam.reset();

                        clearLogin();

                        myWindow = window.open('', '', 'width=500,height=300');

                       var divUpd = document.createElement('div');
                        divUpd.id = 'upload_results';
                        if (myWindow.document.body != null) { myWindow.document.body.appendChild(divUpd); }
						var d = new Date();
						var chkin = ('0' + d.getDate()).slice(-2)+'-'+('0' + (d.getMonth() + 1)).slice(-2)+'-'+d.getFullYear()+'    '+d.getHours()+':'+d.getMinutes();
						/*myWindow.document.body.innerHTML =
					                    "<div align='center'><table width='200px' style='border-width: 1px 1px 1px 1px;border-spacing: 0;border-collapse: collapse;" +
                                        "border-style: ridge;border-color: black;font-family: Verdana;font-size: 8pt;clear: both;margin: 0;padding: 0;'>" +
                                        "<tr style='height: 20px;'>" +
                                        "<td align='center' valign='middle' style='font-weight: bold;font-size: 12px;color: black;background-color:" +
                                        "#D7D8D2;width: 300px;height:30px;font-size:15pt;font-family: Verdana;font-weight:bold;background-color: #000000;color:#ffffff;'>" +
                                        "VISITOR PASS</td></tr>" +
                                        "<tr><td align='center'><br /><img width='120' height='120' src='" + image_url + "'/><br /><br />" +
                                        "<table border='0' style='font-size: 8pt;font-family: Verdana;' " + 
                                        "width='200px' bgcolor='#ffffff' >" +
                                        "<tr style='height: 20px;'>" +
                                        "<td align='right' style='width: 70px;font-weight:bold;'>ID &nbsp;&nbsp;</td>" +
                                        "<td style='width: 140px;font-weight:bold;'>" + usrid + "</td></tr>" +
                                        "<tr style='height: 20px;'>" +
                                        "<td align='right' style='width: 70px;font-weight:bold;'>Name :&nbsp;&nbsp;</td>" +
                                        "<td style='width: 140px;font-weight:bold;'>" + fname + "</td></tr>" +
                                        "<tr style='height: 20px;'>" +
                                        "<td align='right' style='width: 70px;'>To Meet :&nbsp;&nbsp;</td>" +
                                        "<td style='width: 140px;'>" + tomeet + "</td></tr>" +
                                        "<tr style='height: 20px;'>" +
                                        "<td align='right' style='width: 70px;'>Type:&nbsp;&nbsp;</td>" +
                                        "<td style='width: 140px;'>" + comingfrom + "</td></tr>" +
                                        "<tr style='height: 20px;'>" +                                     
                                        "<td align='right' style='width: 70px;'>CheckIn:&nbsp;&nbsp;</td>" +
                                        "<td style='width: 140px;'>" + checkin + "</td></tr></table></td></tr>" +
                                        "</table></div>";*/
						myWindow.document.body.innerHTML = 
										"<style>"+
											"#left {"+
												"width: 49%;"+			
												"float: left;"+
												"border-radius: 10px; border: 1px solid black;"+
											"}"+
											"#right {"+
												"width: 49%;"+			
												"float: right;"+
												"border-radius: 10px;"+
												"border: 1px solid black;"+												
											"}"+
											"* {"+
												"font-family: Verdana, Geneva, sans-serif;"+
												"font-size: 12px;"+
											"}"+
											".row {"+
											  "display: flex; "+
											"}"+
											".col "+
											  "flex: 1; "+
											  "padding: 2px;"+
											"}"+
										"</style>"+
										"<div align='center' class='row'>"+
											"<div id='left' class='col'>"+
												"<table width='100%'>"+
													"<tr>"+
														"<td colspan='2' align='center'>"+
															"<table>"+
																"<tr>"+
																	"<td style='text-align:center'><img src='http://10.100.1.45/visitorpass/img/minilogo.png'></td>"+
																	"<td>Bharat Heavy Electricals Limited<br/>Heavy Plates & Vessels Plant<br/>Visakhapatnam - 530012</td>"+
																"</tr>"+							
															"</table>"+
														"</td>"+
													"</tr>"+			
												"</table>"+
												"<b><u>VISITOR PASS</u></b>"+	
												"<table width='100%'>"+
													"<col width='35%'>"+
													"<col width='65%'>"+
														"<tr>"+
														"<td"+
														"<table>"+
															"<tr>"+
																"<td><img width='120' height='120' src='" + image_url + "'/></td>"+
																"<td><b>"+ fname +"</b><br/><b>"+ desg +"</b><br/><b>"+ comingfrom +"</b><br/>Area of Visit: <b>"+ va +"</b><br/>Valid From: <b>"+ vf +"</b><br/>Valid Upto: <b>"+ vt +"</b><br/>ID: <b>"+ usrid +"</b></td>"+
															"</tr>"+
															<!--"<tr><td colspan='2'>Vehicle No: "+ veh +"<br/>Laptop: "+ lm +" &nbsp; "+ lsn +"<br/>Mobile: "+ mh +" &nbsp; "+ mobile +"</td></tr>"+-->
															"<tr><td colspan='2'>Check In Time: <u>"+ chkin2 +"</u> </td></tr>"+
															"<tr>"+
																"<td colspan='2'><br/><div>I will abide by all the rules and regulations of BHEL <br/><br/>"+
																						"&nbsp;<br/>"+
																						"Pass Holder Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chief Security Officer</div></td>"+
															"</tr>"+
														"</table>"+
														"</td>"+
														"</tr>"+
												"</table>"+
											"</div>"+
											"<div id='right' class='col'>"+
												"<table>"+
													"<col width='50%'>"+
													"<col width='50%'>"+
													"<tr>"+
														"<td style='text-align:center; font-size: 14px;' colspan='2'><b>Notification</b></td>"+
													"</tr>"+
													"<tr>"+
														"<td colspan='2'>"+
															"<ul style='list-style-position: inside; padding-left:0'>"+
																"<li>BHEL is not responsible for any injury caused to the visitor and BHEL is not liable to pay compensation for any injury/loss/damage</li>"+
																"<li>Visitor shall declare all the items carried by him/her for verification at entry gate</li>"+
																"<li>Visitor shall ensure that information pertaining to BHEL is not compromised or misused</li>"+
																"<li>Visitor shall not commit any activity which is against the interests of BHEL</li>"+
																"<li>The visitor is allowed to visit only the place mentioned in the pass</li>"+
																"<li>This visitor pass has to be surrendered at the main gate security while leaving the premises</li>"+
															"</ul>"+
														"</td>"+
													"</tr>"+
													<!--"<tr>"+-->
														<!--"<td>Person Visited:</td>"+-->
														<!--"<td>___________________</td>"+-->
													<!--"</tr>"+-->
													"<tr>"+
														"<td>Time of leaving the Dept.:</td>"+
														"<td>___________________</td>"+
													"</tr>"+
													"<tr>"+
														"<td>&nbsp;</td>"+
														"<td>&nbsp;</td>"+
													"</tr>"+
													"<tr>"+
														"<td>Signature with Date & Stamp of Executive:</td>"+
														"<td>___________________</td>"+
													"</tr>"+
												"</table>"+
											"</div>"+		
									"</div>";
									
					                    
						myWindow.focus();
                        printContent = function() {
                            myWindow.focus();
                            myWindow.print();
                            closeCurWindow = function() {
                                myWindow.close();
                            };
                            /*window.setTimeout(closeCurWindow, 3000);*/
                        };
                        window.setTimeout(printContent, 3000);
                    };


                    clearSignoutPage = function() {
                        var logoutDom = document.getElementById('logout');
                        if (logoutDom) {
                            logoutDom.reset();
                        };
                    };
                    succSignout = function(o) {
                        var outputDom = document.getElementById('output');
                        if (outputDom) {
                            if (o.responseText == 'error') {
                                outputDom.innerHTML = 'Invalid Visitor Id';
                            } else if (o.responseText == 'Invalid') {
                                outputDom.innerHTML = 'Invalid Visitor Id';
                            } else {
                                outputDom.innerHTML = 'Visitor Id ' + o.responseText + ' succefully logged out';
                            }
                        };
                    };

                    failSignout = function(o) {
                    };

                    var SignOutCallback = {
                        success: succSignout,
                        failure: failSignout
                    };


                    Signout = function() {
                        var sUrl = "signout.php?mk=" + (new Date()).getTime();
                        var domVid = document.getElementById('vid');
                        if (domVid) {
                            sUrl += '&vid=' + domVid.value;
                        };
                        var request = YAHOO.util.Connect.asyncRequest('GET', sUrl, SignOutCallback);
                    }
                </script>

            </td>            
		</tr>
		<tr class="trStyle">
            <td align='right' style='width: 200px;'>
                Name :&nbsp;&nbsp;
            </td>
            <td style='width: 300px;'>
                <input style='width: 200px;' id='uname' name='uname' type='text' />
            </td>
        </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Designation :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='desg' name='desg' type='text' class="txt_box" />
                        </td>
                    </tr>
					<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            From :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='from' name='from' type='text' class="txt_box" />
                        </td>
                    </tr>
					<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Visiting Area :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='va' name='va' type='text' class="txt_box" />
                        </td>
                    </tr>
                    <!--<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Representing :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <select id='representinglist' name='representinglist' style='width: 200px; height: 25px;'
                                class="txt_box">
                                <option value='Vendor'>Vendor</option>
                                <option value='Friend'>Friend</option>
                                <option value='Family'>Family</option>
                                <option value='Interview'>Interview</option>
                                <option value='Customer'>Customer</option>
                            </select> <input style='width:200px;' id='comingfrom' name='comingfrom' type='text'/>
                        </td>
                    </tr>-->
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Mobile Handset :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='mobilemake' name='mobilemake' type='text' class="txt_box" />
                        </td>
                    </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Mobile No :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='mobileno' name='mobileno' type='text' class="txt_box" />
                        </td>
                    </tr>
                   <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Email - Id :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='email' name='email' type='text' class="txt_box" />
                        </td>
                    </tr>
					<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Vehicle No :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input style='width: 200px;' id='veh' name='veh' type='text' class="txt_box" />
                        </td>
                    </tr>
					<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Laptop Model:&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input style='width: 200px;' id='laptopmake' name='laptopmake' type='text' class="txt_box" />
                        </td>
                    </tr>
					<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Laptop S/N:&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input style='width: 200px;' id='laptopsn' name='laptopsn' type='text' class="txt_box" />
                        </td>
                    </tr>
					<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Valid From :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input id='validfrom' name='validfrom' type='text' class="txt_box" />&nbsp;(dd-mm-yyyy)
                        </td>
                    </tr>
					<tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Valid Upto :&nbsp;&nbsp;
                        </td>
                        <td align='right' style='width: 200px;' colspan="2">
                             <input id='validupto' name='validupto' type='text' />&nbsp;(dd-mm-yyyy)  
                        </td>
                    </tr>
					<input type="hidden" name="chkin" id="chkin">
					</form>
                    <tr style="height: 50px;">
                        <td align="left" style='text-align: center;' colspan="3">
                            <button onclick="take_snapshot()" class="buttonStyle">Generate</button>&nbsp;&nbsp;
                            <input type="button" value="Clear" onclick="clearLogin()" class="buttonStyle" />
                        </td>
                    </tr>
					
                
				<!--<tr>
					<td colspan="3" style="text-align: center">
						<span style="font: normal 100% 'myFirstFont', arial, sans-serif;color: #6648B0;margin: 8px;padding: 0 0 24px 0;text-shadow: 1px 1px #FFF;">
						<b><i>Check - Out</i></b>
						</span>
					</td>
				</tr>			
        <tr>
            <td rowspan="6">
            </td>
            <td colspan="2">
                <form id='logout'>
                
                    <tr class="trStyle">
                        <td align='center' style='width: 200px;'>
                            Visitor Id :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='vid' name='vid' type='text' class="txt_box" />
                        </td>
                    </tr>
                    <tr class="trStyle">
                        <td align='center'>
                        </td>
                        <td align='left'>
                            <input type='button' value='Submit' onclick='javascript:Signout();' class="buttonStyle" />&nbsp;&nbsp;
                            <input type='button' value='Clear' onclick='javascript:clearSignoutPage();' class="buttonStyle" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan='2'>
                            <div id='output' style="width: 250px;" class="textStyle">
                            </div>
                            
                        </td>
                    </tr>
               

                </form>
            </td>
        </tr>-->
    </table>
	</div>
	</c:when>
<c:otherwise>
	<c:redirect url="index.html"/>
</c:otherwise> 
</c:choose>
</body>
</html>
