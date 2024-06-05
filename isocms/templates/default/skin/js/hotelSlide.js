$(document).ready(function(){



	$('.owl-carousel_overview').owlCarousel({

		items: 4,
        margin: 32,

        loop: true,

        nav: true,

        dots: false,

        autoplay: false,

        autoplayTimeout: 3000,

        smartSpeed: 1000,

        navText: ["<i class='fa fa-chevron-left fa-2xl'></i>", "<i class='fa fa-chevron-right fa-2xl'></i>"],

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 2

            },

            1000: {

                items: 4

            }

        }

    });



    $('.owl-carousel_overview2').owlCarousel({

        margin: 0,

        center: true,

        loop: true,

        nav: true,

        dots: false,

         autoplay: false,

        autoplayTimeout: 3000,

        smartSpeed: 1000,

        navText: false,

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 2

            },

            1000: {

                items: 3

            },

            1280: {

                items: 4

            },

            1920: {

                items: 4

            }

        }

    });

    $('.owl-carousel_overview3').owlCarousel({

        margin: 32,

        center: true,

        loop: true,

        nav: true,

        dots: false,

         autoplay: false,

        autoplayTimeout: 3000,

        smartSpeed: 1000,

        navText: ["<i class='fa fa-chevron-left fa-2xl'></i>", "<i class='fa fa-chevron-right fa-2xl'></i>"],

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 1

            },

            800: {

                items: 2

            },

            1000: {

                items: 3

            },

            1280: {

                items: 3

            }

        }

    });





    $('.owl-carousel_overview4').owlCarousel({

        margin: 36,

        center: true,

        loop: true,

        nav: true,

        dots: false,

        autoplay: true,

        autoplayTimeout: 3000,

        smartSpeed: 1000,

        navText: ["<i class='fa fa-chevron-left fa-2xl'></i>", "<i class='fa fa-chevron-right fa-2xl'></i>"],

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 1

            },

            800: {

                items: 2

            },

            1000: {

                items: 3

            },

            1380: {

                items: 4

            }

        }

    });



    $('.owl-carousel_overview5').owlCarousel({

        margin: 36,

        center: true,

        loop: true,

        nav: true,

        dots: false,

        autoplay: true,

        autoplayTimeout: 3000,

        smartSpeed: 1000,

        navText: ["<i class='fa fa-chevron-left fa-2xl'></i>", "<i class='fa fa-chevron-right fa-2xl'></i>"],

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 1

            },

            800: {

                items: 2

            },

            1000: {

                items: 3

            },

            1380: {

                items: 3

            }

        }

    });



    $('.owl-carousel_overviewReviews').owlCarousel({

        margin: 36,

        center: true,

        loop: true,

        nav: true,

        dots: false,

        autoplay: true,

        autoplayTimeout: 3000,

        smartSpeed: 1000,

        navText: ["<i class='fa fa-chevron-left fa-2xl'></i>", "<i class='fa fa-chevron-right fa-2xl'></i>"],

        responsive: {

            0: {

                items: 1

            },

            600: {

                items: 1

            },

        }

    });



});