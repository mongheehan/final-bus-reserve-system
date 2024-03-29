console.log("pay module.......");

var payInsertService = (function() {
	console.log("add pay........");
	
	function insert(pay, callback, error) {
	alert("JSON.stringify(pay)" + pay);
		$.ajax({
			url: '/reserve/reserve_pay',
			type: 'post',
			data: JSON.stringify(pay),	
			dataType: 'text',
			contentType : 'application/json; charset=utf-8',
			success: function(result, status, xhr) {
			alert("ajax_성공" + JSON.stringify(pay));
				if(callback) {
					callback(result);
					} 
				}, 
			error: function(xhr, status, er) {
			alert("ajax_실패" + JSON.stringify(pay))
			
				if (error) {
					error(er);
					} 
				} 
			});
		}
		
	return {
		insert : insert
	};	 
    
})();
