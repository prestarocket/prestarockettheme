import $ from 'jquery';


export default class SlickSlider {
    init() {
        $('[data-slick]').not('.slick-initialized').each(function() {
                $( this ).slick({
                    lazyLoad: 'ondemand'
                });
        });
    }


}
