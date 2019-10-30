var responsiveSlider = function(){
    var slider = document.getElementById("slider");
    var sliderWidth = slider.offsetWidth;
    var sliderList = document.getElementById("sliderWrap");
    var count = 1;
    var items = sliderList.querySelectorAll("li").length;
    var prev = document.getElementById("prev");
    var next = document.getElementById("next");
    
    var lists = sliderList.querySelectorAll("li");
    for(var i = 0; i < items; i++){
        var list = lists.item(i);
        list.style.width = sliderWidth + "px";
    }
    
    window.addEventListener('resize', function(){
        sliderWidth = slider.offsetWidth;
    });

    var prevSlider = function(){
        
        if(count > 1){
            count = count - 2;
            sliderList.style.left= "-" + count*sliderWidth + "px";
            count++;
        }

        else if(count == 1){
            sliderList.style.left = "-" + ( items-1)*sliderWidth + "px";
            count = items;
        }
        
    };

    var nextSlider = function(){
        
        if(count < items){
            sliderList.style.left = "-" + count * sliderWidth + "px";
            count++;
        }
        else if(count == items){
            sliderList.style.left = "0px";
            count = 1;
        }
        
    };

    next.addEventListener("click", function(){
        nextSlider();
    });

    prev.addEventListener("click", function(){
        prevSlider();
    });
};

var scrollProgess = function(){
    var bodyEI = document.querySelector('body');
    var bodyHeight = bodyEI.offsetHeight+250; /*+250 이유 slider:hover 250+250이므로*/ 
    var scrollable = bodyHeight - window.innerHeight;
    var progressEI = document.querySelector('.progress');
    var per = Math.floor(window.scrollY / scrollable*100) + '%';
    progressEI.style.width = per;
};

window.addEventListener('scroll', scrollProgess);
window.onload = function()
    responsiveSlider();
    
}