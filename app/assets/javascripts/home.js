var Expense = {
	totalExpense: 0,
	category: "",
	money_access_count: {},
	resetm: function(){
		$('.amount').removeClass('btn-info');
		this.totalExpense = 0;
		$('#display-amount').text('Rs. '+this.totalExpense);
	},
	resetMoney: function(){
		var self = this;
		$('#reset-money').click(function(){
			self.resetm();
			$('.badge').remove();
		})
	},
	resetc: function(){
		$('.category').removeClass('btn-info');
		this.category = "";
	},
	resetCategory: function(){
		var self = this;
		$('#reset-category').click(function(){
			self.resetc();
		})
	},
	bindMoneyIcon: function(){
		var self = this;
		$('.amount').data('counter', 0).click(function(event){			
			var counter = $(this).data('counter');
        	$(this).data('counter', counter + 1);        	
			$(event.target).closest('.btn').addClass('btn-info');
			if(parseInt($(this).data('counter'))>1){ 
				var b = $(event.target).closest('.btn').find('.badge');
				if(b.length > 0){
					b.text(parseInt($(this).data('counter')));
				}
				else{
					var badge = $('<span class="badge">'+parseInt($(this).data('counter'))+'</span>');
					$(event.target).closest('.btn').append(badge)
				}
			}
			self.totalExpense = self.totalExpense+parseInt($(event.target).text());
			key = $(event.target).text().trim();
			if(self.money_access_count[key]){
				self.money_access_count[key] = parseInt(self.money_access_count[key])+1;
			}
			else{
				self.money_access_count[key]=1;	
			}
			$('#display-amount').text('Rs. '+self.totalExpense);
		});
	},
	bindCategoryIcon: function(){
		var self = this;
		$('.category').click(function(event){
			$('.category').removeClass('btn-info');
			$(event.target).closest('.btn').addClass('btn-info');
			self.category = $(event.target).closest('.btn').data('original-title');
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
	bindBudgetIcon: function(){
		$('#budget').click(function(){
			alert("hello")
		});
	},
	bindExpenseForm: function(){
		var self = this;
		$('#main-expense-form').submit(function(event){
			event.preventDefault();
			postData = {expense: {}};
			postData['expense']['expense']= self.totalExpense;
			postData['expense']['sub_cat_id']= self.category;
			postData['expense']['count']= self.money_access_count;
			postData['expense']['date']= self.getDate($(event.target).serializeArray());	

			$.post("/expense", postData, function(data,status){
				self.resetm();
				self.resetc();
				$('.badge').remove();
				if(status=="success"){$('.text-success').text("Expense submitted successfully.");}
				setTimeout(function(){
					$('.text-success').text("");
				},3000)
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
	Expense.bindBudgetIcon();
	$(".etooltip").tooltip({placement: "bottom"});
})