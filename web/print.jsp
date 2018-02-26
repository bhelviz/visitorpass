<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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
            <c:choose>
                <c:when test="${not empty param.slno}">
                    <sql:query var="rs1" dataSource="jdbc/test">
                            SELECT * FROM visitorpass WHERE VP_TSTM = ?
                            <sql:param value="${param.slno}"/>
                    </sql:query>
                </c:when>
                <c:otherwise>
                    <sql:query var="rs1" dataSource="jdbc/test">
                            SELECT * FROM visitorpass WHERE VP_TSTM = (SELECT MAX(VP_TSTM) FROM visitorpass)
                    </sql:query>
                </c:otherwise>
            </c:choose>
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
								<td><img width='120' height='120' src='${rs1.rows[0].VP_PHTO}'/></td>
								<td><b>${rs1.rows[0].VP_NAME}</b><br/><b>${rs1.rows[0].VP_DESG}</b><br/><b>${rs1.rows[0].VP_FROM}</b>
                                                                    <br/>Area of Visit: <b>${rs1.rows[0].VP_VTAR}</b><br/>Valid From: <b>${rs1.rows[0].VP_VDFM}</b>
                                                                    <br/>Valid Upto: <b>${rs1.rows[0].VP_VDTO}</b><br/>ID: <b>${rs1.rows[0].VP_SLNO}</b></td>
							</tr>
							<!--<tr><td colspan='2'>Vehicle No: ${param.veh}<br/>Laptop: ${param.lm} &nbsp; ${param.lsn}<br/>Mobile: ${param.mh} &nbsp; ${param.mobileno}</td></tr>-->
							<tr><td colspan='2'>Check In Time: <u>${rs1.rows[0].VP_TSTM}</u> </td></tr>
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