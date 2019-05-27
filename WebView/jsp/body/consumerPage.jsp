<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
</style>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">
	<!-- Navigation-->
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Example DataTables Card-->
			<div class="card">
				<div class="card-header">
					<i class="fa fa-gears "></i>
					<s:property value="lgView.getId('036')+lgView.getId('053')" />
				</div>
				<div class="card-body" id="tool-control">
					<div class="row">
						<div class="col-auto mr-auto">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fa fa-search "></i>
										&nbsp;
										<s:property value="lgView.getId('054')" />
									</span>
								</div>
								<input v-model="superSearchInput" class="form-control" type="text" name="superSearchInput" autofocus>
							</div>
						</div>
						<div class="col-auto">
							<div class="btn-group" role="group">
								<button class="btn btn-outline-secondary btn-lg" type="button" @click="add">
									<i class="fa fa-plus fa-lg"></i>
								</button>
								<button class="btn btn-outline-secondary btn-lg" type="button" @click="edit">
									<i class="fa fa-pencil fa-lg"></i>
								</button>
								<button class="btn btn-outline-secondary btn-lg" type="button" @click="del">
									<i class="fa fa-minus fa-lg"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-header">
					<i class="fa fa-handshake-o"></i>
					<s:property value="lgView.getId('036')+lgView.getId('003')" />
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>
										<s:property value="lgView.getId('004')" />
									</th>
									<th>
										<s:property value="lgView.getId('005')" />
									</th>
									<th>
										<s:property value="lgView.getId('006')" />
									</th>
									<th>
										<s:property value="lgView.getId('009')" />
									</th>
									<th>
										<s:property value="lgView.getId('010')" />
									</th>
<!-- 									<th> -->
<%-- 										<s:property value="lgView.getId('017')" /> --%>
<!-- 									</th> -->
<!-- 									<th> -->
<%-- 										<s:property value="lgView.getId('018')" /> --%>
<!-- 									</th> -->
<!-- 									<th> -->
<%-- 										<s:property value="lgView.getId('011')" /> --%>
<!-- 									</th> -->
<!-- 									<th> -->
<%-- 										<s:property value="lgView.getId('012')" /> --%>
<!-- 									</th> -->
								</tr>
							</thead>
							<tbody id="data-control">
								<tr v-for="(val, idx) in showDataList" :key="idx">
									<td>
										<div class="form-group form-check" :id="val.Id">
											<input v-model="val.checked" class="form-check-input" type="checkbox">
										</div>
									</td>
									<td>{{ val.Id }}</td>
									<td>{{ val.Name }}</td>
									<td>{{ val.Mobile }}</td>
									<td>{{ val.Remark }}</td>
