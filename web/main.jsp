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
            var videoPlaying = false;
            function userMedia(){
                return navigator.getUserMedia = navigator.getUserMedia ||
                navigator.webkitGetUserMedia ||
                navigator.mozGetUserMedia ||
                navigator.msGetUserMedia || null;
                
            }
            
            if( userMedia() ){
                
                var constraints = {
                    video: true,
                    audio:false
                };
                var video = document.getElementById('vp_wbcm');

                var media = navigator.getUserMedia(constraints, function(stream){

                    // URL Object is different in WebKit
                    var url = window.URL || window.webkitURL;

                    // create the url and set the source of the video element
                    video.src = url ? url.createObjectURL(stream) : stream;

                    // Start the video
                    video.play();
                    videoPlaying  = true;
                }, function(error){
                    console.log("ERROR");
                    console.log(error);
                });


                


            } else {
                console.log("KO");
            }
            
		$( "#vp_vdfm" ).datepicker({ dateFormat: "dd-mm-yy" } );
		$( "#vp_vdto" ).datepicker({ dateFormat: "dd-mm-yy" } );
                
                $( "#take_snapshot" ).click(function(){
                    if(document.getElementById("vp_name").value == ''){
                        alert('Enter Visitor\'s Name');
                        return false;
                    }
                    if(document.getElementById("vp_desg").value == ''){
                            alert('Enter Visitor\'s Designation');
                            return false;
                    }
                    if(document.getElementById("vp_from").value == ''){
                            alert('Enter From');
                            return false;
                    }
                    if(document.getElementById("vp_vdfm").value == ''){
                            alert('Enter Valid from Date');
                            return false;
                    }
                    if(document.getElementById("vp_vdto").value == ''){
                            alert('Enter Valid upto Date');
                            return false;
                    }
                    
                    if(confirm('Create Visitor Pass?')){
                        if (videoPlaying){
                            var canvas = document.getElementById('vp_cnvs');
                            canvas.width = video.videoWidth;
                            canvas.height = video.videoHeight;
                            canvas.getContext('2d').drawImage(video, 0, 0);
                            var vp_imdt = canvas.toDataURL('image/webp');
                            //document.getElementById('photo').setAttribute('src', vp_imdt);
                            document.getElementById('vp_phto').value = vp_imdt; //.split(',')[1];
                        }
                        $.ajax({
                            type: "POST",
                            url: "vpsave.jsp",
                            //enctype: 'multipart/form-data',
                            processData: false,
                            //contentType: 'multipart/form-data',
                            async: false,
                            cache: false,
                            contentType: false,
                            data: new FormData(document.getElementById("vp"))
                              
                        }).done(function(o) {
                            console.log('saved'); 
                            window.open("print.jsp","newWindow","location=yes,width=400,height=400");
                            // If you want the file to be visible in the browser 
                            // - please modify the callback in javascript. All you
                            // need is to return the url to the file, you just saved 
                            // and than put the image in your browser.
                        });
                    }
                });
                
                
	});
          function take_snapshot() {
                
                
            }
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
                            
                    <h4>Visitor Information</h4>
            </td>
			<td style="text-align: center" rowspan="8">
                            <video id="vp_wbcm" width="240" height="240"></video>
                            <canvas id="vp_cnvs" style="display:none;" width="240" height="240"></canvas>
                            <script>
                                ;(function(){
                                    


                                    // Now we can use it
                                    
                                })();
                            </script>
              </td>            
		</tr>
                  
                <form name="vp" id="vp">
                        
                <input type="hidden" id="vp_phto" name="vp_phto" alt="photo">
		<tr class="trStyle">
                    <td align='right' style='width: 200px;'>
                        Name :&nbsp;&nbsp;
                    </td>
                    <td style='width: 300px;'>
                        <input style='width: 200px;' id='vp_name' name='vp_name' type='text' />
                    </td>
                </tr>
                <tr class="trStyle">
                    <td align='right' style='width: 200px;'>
                        Designation :&nbsp;&nbsp;
                    </td>
                    <td style='width: 300px;'>
                        <input style='width: 200px;' id='vp_desg' name='vp_desg' type='text' class="txt_box" />
                    </td>
                </tr>
		<tr class="trStyle">
                    <td align='right' style='width: 200px;'>
                        From :&nbsp;&nbsp;
                    </td>
                    <td style='width: 300px;'>
                        <input style='width: 200px;' id='vp_from' name='vp_from' type='text' class="txt_box" />
                    </td>
                </tr>
		<tr class="trStyle">
                    <td align='right' style='width: 200px;'>
                        Visiting Area :&nbsp;&nbsp;
                    </td>
                    <td style='width: 300px;'>
                        <input style='width: 200px;' id='vp_vtar' name='vp_vtar' type='text' class="txt_box" />
                    </td>
                </tr>
                   
                <tr class="trStyle">
                    <td align='right' style='width: 200px;'>
                        Mobile Handset :&nbsp;&nbsp;
                    </td>
                    <td style='width: 300px;'>
                        <input style='width: 200px;' id='vp_mbmk' name='vp_mbmk' type='text' class="txt_box" />
                    </td>
                </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Mobile No :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='vp_mbno' name='vp_mbno' type='text' class="txt_box" />
                        </td>
                    </tr>
                   <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Email - Id :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;'>
                            <input style='width: 200px;' id='vp_mail' name='vp_mail' type='text' class="txt_box" />
                        </td>
                    </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Vehicle No :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input style='width: 200px;' id='vp_vhcl' name='vp_vhcl' type='text' class="txt_box" />
                        </td>
                    </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Laptop Model:&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input style='width: 200px;' id='vp_ltmd' name='vp_ltmd' type='text' class="txt_box" />
                        </td>
                    </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Laptop S/N:&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input style='width: 200px;' id='vp_ltsn' name='vp_ltsn' type='text' class="txt_box" />
                        </td>
                    </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Valid From :&nbsp;&nbsp;
                        </td>
                        <td style='width: 300px;' colspan="2">
                            <input id='vp_vdfm' name='vp_vdfm' type='text' class="txt_box" />&nbsp;(dd-mm-yyyy)
                        </td>
                    </tr>
                    <tr class="trStyle">
                        <td align='right' style='width: 200px;'>
                            Valid Upto :&nbsp;&nbsp;
                        </td>
                        <td align='right' style='width: 200px;' colspan="2">
                             <input id='vp_vdto' name='vp_vdto' type='text' />&nbsp;(dd-mm-yyyy)  
                        </td>
                    </tr>
                        <input type="hidden" name="chkin" id="chkin">
                            </form>
                       
                   		
                    <tr style="height: 50px;">
                        <td align="left" style='text-align: center;' colspan="3">
                            <button onclick="take_snapshot()" id="take_snapshot" class="buttonStyle">Generate</button>&nbsp;&nbsp;
                            <input type="button" value="Clear" onclick="clearLogin()" class="buttonStyle" />
                        </td>
                    </tr>
					
                
				
    </table>
	</div>
	</c:when>
<c:otherwise>
	<c:redirect url="index.html"/>
</c:otherwise> 
</c:choose>
</body>
</html>
