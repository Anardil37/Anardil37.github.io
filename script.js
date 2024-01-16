function show_sub(cat){
	event.stopPropagation();
	cat.querySelector("ul").style.display = (cat.querySelector("ul").style.display == "block") ? "none" : "block";
}
$("li:parent").attr("onclick", "show_sub(this)");
$("body").on("click", function(){
	$("nav ul").style.display = "none";
});