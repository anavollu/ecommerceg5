window.onload = function(){

  let addButtons = document.querySelectorAll(".btn-add-to-cart");
		console.log(addButtons)
		for(let i = 0; i < addButtons.length; i++) {
    	addButtons[i].addEventListener('click', function(e){
			
			e.preventDefault()
			
		})
    }

}