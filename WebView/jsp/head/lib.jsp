
<!-- Icons-->
<link href="vendors/@coreui/icons/css/coreui-icons.min.css" rel="stylesheet">
<link href="vendors/flag-icon-css/css/flag-icon.min.css" rel="stylesheet">
<link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="vendors/simple-line-icons/css/simple-line-icons.css" rel="stylesheet">
<!-- Main styles for this application-->
<link href="css/style.min.css" rel="stylesheet">
<link href="css/mainCss.css" rel="stylesheet">
<link href="vendors/pace-progress/css/pace.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- CoreUI and necessary plugins-->
<script src="vendors/popper.js/js/popper.min.js"></script>
<script src="vendors/bootstrap/js/bootstrap.min.js"></script>
<script src="vendors/pace-progress/js/pace.min.js"></script>
<script src="vendors/perfect-scrollbar/js/perfect-scrollbar.min.js"></script>
<script src="vendors/@coreui/coreui/js/coreui.min.js"></script>
<!-- Plugins and scripts required by this view-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/i18n/defaults-zh_TW.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8.11.4/dist/sweetalert2.all.min.js"></script>
<style>
.swal2-title, .swal2-content {
	color: #fff
}

.close-danger {
	color: #f86c6b !important;
	text-shadow: none;
}

.close-primary {
	color: #007bff !important;
	text-shadow: none;
}
</style>
<script type="text/javascript">
	const g = {
		getUrlParams : function(o) {
			var urlparams = `${ request['javax.servlet.forward.query_string'] }`.split("&");
			var urlObj = {};
			$.each(urlparams, function(idx, val) {
				urlObj[val.split("=")[0]] = decodeURIComponent(val.split("=")[1]);
			});
			Object.assign(urlObj, o)
			delete urlObj['']
			var result = $.map(urlObj, function(val, key) {
				return key + '=' + encodeURIComponent(val);
			}).join("&");

			return '?' + result
		},
		showMsg : function(type, message) {
			return Swal.mixin({
				toast : true,
				position : 'bottom-end',
				showConfirmButton : false,
				timer : 3000,
				background : '#2f353a'
			}).fire({
				type : type,
				title : message
			});
		},
		showMoreMsg : function(type, title, text) {
			return Swal.fire({
				type : type,
				title : title,
				text : text,
				background : '#2f353a',
				confirmButtonClass : 'btn btn-outline-secondary btn-lg btn-block',
				buttonsStyling : false,
			})
		},
		ajax : function(url, data, obj) {
			return $.ajax({
				type : "post",
				url : url,
				contentType : 'application/json; charset=utf-8',
				data : JSON.stringify(data),
				dataType : "json",
				cache : false,
				beforeSend : function() {
					if (obj.btn) {
						obj.btn.prop('disabled', true);
					}
				},
				success : function(response) {
					if (!response.status) {
						g.showMoreMsg('error', 'Oops ...', 'Something error :(')
						if (obj.func && obj.func.error) {
							obj.func.error(response);
						}
					} else {
						if (obj.func && obj.func.success) {
							obj.func.success(response);
						}
						g.showMsg('success', 'Successful !')
					}
				},
				complete : function() {
					if (obj.btn) {
						obj.btn.prop('disabled', false);
					}
				},
				error : function(xhr, ajaxOptions, thrownError) {
					g.showMoreMsg('error', 'Oops ...', 'Something error :(')
				}
			});
		}
	}
	Date.prototype.format = function(fmt) {
		var o = {
			"M+" : this.getMonth() + 1,
			"d+" : this.getDate(),
			"h+" : this.getHours(),
			"m+" : this.getMinutes(),
			"s+" : this.getSeconds(),
			"q+" : Math.floor((this.getMonth() + 3) / 3),
			"S" : this.getMilliseconds()
		};

		if (/(y+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
		}

		for ( var k in o) {
			if (new RegExp("(" + k + ")").test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
			}
		}
		return fmt;
	}
	Number.prototype.format = function(c, d, t) {
		var n = this, c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "." : d, t = t == undefined ? "," : t, s = n < 0 ? "-" : "", i = String(parseInt(n = Math
				.abs(Number(n) || 0).toFixed(c))), j = (j = i.length) > 3 ? j % 3 : 0;
		return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t)
				+ (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
	};
	String.format = function() {
		var s = arguments[0];
		if (s == null)
			return "";
		for (var i = 0; i < arguments.length - 1; i++) {
			var reg = getStringFormatPlaceHolderRegEx(i);
			s = s.replace(reg, (arguments[i + 1] == null ? "" : arguments[i + 1]));
		}
		return cleanStringFormatResult(s);
	}
	String.prototype.format = function() {
		var txt = this.toString();
		for (var i = 0; i < arguments.length; i++) {
			var exp = getStringFormatPlaceHolderRegEx(i);
			txt = txt.replace(exp, (arguments[i] == null ? "" : arguments[i]));
		}
		return cleanStringFormatResult(txt);
	}
	function getStringFormatPlaceHolderRegEx(placeHolderIndex) {
		return new RegExp('({)?\\{' + placeHolderIndex + '\\}(?!})', 'gm')
	}
	function cleanStringFormatResult(txt) {
		if (txt == null)
			return "";
		return txt.replace(getStringFormatPlaceHolderRegEx("\\d+"), "");
	}
</script>