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
								<button class="btn btn-outline-secondary btn-lg" type="button" @click="list">
									<i class="fa fa-list-ol fa-5x"></i>
								</button>
								<button class="btn btn-outline-secondary btn-lg disabled" type="button" @click="edit">
									<i class="fa fa-pencil fa-5x"></i>
								</button>
								<button class="btn btn-outline-secondary btn-lg" type="button" @click="del">
									<i class="fa fa-minus fa-5x"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="card-header">
					<i class="fa fa-handshake-o"></i>
					<s:property value="lgView.getId('019')+lgView.getId('003')" />
				</div>
				<div class="card-body pb-0">
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
									<td>
										<div class="form-group form-check" :id="val.Id">
											<input v-model="val.checked" class="form-check-input" type="checkbox">
										</div>
									</td>
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
						<div class="mr-3 ml-3">
							<div class="row">
								<div class="col-6 justify-content-start">
									<label class="col-form-label" id="total-control"> {{ totalMsg }} </label>
								</div>
								<div class="col-6 justify-content-end">
									<div class="float-right">
										<jsp:include page="/jsp/common/pageList.jsp"></jsp:include>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->

	</div>
	<div id="modal-control">
		<!-- DayListPage -->
		<div class="modal fade" id="listModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">
							<s:property value="lgView.getId('040')" />
						</h5>
					</div>
					<form id="listForm" class="mb-0" @submit="listSubmit">
						<div class="modal-body">
							<div class="rounded border border-light pr-2 pl-2" v-for="(dv, di) in list.dataList" :key="di">
								<div class="form-group row">
									<div class="col-md-3">
										<label class="col-form-label">
											<font :class="dv.Color">{{ dv.StatusName }}</font>
											<s:property value="lgView.getId('036')" />
										</label>
										<select v-model="dv.ConsumerId" class="form-control selectpicker show-tick" data-style="btn-outline-dark text-body" data-live-search="true"
											data-size="5" @change="consumerListOnChange(di)" required>
											<option value="" v-for="(v, i) in consumerList" :key="i" v-text="v.label" :value="v.val"></option>
										</select>
									</div>
									<div class="col-md-9">
										<button class="close close-danger" type="button" v-if="list.dataList.length > 1" @click="listDelData(di)">
											<span aria-hidden="true">×</span>
										</button>
										<button class="close close-primary" type="button" @click="listAddData(di)">
											<span aria-hidden="true">+</span>
										</button>
										<label class="col-form-label">
											<font :class="dv.Color">{{ dv.StatusName }}</font>
											<s:property value="lgView.getId('035')" />
										</label>
										<select v-model="dv.GoodsId" class="form-control selectpicker show-tick" data-style="btn-outline-dark text-body" data-live-search="true"
											data-size="5" required>
											<option value="" v-for="(v, i) in reserveList" :key="i" v-text="v.label" :value="v.val"></option>
										</select>
									</div>

								</div>
								<div class="form-group row mb-2">
									<div class="col-md-3">
										<label class="col-form-label">
											<font :class="dv.Color">{{ dv.StatusName }}</font>
											<s:property value="lgView.getId('037')" />
										</label>
										<input v-model="dv.SellDate" class="form-control" type="date" required>
									</div>
									<div class="col-md-3">
										<label class="col-form-label">
											<font :class="dv.Color">{{ dv.StatusName }}</font>
											<s:property value="lgView.getId('024')" />
										</label>
										<input v-model="dv.Qty" class="form-control" type="text" required>
									</div>
									<div class="col-md-3">
										<label class="col-form-label">
											<font :class="dv.Color">{{ dv.StatusName }}</font>
											<s:property value="lgView.getId('016')" />
										</label>
										<input v-model="dv.Price" class="form-control" type="text" required>
									</div>
									<div class="col-md-3">
										<label class="col-form-label">
											<font :class="dv.Color">{{ dv.StatusName }}</font>
											<s:property value="lgView.getId('010')" />
										</label>
										<input v-model="dv.Remark" class="form-control" type="text">
									</div>
								</div>
								<div class="form-group row mb-2"></div>
							</div>
						</div>
						<div class="modal-footer">
							<div class="container">
								<div class="row">
									<div class="col-6 justify-content-start b">
										<label class="col-form-label">
											<s:property value="lgView.getId('024') + ' :'" />
											<font class="text-danger">{{ totalQty.I }}</font>
											/
											<font class="text-info">{{ totalQty.O }}</font>
											<s:property value="lgView.getId('043') + ' :'" />
											<font class="text-danger">{{ totalPrice.I }}</font>
											/
											<font class="text-info">{{ totalPrice.O }}</font>
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
	</div>
