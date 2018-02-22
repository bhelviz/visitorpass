<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Visitor Pass</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<!--<link href="css/style.css" rel="stylesheet" type="text/css" />-->
	<style>
		#ctr{
			
		}
		#left {
			width: 49%;			
			float: left;
			border-radius: 10px; border: 1px solid black;
		}
		#right {
			width: 49%;			
			float: right;
			border-radius: 10px;
			border: 1px solid black;
			/*padding-left: 25px;
			border-width: 1px; border-style: solid; border-color: red;*/ 
		}
		* {
			font-family: Verdana, Geneva, sans-serif;
			font-size: 12px;
		}
		.row {
		  display: flex; /* equal height of the children */
		}

		.col {
		  flex: 1; /* additionally, equal width */
		  padding: 2px;
		}
	</style>
</head>
<body>
<c:choose>
	<c:when test="${not empty sessionScope.login}">
	
	<div align="center" id="ctr" class="row">
			<div id="left" class="col">
				<table>
					<tr>
						<td colspan='2' align="center">
							<table>
								<tr>
									<td style='text-align:center'><img src='http://10.100.1.45/visitorpass/img/minilogo.png'></td>
									<td>Bharat Heavy Electricals Limited<br/>Heavy Plates & Vessels Plant<br/>Visakhapatnam - 530012</td>
								</tr>								
							</table>
						</td>
					</tr>			
				</table>
				<b><u>VISITOR PASS</u></b>	
				<table>
					<col width='35%'>
					<col width='65%'>
						<tr>
						<td>
						<table>
							<tr>
								<td><img width='120' height='120' src='http://10.100.1.45/visitorpass/${param.id}'/></td>
								<td><b>${param.firstname}</b><br/><b>${param.desg}</b><br/><b>${param.comingfrom}</b><br/>Area of Visit: <b>${param.va}</b><br/>Valid From: <b>${param.vf}</b><br/>Valid Upto: <b>${param.vt}</b><br/>ID: <b>${param.id}</b></td>
							</tr>
							<!--<tr><td colspan='2'>Vehicle No: ${param.veh}<br/>Laptop: ${param.lm} &nbsp; ${param.lsn}<br/>Mobile: ${param.mh} &nbsp; ${param.mobileno}</td></tr>-->
							<tr><td colspan='2'>Check In Time: <u>${param.chkin}</u> </td></tr>
							<tr>
								<td colspan='2'><br/><div>I will abide by all the rules and regulations of BHEL <br/><br/>
														&nbsp;<br/>
														Pass Holder Signature&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Chief Security Officer</div></td>
							</tr>
						</table>
						</td>
						</tr>
				</table>
			</div>
			<div id="right" class="col">
				<table>
					<col width='50%'>
					<col width='50%'>
					<tr>
						<td style='text-align:center; font-size: 14px;' colspan='2'><b>Notification</b></td>
					</tr>
					<tr>
						<td colspan='2'>
							<ul style='list-style-position: inside; padding-left:0'>
								<li>BHEL is not responsible for any injury caused to the visitor and BHEL is not liable to pay compensation for any injury/loss/damage</li>
								<li>Visitor shall declare all the items carried by him/her for verification at entry gate</li>
								<li>Visitor shall ensure that information pertaining to BHEL is not compromised or misused</li>
								<li>Visitor shall not commit any activity which is against the interests of BHEL</li>
								<li>The visitor is allowed to visit only the place mentioned in the pass</li>
								<li>This visitor pass has to be surrendered at the main gate security while leaving the premises</li>
							</ul>
						</td>
					</tr>
					<!--<tr>
						<td>Person Visited:</td>
						<td>_______________________</td>
					</tr>-->
					<tr>
						<td>Time of leaving the Dept.:</td>
						<td>___________________</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>Signature with Date & Stamp of Executive:</td>
						<td>___________________</td>
					</tr>
				</table>
			</div>		
	</div>
    <script>
		window.print();
	</script>      
	</c:when>
<c:otherwise>
	<c:redirect url="index.html"/>
</c:otherwise> 
</c:choose>	
</body>
</html>