<!-- 									<td>{{ val.CreateWho }}</td> -->
<!-- 									<td>{{ val.CreateDate }}</td> -->
<!-- 									<td>{{ val.UpdateWho }}</td> -->
<!-- 									<td>{{ val.UpdateDate }}</td> -->
								</tr>
							</tbody>
						</table>
						<jsp:include page="/jsp/common/pageList.jsp"></jsp:include>
					</div>
				</div>
				<div class="card-footer small text-muted">
					<s:property value='#attr.MaxUpdate' />
				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->

	</div>
	<div id="modal-control">
		<!-- add page -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalLabel">
							<s:property value="lgView.getId('029')+ lgView.getId('036')" />
						</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body ">
						<form id="addForm" @submit="addModalSubmit" class="mb-0">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('005')" />
								</label>
								<div class="col-sm-9">
									<input class="form-control" v-model="addModal.data.Id" type="text" placeholder="0">
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('006')" />
								</label>
								<div class="col-sm-9">
									<input class="form-control" v-model="addModal.data.Name" type="text"
										placeholder="<s:property value="lgView.getId('032') + lgView.getId('036') + lgView.getId('006')" />" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('009')" />
								</label>
								<div class="col-sm-9">
									<input class="form-control" v-model="addModal.data.Mobile" type="text"
										placeholder="<s:property value="lgView.getId('032') + lgView.getId('036') + lgView.getId('009')" />" required>
								</div>
							</div>
							<div class="form-group">
								<label>
									<s:property value="lgView.getId('010')" />
								</label>
								<textarea class="form-control" v-model="addModal.data.Remark" type="text" placeholder=""></textarea>
							</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button" data-dismiss="modal">
									<s:property value="lgView.getId('028')" />
								</button>
								<button class="btn btn-primary text-white">
									<s:property value="lgView.getId('031')" />
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- edit page -->
		<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalLabel">
							<s:property value="lgView.getId('004')+ lgView.getId('036')" />
						</h5>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body ">
						<form id="editForm" @submit="editModalSubmit" class="mb-0">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('005')" />
								</label>
								<div class="col-sm-9">
									<input class="form-control" v-model="editModal.data.Id" type="text" placeholder="0" disabled>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('006')" />
								</label>
								<div class="col-sm-9">
									<input class="form-control" v-model="editModal.data.Name" type="text"
										placeholder="<s:property value="lgView.getId('032') + lgView.getId('036') + lgView.getId('006')" />" required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('009')" />
								</label>
								<div class="col-sm-9">
									<input class="form-control" v-model="editModal.data.Mobile" type="text"
										placeholder="<s:property value="lgView.getId('032') + lgView.getId('036') + lgView.getId('009')" />" required>
								</div>
							</div>
							<div class="form-group">
								<label>
									<s:property value="lgView.getId('010')" />
								</label>
								<textarea v-model="editModal.data.Remark" class="form-control" type="text" placeholder=""></textarea>
							</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button" data-dismiss="modal">
									<s:property value="lgView.getId('028')" />
								</button>
								<button class="btn btn-primary text-white">
									<s:property value="lgView.getId('031')" />
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	var toolControl = new Vue({
		el : '#tool-control',
		name : 'ToolControl',
		data : {
			superSearchInput : '',
		},
		computed : {

		},
		watch : {
			superSearchInput : function(nV, oV) {
				var pageC = pageControl;
				var dataC = dataControl;
				pageC.currentPage = 1;
				pageC.totalRecord = dataC.showData.length;
				pageC.pageCounts = Math.ceil((pageC.totalRecord / pageC.showRecord));
			}
		},
		mounted : function() {

		},
		methods : {
			add : function(e) {
				modalControl.addModal.data = {
					Id : '',
					Name : '',
					Remark : '',
					Mobile : '',
				}
				$('#addModal').modal('toggle')
			},
			edit : function(e) {
				var checkedData = this.getCheckedData();
				if (!checkedData) {
					g.showMsg('error', 'choose one !!')
					return;
				}
				modalControl.editModal.data = {};
				Object.assign(modalControl.editModal.data, checkedData)
				$('#editModal').modal('toggle')
			},
			del : function(e) {
				var checkedData = this.getCheckedData(true);
				if (!checkedData) {
					g.showMsg('error', 'choose one !!')
					return;
				}
				$.each(checkedData, function(idx, val) {
					var checkedId = val.Id
					g.ajax("maintainConsumer", {
						del : {
							Id : checkedId
						}
					}, {
						btn : $(e.target),
						func : {
							success : function(res) {
								dataControl.delData(checkedId);
							}
						}
					});
				})
			},
			getCheckedData : function(repeat) {
				if (!dataControl.checkedData)
					return false;
				if (repeat) {
					return dataControl.checkedData;
				} else {
					if (dataControl.checkedData.length != 1)
						return false;
					return dataControl.checkedData[0];
				}

			}
		},
	})
	var dataControl = new Vue({
		el : '#data-control',
		name : 'DataControl',
		data : {
			list : JSON.parse(`${ request.consumers }`),
		},
		computed : {
			showData : function() {
				var pageC = pageControl;
				var toolC = toolControl;
				var tmp = this.list;
				tmp = $.map(tmp, function(val, key) {
					var ma = new RegExp(".*" + toolC.superSearchInput + ".*", "i");
					if (ma.test(JSON.stringify(val)))
						return val
				})
				return tmp;
			},
			showDataList : function() {
				var pageC = pageControl;
				var tmp = this.showData;
				var range = (pageC.currentPage - 1) * pageC.showRecord
				tmp = tmp.slice(range, range + pageC.showRecord - 1)
				return tmp;
			},
			checkedData : function() {
				var tmp = $.map(this.showDataList, function(val, key) {
					if (val.checked)
						return val
				})
				return tmp;
			}
		},
		mounted : function() {

		},
		methods : {
			delData : function(id) {
				this.list = $.map(this.list, function(val, key) {
					if (val.Id != id)
						return val;
				})
			},
			updData : function(tmpData) {
				this.list = $.map(this.list, function(val, key) {
					if (val.Id == tmpData.Id)
						Object.assign(val, tmpData)
					return val;
				})
			}
		},
	})
	var modalControl = new Vue({
		el : '#modal-control',
		name : 'ModalControl',
		data : {
			editModal : {
				data : {},
			},
			addModal : {
				data : {
					Id : '',
					Name : '',
					Remark : '',
					Mobile : '',
				},
			}
		},
		computed : {},
		mounted : function() {
		},
		methods : {
			editModalSubmit : function(e) {
				e.preventDefault();
				var vm = this
				g.ajax("maintainConsumer", {
					edit : vm.editModal.data
				}, {
					btn : $(e.target).find('button[type=submit]'),
					func : {
						success : function(res) {
							dataControl.updData(vm.editModal.data);
							$('#editModal').modal('toggle')
						}
					}
				});
			},
			addModalSubmit : function(e) {
				e.preventDefault();
				var vm = this
				g.ajax("maintainConsumer", {
					add : vm.addModal.data
				}, {
					btn : $(e.target).find('button[type=submit]'),
					func : {
						success : function(res) {
							window.location.reload();
						}
					}
				});
			}
		},
	})
</script>

</html>