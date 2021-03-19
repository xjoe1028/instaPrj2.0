<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>

	<head>
		<meta charset="UTF-8" />
		<title>Instagram Picker</title>
		<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/icons/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
		<!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<!-- bootstrap -->
		<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>

	<body class="limiter">
		<!-- 背景彩色圖 -->
		<!-- <div id="container" style="background-image: url('images/bg-01.jpg');" class="container-login100"> -->
		<!-- 背景藏青藍 -->
		<div class="container-login100">
			<div class="cheatForm" id="cheatFormDiv">
				<table border="0" id="cheatTable" class="tableClass">
					<br>
					<!-- <caption style="font-size: 20px;font-weight: 700;">內定人選 (超過留空)</caption> -->
					<div style="font-size: 20px;font-weight: 700; text-align: center;">內定人選 (超過留空)</div>
					<thead>
						<tr>
							<td style="font-weight: 700;"><br>獎品(需與抽獎表單字相同)</td>
							<td style="font-weight: 700;"><br>內定人帳號(帳號不包含@)</td>
						</tr>
					</thead>
					<tbody id="tb2">
						<tr id="1st">
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_reward" value='' /></td>
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_name" value='' /></td>
						</tr>
						<tr id="2st">
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_reward" value='' /></td>
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_name" value='' /></td>
						</tr>
						<tr id="3st">
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_reward" value='' /></td>
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_name" value='' /></td>
						</tr>
						<tr id="4st">
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_reward" value='' /></td>
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_name" value='' /></td>
						</tr>
						<tr id="5st">
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_reward" value='' /></td>
							<td class="col-xs-3"><input class="form-control input-sm" id="cheat_name" value='' /></td>
						</tr>
					</tbody>
					<tfoot>
						<tr id="6st">
							<td class="col-xs-3"></td>
							<td class="col-xs-3">
								<br>
								<!-- login100-form-bgbtn 在main.css 有彩色跟藏青藍樣式 -->
								<div class="container-login100-form-btn">
									<div class="wrap-login100-form-btn">
										<div class="login100-form-bgbtn"></div>
										<button id="set_cheat_btn" onclick="setCheat()" class="login100-form-btn">
											送出內定名單
										</button>
									</div>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!-- index2.jsp 顯示Div -->
			<div id="div0"></div>
			<!-- reuslt.jsp 顯示Div -->
			<div id="div1" class="cheatForm"></div>
		</div>
		<script>
			var cheatList = new Array();

			// 設定內定人選
			function setCheat() {
				document.getElementById("cheatTable").style.display = 'none';

				var tab = document.getElementById("tb2");
				var rows = tab.rows;
				for (var i = 0; i < rows.length - 1; i++) {
					var reward = rows[i].cells[0].children[0].value.trim();
					var name = rows[i].cells[1].children[0].value.trim();
					var cheatData = {
						CHEAT_REWARD: reward,
						CHEAT_NAME: name
					}
					if (reward.length != 0 && name.length != 0) {
						cheatList.push(cheatData);
					}
				}
				// alert("內定共: " + cheatList.length);
				var request = $.ajax({
					type: "POST",
					url: "/cheat",
					data: "",
					contentType: "application/json; charset=UTF-8",
					async: false, // 設定同步 預設true 非同步 防止alert前就先跳頁
					success: function (data) {
						console.log('data', data);
						alert("內定人員設定完畢！");
						$("#cheatFormDiv").attr("hidden", true);
						$("#div0").html(data);
					},
					error: function (data) {
						alert("error");
					}
				});
			}

			// 增加獎品欄位
			function add() {
				var trObj = document.createElement("tr");
				trObj.id = new Date().getTime();
				trObj.innerHTML =
					"<td class='col-xs-5'><input class='form-control input-sm' id='reward' value=''/></td>"
					+ "<td class='col-xs-2'><select class='form-control input-sm selectpicker' id = 'count'>"
					+ "<option>1</option>"
					+ "<option>2</option>"
					+ "<option>3</option>"
					+ "<option>4</option>"
					+ "<option>5</option>"
					+ "<option>6</option>"
					+ "<option>7</option>"
					+ "<option>8</option>"
					+ "<option>9</option>"
					+ "<option>10</option>"
					+ "</select></td>"
					+ "<td class='col-xs-2'><button onclick='del(this)' class='index2Btn'>刪除</button></td>";
				document.getElementById("tb").appendChild(trObj);
				var index2Contain = document.getElementById("index2Contain");
				var index2ContainStyle = window.getComputedStyle(index2Contain);
				var heightOfindex2ContainStyle = index2ContainStyle.getPropertyValue('height').replace('px', '');
				index2Contain.style.height = (parseInt(heightOfindex2ContainStyle) + 40).toString() + 'px';
			}

			// 刪除當前獎品欄位
			function del(obj) {
				debugger;
				var trId = obj.parentNode.parentNode.id;
				var trObj = document.getElementById(trId);
				document.getElementById("tb").removeChild(trObj);

				var index2Contain = document.getElementById("index2Contain");
				var index2ContainStyle = window.getComputedStyle(index2Contain);
				var heightOfindex2ContainStyle = index2ContainStyle.getPropertyValue('height').replace('px', '');
				index2Contain.style.height = (parseInt(heightOfindex2ContainStyle) - 40).toString() + 'px';
			}

			function getRewards() {
				var rewards = new Array();
				var tab = document.getElementById("tb");
				var rows = tab.rows;
				alert("獎項共: " + rows.length);
				for (var i = 0; i < rows.length; i++) {
					var rewardData = {
						REWARD: rows[i].cells[0].children[0].value,
						COUNT: rows[i].cells[1].children[0].value
					}
					rewards.push(rewardData);
				}
				return rewards;
			}

			// 送出 抽獎
			function sendFun() {
				var url = document.getElementById("url").value;
				// var tag = document.getElementById("tag").value;
				//var keyword = document.getElementById("keyword").value;
				if (url.length == 0) {
					alert("請輸入網址喔！");
				} else {
					var tag = "0";
					var keyword = "";
					var repeat = document.getElementById("repeat").checked ? "1"
						: "0";
					var rewards = getRewards();

					var data = {
						URL: url,
						TAG: tag,
						KEYWORD: keyword,
						REPEAT: repeat,
						REWARDS: rewards,
						CHEAT_LIST: cheatList
					};
					var request = $.ajax({
						type: "POST",
						url: "/send",
						data: JSON.stringify(data),
						contentType: "application/json; charset=UTF-8",
					}).done(function (data) {
						$("#div0").attr("hidden", true);
						$("#div1").html(data);
						settingResultPageHeight();
					}).fail(function () {
						alert("中獎人不重複時，獎項多於中獎人數！");
						location.reload();
					});
					// .always(function () {
					//   alert("complete");
					// });
					var index2Contain = document.getElementById("index2Contain");
					index2Contain.hidden = true;
					var picking = document.getElementById("picking");
					picking.hidden = false;
				}
			}

			function settingResultPageHeight() {
				var picking = document.getElementById("picking");
				picking.hidden = true;
				var numOfTr = document.getElementById('resultTable').getElementsByTagName('tr').length;
				console.log('行數:', numOfTr);
				var tr_height = ((parseInt(numOfTr) + 1) * 25);
				console.log('高:', tr_height);
				// 當行數的高度 > 原本高度 再去重算高度 否則就設400px
				if (tr_height > 400) {
					document.getElementById('resultContain').style.height = (((parseInt(numOfTr) + 3) * 25) + 25).toString() + 'px';
				} else {
					document.getElementById('resultContain').style.height = '400px';
				}
			}
		</script>
	</body>


	</html>