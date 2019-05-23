<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Area Chart Example-->
			<div class="row">
				<div class="col-lg-12">
					<!-- Example Bar Chart Card-->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-area-chart fa-lg "></i>
							<s:property value="lgView.getId('046')" />
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-sm-9 my-auto">
									<canvas id="myBarChart"></canvas>
								</div>
								<div class="col-sm-3 text-center my-auto">
									<div class="h4 mb-0 text-primary">
										<s:property value="'$'+#attr.AmountCost" />
									</div>
									<div class="small text-muted">
										<s:property value="lgView.getId('047') + ' NTD' " />
									</div>
									<hr>
									<div class="h4 mb-0 text-danger">
										<s:property value="'$'+#attr.DataMap.get('I')" />
									</div>
									<div class="small text-muted">
										<s:property value="lgView.getId('050') + ' NTD' " />
									</div>
									<hr>
									<div class="h4 mb-0 text-success">
										<s:property value="'$'+#attr.DataMap.get('O')" />
									</div>
									<div class="small text-muted">
										<s:property value="lgView.getId('048') + ' NTD' " />
									</div>
								</div>
							</div>
						</div>
						<div class="card-footer small text-muted"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="card">
						<div class="card-header">
							<i class="fa fa-hand-peace-o fa-5x fa-spin"></i>
							更新資訊 ${ version }
							<i class="fa fa-hand-peace-o fa-5x fa-spin"></i>
						</div>
						<div class="card-body">
							<blockquote class="blockquote mb-0">
								<p>${ versionDescription }</p>
								<footer class="blockquote-footer">
									黃子育
									<cite title="Source Title">${ deployDate }</cite>
								</footer>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
			<br />
		</div>
		<!-- /.container-fluid-->
	</div>
</body>
</html>

<script type="text/javascript">
$(document).ready(function(){
	var ctx = document.getElementById("myBarChart");
	var title=  ${DataMap.get('chartData').get('title')};
	var value = ${DataMap.get('chartData').get('value')};
	var max = ${DataMap.get('chartData').get('max')};
	var myLineChart = new Chart(ctx, {
	  type: 'horizontalBar',
	  data: {
	    labels: title,
	    datasets: [{
	      label: "${sessionScope.lgView.getId('049')}",
	      backgroundColor: 'rgba(54, 162, 235, 0.35)',
	      borderColor: 'rgb(54, 162, 235)',
	      borderWidth : 1, 
	      data: value,
	    }],
	  },
	  options: {
	  }
	});
	
});

</script>