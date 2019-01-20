$(
    function () {
        $('#pay').click(function () {

            data ={
                'orderid':$(this).attr('orderid')
            }
            $.get('../pay/',data,function (response) {
                window.open(response.alipayurl,target='_self')
            })
        })
    }
)