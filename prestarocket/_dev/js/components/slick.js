import $ from 'jquery';


export default class SlickSlider {
    init() {
        $('[data-slick]').not('.slick-initialized').each(function() {
            let self = $( this );
            if(self.data('count') === 1){
                return;
            }

            self.slick({
                    lazyLoad: 'ondemand'
                });
        });
    }


}