</body>

<script type="text/javascript">
	var toolControl = new Vue({
		el : '#tool-control',
		name : 'ToolControl',
		data : {
			searchConsumer : [ '001' ],
			searchStatus : [ 'I', 'O' ],
			searchDate : [ '', '' ],
			superSearchInput : '',
			consumers : JSON.parse(`${ request.consumers }`),
			reserve : JSON.parse(`${ request.reserve }`),
			statusMap : {
				'D' : {
					text : `${ lgView.getId('020') }`,
					color : 'text-danger'
				},
				'S' : {
					text : `${ lgView.getId('014') }`,
					color : 'text-info'
				},
			}
		},
		computed : {
			searchList : function() {
				return {
					consumer : this.consumers,
					status : [ {
						val : 'I',
						label : `${ lgView.getId('020') }`
					}, {
						val : 'O',
						label : `${ lgView.getId('014') }`
					} ],

				}
			},
			consumerMap : function() {
				var tmp = {}
				$.each(this.consumers, function(idx, val) {
					tmp[val.Id] = val
				})
				return tmp;
			}
		},
		watch : {
			searchConsumer : function(nV, oV) {
				dataControl.updPageControl();
			},
			searchStatus : function(nV, oV) {
				dataControl.updPageControl();
			},
			searchDate : function(nV, oV) {
				dataControl.updPageControl();
			},
			superSearchInput : function(nV, oV) {
				dataControl.updPageControl();
			}
		},
		mounted : function() {

		},
		methods : {
			list : function() {
				$('#listModal').modal('toggle')
			},
			edit : function() {

			},
			del : function(e) {
				var checkedData = this.getCheckedData(true);
				if (!checkedData) {
					g.showMsg('error', 'choose one !!')
					return;
				}
				$.each(checkedData, function(idx, val) {
					var checkedId = val.Item
					g.ajax("transactionGoods", {
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
	var totalControl = new Vue({
		el : '#total-control',
		name : 'TotalControl',
		data : {
			message : `${ lgView.getId('051') }`,
			totalMsg : '',
		},
		computed : {},
		mounted : function() {
		},
		methods : {},
	})
	var dataControl = new Vue({
		el : '#data-control',
		name : 'DataControl',
		data : {
			list : JSON.parse(`${request.dataList}`),
			consumers : JSON.parse(`${ request.consumers }`),
			reserve : JSON.parse(`${ request.reserve }`),
		},
		computed : {
			showData : function() {
				var toolC = toolControl;
				var tmp = this.list;
				var count = {}
				var sum = 0;
				var total = 0
				tmp = $.map(tmp, function(val, key) {
					var ma = new RegExp(".*" + toolC.superSearchInput + ".*", "i");
					var sConsumer = toolC.searchConsumer
					var sStatus = toolC.searchStatus
					var sSellDate = toolC.searchDate

					var re = (ma.test(JSON.stringify(val)));
					if (sConsumer.length > 0)
						re = re * (sConsumer.includes(val.ConsumerId));
					if (sStatus.length > 0)
						re = re * (sStatus.includes(val.Status));
					if (sSellDate[0])
						re = re * (new Date(val.SellDate) >= new Date(sSellDate[0]));
					if (sSellDate[1])
						re = re * (new Date(val.SellDate) <= new Date(sSellDate[1]));
					if (re) {
						count[val.GoodsId] = true
						sum += parseInt(val.Amount)
						total += parseFloat(val.Price)
						return val;
					}
				})
				totalControl.totalMsg = String.format(totalControl.message, Object.keys(count).length, sum, total.format(2, '.', ','))
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
			},
		},
		mounted : function() {
			this.updPageControl();
		},
		methods : {
			delData : function(id) {
				this.list = $.map(this.list, function(val, key) {
					if (val.Item != id)
						return val;
				})
			},
			updPageControl : function() {
				var pageC = pageControl;
				pageC.currentPage = 1;
				pageC.totalRecord = this.showData.length;
				pageC.pageCounts = Math.ceil((pageC.totalRecord / pageC.showRecord));
			}
		},
	})
	var modalControl = new Vue({
		el : '#modal-control',
		name : 'ModalControl',
		data : {
			list : {
				dataList : [ {

				} ],
				template : {
					ConsumerId : '',

				},
			},
			edit : {
				data : {},
			},
			selectCount : 0,
		},
		computed : {
			consumerList : function() {
				var tmp = $.map(toolControl.consumers, function(v, key) {
					return {
						label : v.Id + ' - ' + v.Name,
						val : v.Id,
					}
				})
				return tmp;
			},
			reserveList : function() {
				var tmp = $.map(toolControl.reserve, function(v, key) {
					return {
						label : v.Id + ' - ' + v.Name,
						val : v.Id,
					}
				})
				return tmp;
			},
			totalQty : function() {
				var tmp = {
					D : 0,
					S : 0,
				}
				$.each(this.list.dataList, function(idx, val) {
					var temp = isNaN(parseFloat(val.Qty)) ? 0 : parseFloat(val.Qty);
					if (val.ConsumerId) {
						var status = toolControl.consumerMap[val.ConsumerId].Status;
						tmp[status] += temp;
					}
				})
				tmp = {
					I : isNaN(tmp.D.toFixed(0)) ? 0 : tmp.D.toFixed(0),
					O : isNaN(tmp.S.toFixed(0)) ? 0 : tmp.S.toFixed(0),
				}
				return tmp
			},
			totalPrice : function() {
				var tmp = {
					D : 0,
					S : 0,
				}
				$.each(this.list.dataList, function(idx, val) {
					var tempQty = isNaN(parseFloat(val.Qty)) ? 0 : parseFloat(val.Qty);
					var tempPrice = isNaN(parseFloat(val.Price)) ? 0 : parseFloat(val.Price);

					if (val.ConsumerId) {
						var status = toolControl.consumerMap[val.ConsumerId].Status;
						tmp[status] += tempPrice * tempQty;
					}

				})
				tmp = {
					I : isNaN(tmp.D.toFixed(0)) ? 0 : tmp.D.toFixed(0),
					O : isNaN(tmp.S.toFixed(0)) ? 0 : tmp.S.toFixed(0),
				}
				return tmp
			}
		},
		updated : function() {
			if ($('.selectpicker').length != this.selectCount) {
				$('.selectpicker').selectpicker('refresh');
				this.selectCount = $('.selectpicker').length
			}
		},
		mounted : function() {
			var vm = this;
			$('#listModal').on('show.bs.modal', function(e) {
				$('.selectpicker').selectpicker('refresh');
			})
			$('#listModal').on('hidden.bs.modal', function(e) {
				vm.list.dataList = [ Object.assign({}, vm.list.template) ]
			})
		},
		methods : {
			consumerListOnChange : function(idx) {
				var tmp = toolControl.consumerMap[this.list.dataList[idx].ConsumerId].Status;
				this.list.dataList[idx].Status = tmp
				this.list.dataList[idx].StatusName = toolControl.statusMap[tmp].text
				this.list.dataList[idx].Color = toolControl.statusMap[tmp].color
			},
			listAddData : function(idx) {
				var tmp = Object.assign({}, this.list.template)
				this.list.dataList.splice((idx + 1), 0, Object.assign(tmp, {
					SellDate : this.list.dataList[idx].SellDate,
					ConsumerId : this.list.dataList[idx].ConsumerId,
					Color : this.list.dataList[idx].Color,
					StatusName : this.list.dataList[idx].StatusName,
					Status : this.list.dataList[idx].Status,
				}))
			},
			listDelData : function(idx) {
				this.list.dataList.splice(idx, 1)
			},
			listSubmit : function(e) {
				e.preventDefault();
				var vm = this
				g.ajax("transactionGoods", {
					list : vm.list.dataList
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