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
					<s:property value="lgView.getId('013')+lgView.getId('053')" />
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
							<div class="btn-group" role="group" aria-label="Basic example">
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
					<s:property value="lgView.getId('013')+lgView.getId('003')" />
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
										<s:property value="lgView.getId('013')" />
									</th>
									<th>
										<s:property value="lgView.getId('044')" />
									</th>
									<th>
										<s:property value="lgView.getId('015')" />
									</th>
									<th>
										<s:property value="lgView.getId('016')" />
									</th>
									<th>
										<s:property value="lgView.getId('002')" />
									</th>
									<th>
										<s:property value="lgView.getId('010')" />
									</th>
									<th>
										<s:property value="lgView.getId('017')" />
									</th>
									<th>
										<s:property value="lgView.getId('012')" />
									</th>
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
									<td>{{ val.Reserve }}</td>
									<td>{{ val.Purchase +'/'+ val.Sell }}</td>
									<td>{{ val.Cost }}</td>
									<td>{{ val.Price }}</td>
									<td>{{ val.FactoryName }}</td>
									<td>{{ val.Remark }}</td>
									<td>{{ val.CreateWho }}</td>
									<td>{{ val.UpdateDate }}</td>
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
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalLabel">
							<s:property value="lgView.getId('029')+ lgView.getId('035')" />
						</h5>
					</div>
					<form id="addForm" class="mb-0">
						<div class="modal-body">
							<div class="rounded border border-light pr-2 pl-2" v-for="(dv, di) in addModal.dataList" :key="di">
								<div class="form-group row">
									<div class="col-md-3">
										<label class="col-form-label">
											<s:property value="lgView.getId('005')" />
										</label>
										<input v-model="dv.Id" class="form-control" type="text" placeholder="0">
									</div>
									<div class="col-md-5">
										<label class="col-form-label">
											<s:property value="lgView.getId('006')" />
										</label>
										<input v-model="dv.Name" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('006')" />" required>
									</div>
									<div class="col-md-4">
										<label class="col-form-label">
											<s:property value="lgView.getId('002')" />
										</label>
										<select v-model="dv.Factory" class="form-control selectpicker show-tick" data-live-search="true" data-size="5">
											<option value="" v-for="(v, i) in factorysList" :key="i" v-text="v.label" :value="v.val"></option>
										</select>
									</div>
								</div>
								<div class="form-group row mb-2">

									<div class="col-md-3">
										<label class="col-form-label">
											<s:property value="lgView.getId('013')" />
										</label>
										<input v-model="dv.Reserve" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('013')" />">
									</div>
									<div class="col-md-2">
										<label class="col-form-label">
											<s:property value="lgView.getId('015')" />
										</label>
										<input v-model="dv.Cost" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('015')" />">
									</div>
									<div class="col-md-2">
										<label class="col-form-label">
											<s:property value="lgView.getId('016')" />
										</label>
										<input v-model="dv.Price" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('016')" />">
									</div>
									<div class="col-md-3">
										<label class="col-form-label">
											<s:property value="lgView.getId('010')" />
										</label>
										<textarea v-model="dv.Remark" class="form-control" type="text" placeholder="<s:property value="lgView.getId('010')" />" rows="1"></textarea>
									</div>
									<div class="col-md-2">
										<div class="btn-group" role="group">
											<button class="btn btn-outline-secondary" type="button">
												<i class="fa fa-plus fa-lg"></i>
											</button>
											<button class="btn btn-outline-secondary" type="button">
												<i class="fa fa-minus fa-lg"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="container">
								<div class="row">
									<div class="col-6 justify-content-start">
										<label class="col-form-label">
											<s:property value="lgView.getId('024') + ' :'" />
											{{ totalCost }}
											<s:property value="lgView.getId('043') + ' :'" />
											{{ totalPrice }}
										</label>
									</div>
									<div class="col-6 justify-content-end">
										<div class="float-right">
											<button class="btn btn-secondary" type="button" data-dismiss="modal">
												<s:property value="lgView.getId('028')" />
											</button>
											<button class="btn btn-primary text-white">
												<s:property value="lgView.getId('031')" />
											</button>
										</div>
									</div>
								</div>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

		<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="ModalLabel">
							<s:property value="lgView.getId('004')+ lgView.getId('013')" />
							{{ '- ' + editModal.data.Id }}
						</h5>
					</div>
					<form id="editForm" class="mb-0">
						<div class="modal-body ">
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('006')" />
								</label>
								<div class="col-sm-9">
									<input v-model="editModal.data.Name" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('035') + lgView.getId('006')" />"
										required>
								</div>
							</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label">
									<s:property value="lgView.getId('002')" />
								</label>
								<div class="col-sm-9">
									<select v-model="editModal.data.Factory" class="form-control selectpicker show-tick" data-live-search="true" data-size="5">
										<option value="" v-for="(v, i) in factorysList" :key="i" v-text="v.label" :value="v.val"></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<div class="form-row">
									<div class="col-md-4">
										<label class="col-form-label">
											<s:property value="lgView.getId('013')" />
										</label>
										<div>
											<input v-model="editModal.data.Reserve" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('013')" />" required>
										</div>
									</div>
									<div class="col-md-4">
										<label class="col-form-label">
											<s:property value="lgView.getId('015')" />
										</label>
										<div>
											<input v-model="editModal.data.Cost" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('038')" />" required>
										</div>
									</div>
									<div class="col-md-4">
										<label class="col-form-label">
											<s:property value="lgView.getId('016')" />
										</label>
										<div>
											<input v-model="editModal.data.Price" class="form-control" type="text" placeholder="<s:property value="lgView.getId('032') + lgView.getId('039')" />" required>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label>
									<s:property value="lgView.getId('010')" />
								</label>
								<textarea v-model="editModal.data.Remark" class="form-control" placeholder=""></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary " type="button" data-dismiss="modal">
								<s:property value="lgView.getId('028')" />
							</button>
							<button class="btn btn-primary text-white ">
								<s:property value="lgView.getId('031')" />
							</button>
						</div>
					</form>
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
				pageC.pageCounts = Math
						.ceil((pageC.totalRecord / pageC.showRecord));
			}
		},
		mounted : function() {

		},
		methods : {
			add : function(e) {
				modalControl.addModal.dataList = [ {
					Reserve : 0,
					Factory : '',
					Cost : 0,
					Name : '',
					Remark : '',
					Price : 0,
					Id : ''
				} ]
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
			list : JSON.parse(`${ request.dataList }`),
		},
		computed : {
			showData : function() {
				var pageC = pageControl;
				var toolC = toolControl;
				var tmp = this.list;
				tmp = $.map(tmp, function(val, key) {
					var ma = new RegExp(".*" + toolC.superSearchInput + ".*",
							"i");
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
			factorys : JSON.parse(`${ request.factorys }`),
			editModal : {
				data : {},
			},
			addModal : {
				dataList : [ {} ],
			}
		},
		computed : {
			factorysList : function() {
				var tmp = $.map(this.factorys, function(v, key) {
					return {
						label : v.Id + ' - ' + v.Name,
						val : v.Id,
					}
				})
				return tmp;
			}, 
			totalPrice : function(){
				var tmp = 0;
				$.each(this.addModal.dataList, function(idx, val){
					tmp += val.Price;
				})
				return tmp;
			}, 
			totalCost : function(){
				var tmp = 0;
				$.each(this.addModal.dataList, function(idx, val){
					tmp += parseFloat(val.Cost);
				})
				return tmp;
			}
		},
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