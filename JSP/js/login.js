$(function () {
	
    //rolling Slide
    var $wrap = $(".bannerBox"),
        $rollingContain = $wrap.find(".slide"),
        
        bannerLen = $(".slide a").length,
        bannerWidth = $(".slide a").width(),
        currentIndex = 1,
        duration = 200,
        easing = "swing",
        interval = 8000,
        timer;
    
    function showBannerAt (index){
        $rollingContain.stop().animate({left: -100 * index + "%"}, duration, easing, function(){
            function nPosition(){
                $rollingContain.css("left", -100 * index + "%");
            }
            if (index < 1){
                index = bannerLen;
                nPosition();
            } else if (index > bannerLen){
                index = 1;
                nPosition();
            }
            currentIndex = index;
            page_nav();
        });
    }
    
    function page_nav (){
        $(".paging span").each(function(){
            if($(this).hasClass("on")){
                $(this).removeClass("on");
            }
            $(".paging span").eq(currentIndex-1).addClass("on");
        });
    }
    
    $(".paging span").on("click", function(event){
        event.preventDefault();
        $(".paging span").each(function(){
            if($(this).hasClass("on")){
                $(this).removeClass("on");
            }
        });
        $(this).addClass("on");
        showBannerAt($(this).index()+1);
    });
    
    function startTimer () {
        timer = setInterval(function () {
            var nextIndex = currentIndex + 1;
            showBannerAt(nextIndex);
        }, interval);
    }
    
    function stopTimer () {
        clearInterval(timer);
    }
    
    
    $rollingContain.prepend($(".slide a").last().clone());
    $rollingContain.append($(".slide a").eq("1").clone());
    
    $rollingContain.css({"left": -bannerWidth});
    
    startTimer();

});	