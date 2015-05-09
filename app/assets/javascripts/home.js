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
	bindExpenseForm: function(){
		$('#main-expense-form').submit(function(event){
			event.preventDefault();
			event
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