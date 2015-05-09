var Expense = {
	totalExpense: 0,
	category: "",
	resetMoney: function(){
		var self = this;
		$('#reset-money').click(function(){
			$('.amount').removeClass('btn-info');
			self.totalExpense = 0;
			$('#display-amount').text('Rs. '+self.totalExpense);
		})
	},
	resetCategory: function(){
		var self = this;
		$('#reset-category').click(function(){
			$('.category').removeClass('btn-info');
			self.category = "";
		})
	},
	bindMoneyIcon: function(){
		var self = this;
		$('.amount').click(function(event){
			$(event.target).closest('.btn').addClass('btn-info');
			self.totalExpense = self.totalExpense+parseInt($(event.target).text());
			$('#display-amount').text('Rs. '+self.totalExpense);
		});
	},
	bindCategoryIcon: function(){
		var self = this;
		$('.category').click(function(event){
			$('.category').removeClass('btn-info');
			$(event.target).closest('.btn').addClass('btn-info');
			self.category = $(event.target).text();
			$('#display-category').text(self.category);
		});
	},
	getDate: function(array){
		var input = 'expense[date('
		date = []
		array.filter(function(ar){ 
			if(ar.name.substring(0, input.length) === input){date.push(ar)}
		})
		return date[0].value+'-'+date[1].value+'-'+date[2].value;
	},
	bindExpenseForm: function(){
		var self = this;
		$('#main-expense-form').submit(function(event){
			event.preventDefault();
			postData = {expense: {}};
			postData['expense']['expense']= self.totalExpense;
			postData['expense']['sub_cat_id']= self.category;
			postData['expense']['date']= self.getDate($(event.target).serializeArray());

			$.post("/expense", postData, function(data,status){
				console.log(data,status);
			})
		})
	}
}

$(document).ready(function(){
	Expense.bindCategoryIcon();
	Expense.resetCategory();
	Expense.resetMoney();
	Expense.bindMoneyIcon();
	Expense.bindExpenseForm();
})