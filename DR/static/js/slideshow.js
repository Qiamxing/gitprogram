$(function () {
        var num = 1;

        var inter =   setInterval(function () {
            num = num +1;
            show();
            },500);

        show = function () {
            num %= 4 ;
            var imgsrc = $('#list img').attr('src',"/static/images/2016-"+ String((num+1))+".jpg");
        };

        $(".banner").hover(function () {
                clearInterval(inter)
            }
            ,function () {
            inter = setInterval(function () {
            num = num +1;
            show();
            },500)}
            );


        $("#pre").click(
            function () {
                num += 3;
            show();
            }
        );
        $("#next").click(
            function () {
                num += 1;
            show();
            })

    }
);