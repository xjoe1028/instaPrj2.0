<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>

	<head>
		<meta charset="UTF-8" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/icons/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
		<!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- bootstrap -->
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>

	<body class="limiter">
		<div class="container-login100">
			<div class="cheatForm" id="index2Contain">
				<div class="instaQueryForm">
					<br>
					<div style="font-size: 20px;font-weight: 800; text-align: center;">Instagram Picker</div>
					<br>
					<form class="instaQueryForm" id="queryFrom">
						<div class="col-12 mt-2 mb-2">
							<div class="row">
								<div class="col-12 col-lg-3">
									<div class="row">
										<label for="" class="font-weight-bolder" >Url Address：</label>
									</div>
								</div>
								<div class="col-12 col-lg-8">
									<input class="form-control input-sm" id="url"
										placeholder="ex. https://www.instagram.com/p/B-ZEuJypDtG/" />
								</div>
							</div>
						</div>
						<br>
						<div class="col-12 mt-4 mb-2">
							<div class="row">
								<div class="col-12 col-lg-3">
									<div class="row">
										<label for="" class="font-weight-bolder">Allow Repeating winners：</label>
									</div>
								</div>
								<div class="col-12 col-lg-8">
									<input id="repeat" type="checkbox" />
								</div>
							</div>
						</div>
						<br>
						<div class="col-12 mt-4 mb-2">
							<div class="row">
								<div class="col-12 col-lg-3">
									<div class="row">
										<label for="" class="font-weight-bolder">Tag Number：</label>
									</div>
								</div>
								<div class="col-12 col-lg-3">
									<select id="tagCount" name="tagCount" class="form-control input-sm selectpicker">
										<option>0</option>
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
									</select>
								</div>
							</div>
						</div>
					</form>
					<br><br>
					<table id="queryTable2" border="1"
						class="table table-striped table-hover table-bordered instaQueryForm">
						<thead>
							<tr>
								<td class="col-xs-5"><label for="">Prize</label></td>
								<td class="col-xs-2"><label for="">Number Limit</label></td>
								<td class="col-xs-2">
									<button onclick="addPrize()" class="index2Btn">
										add
									</button>
								</td>
							</tr>
						</thead>
						<tbody id="tb">
							<tr id="index2_1st">
								<td class="col-xs-5">
									<input class="form-control input-sm" id="reward" />
								</td>
								<td class="col-xs-2">
									<select class="form-control input-sm selectpicker" id="count">
										<option>1</option>
										<option>2</option>
										<option>3</option>
										<option>4</option>
										<option>5</option>
										<option>6</option>
										<option>7</option>
										<option>8</option>
										<option>9</option>
										<option>10</option>
									</select>
								</td>
								<td class="col-xs-2">
									<!-- <button onclick="delPrize(this)" class="index2Btn">
										刪除
									</button> -->
								</td>
							</tr>
						</tbody>

						<tfoot>
							<tr>
								<td colspan="1"></td>
								<td colspan="2">
									<!-- login100-form-bgbtn 在main.css 有彩色跟藏青藍樣式 -->
									<div class="container-login100-form-btn">
										<div class="wrap-login100-form-btn">
											<div class="login100-form-bgbtn"></div>
											<button id="btn1" onclick="sendFun()" class="index2Btn">
												Lucky Draw!
											</button>
										</div>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>

			</div>
			<div id="picking"
				style="position: absolute;left: 50%;top: 50%; margin-top: -100px;margin-left: -200px; height: 400px;width:600px ;"
				hidden="true">
				<p style="font-size: 100px;font-weight: 500;color: white;" id = "pickingText">Drawing</p>
			</div>
		</div>
	</body>

	</html>