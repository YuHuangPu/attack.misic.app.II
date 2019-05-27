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
					<s:property value="lgView.getId('019')+lgView.getId('053')" />
				</div>
				<div class="card-body" id="tool-control">
					<div class="row">
						<div class="col-auto mr-auto">
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fa fa-search "></i>
										&nbsp;
										<s:property value="lgView.getId('055')" />
									</span>
								</div>
								<select v-model="searchConsumer" class="form-control selectpicker show-tick" data-selected-text-format="count > 5"
									data-style="btn-outline-dark text-body" data-live-search="true" data-size="7" multiple title="Chose ...">
									<option value="" v-for="(v, i) in searchList.consumer" :key="i" v-text="v.Name" :value="v.Id"></option>
								</select>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fa fa-search "></i>
										&nbsp;
										<s:property value="lgView.getId('056')" />
									</span>
								</div>
								<select v-model="searchStatus" class="form-control selectpicker show-tick" data-style="btn-outline-dark text-body" data-live-search="true"
									data-size="5" multiple title="Chose ...">
									<option value="" v-for="(v, i) in searchList.status" :key="i" v-text="v.label" :value="v.val"></option>
								</select>
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fa fa-search "></i>
										&nbsp;
										<s:property value="lgView.getId('057')" />
									</span>
								</div>
								<input v-model="searchDate[0]" class="form-control" type="date">
								<h5>~</h5>
								<input v-model="searchDate[1]" class="form-control" type="date">
							</div>
							<div class="input-group">
								<div class="input-group-prepend">
									<span class="input-group-text">
										<i class="fa fa-search "></i>
										&nbsp;
										<s:property value="lgView.getId('054')" />
									</span>
								</div>
								<input v-model="superSearchInput" class="form-control" type="text">
							</div>
						</div>
						<div class="col-auto  align-self-center">
							<div class="btn-group " role="group">
								<button class="btn btn-outline-secondary btn-lg" type="button">
									<i class="fa fa-cart-arrow-down fa-5x"></i>
								</button>
								<button class="btn btn-outline-secondary btn-lg" type="button">
									<i class="fa fa-truck fa-5x"></i>
								</button>
								<button class="btn btn-outline-secondary btn-lg" type="button">
									<i class="fa fa-list-ol fa-5x"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-header">
					<i class="fa fa-handshake-o"></i>
					<s:property value="lgView.getId('019')+lgView.getId('003')" />
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>
										<s:property value="lgView.getId('005')" />
									</th>
									<th>
										<s:property value="lgView.getId('006')" />
									</th>
									<th>
										<s:property value="lgView.getId('055')" />
									</th>
									<th>
										<s:property value="lgView.getId('056')" />
									</th>
									<th>
										<s:property value="lgView.getId('024')" />
									</th>
									<th>
										<s:property value="lgView.getId('042')" />
									</th>
									<th>
										<s:property value="lgView.getId('010')" />
									</th>
									<th>
										<s:property value="lgView.getId('057')" />
									</th>
								</tr>
							</thead>
							<tbody id="data-control">
								<tr v-for="(val, idx) in showDataList" :key="idx">
									<td>{{ val.GoodsId }}</td>
									<td>{{ val.GoodsName }}</td>
									<td>{{ val.ConsumerName }}</td>
									<td>{{ val.StatusText }}</td>
									<td>{{ val.Amount }}</td>
									<td>{{ val.Price }}</td>
									<td>{{ val.Remark }}</td>
									<td>{{ val.SellDate }}</td>
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
			searchConsumer : JSON.parse(`${ request.consumers }`),
			searchStatus : [ 'I', 'O' ],
			searchDate : JSON.parse(`${ request.dateRange }`),
			superSearchInput : '',
			searchList : {
				consumer : JSON.parse(`${ request.consumerList }`),
				status : [ {
					val : 'I',
					label : `${ lgView.getId('020') }`
				}, {
					val : 'O',
					label : `${ lgView.getId('014') }`
				} ],

			}
		},
		computed : {

		},
		watch : {
			searchConsumer : function(nV, oV) {
				this.searchData();
			},
			searchStatus : function(nV, oV) {
				this.searchData();
			},
			searchDate : function(nV, oV) {
				this.searchData();
			},
			superSearchInput : function(nV, oV) {
				this.searchData();
			}
		},
		mounted : function() {

		},
		methods : {
			searchData : function() {
				var tmp = {
					searchConsumer : this.searchConsumer,
					searchStatus : this.searchStatus,
					searchDate : this.searchDate,
					superSearchInput : this.superSearchInput,
				}
				g.ajax("queryTable", tmp, {
					func : {
						success : function(res) {
							var pageC = pageControl;
							var dataC = dataControl;
							dataC.list = res.dataList;
							pageC.currentPage = 1;
							pageC.totalRecord = dataC.showData.length;
							pageC.pageCounts = Math.ceil((pageC.totalRecord / pageC.showRecord));
						}
					}
				});
			}
		},
	})
	var dataControl = new Vue({
		el : '#data-control',
		name : 'DataControl',
		data : {
			list : [],
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
			}
		},
		mounted : function() {

		},
		methods : {
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