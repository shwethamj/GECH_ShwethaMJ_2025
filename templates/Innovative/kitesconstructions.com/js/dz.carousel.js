/* JavaScript Document */
jQuery(document).ready(function () {
    'use strict';
    // main-silder-swiper
    if (jQuery('.main-silder-swiper').length > 0) {
        var swiper = new Swiper('.main-silder-swiper', {
            speed: 1500,
            parallax: true,
            loop: true,
            autoplay: {
                delay: 10000,
            },
            pauseOnMouseEnter: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + (index + 1) + '</span>';
                },
            },
            navigation: {
                nextEl: '.swiper-button-next1',
                prevEl: '.swiper-button-prev1',
            },
        });
    }

// main-silder-swiper
    if (jQuery('.main-silder-swiper-02').length > 0) {
        var swiper = new Swiper('.main-silder-swiper-02', {
            speed: 1500,
            parallax: true,
            loop: true,
            pagination: {
                el: '.swiper-pagination',
            },
            navigation: {
                nextEl: '.swiper-button-next2',
                prevEl: '.swiper-button-prev2',
            },
        });
    }

// Swiper Portfolio
    if (jQuery('.swiper-portfolio').length > 0) {
        var swiper2 = new Swiper('.swiper-portfolio', {
            slidesPerView: 4,
            spaceBetween: 30,
            speed: 1500,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next2',
                prevEl: '.swiper-button-prev2',
            },
            breakpoints: {
                1280: {
                    slidesPerView: 4,
                },
                991: {
                    slidesPerView: 3,
                },
                591: {
                    slidesPerView: 2,
                },
                320: {
                    slidesPerView: 1,
                },
            }
        });
    }

// Swiper Portfolio
    if (jQuery('.swiper-portfolio-2').length > 0) {
        var swiper2 = new Swiper('.swiper-portfolio-2', {
            slidesPerView: 4,
            spaceBetween: 0,
            speed: 1500,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next2',
                prevEl: '.swiper-button-prev2',
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
                renderBullet: function (index, className) {
                    return '<span class="' + className + '">' + (index + 1) + "</span>";
                },
            },
            breakpoints: {
                1480: {
                    slidesPerView: 4,
                },
                991: {
                    slidesPerView: 3,
                },
                591: {
                    slidesPerView: 2,
                },
                320: {
                    slidesPerView: 1,
                },
            }
        });
    }

// Swiper Portfolio
    if (jQuery('.swiper-team').length > 0) {
        var swiper3 = new Swiper('.swiper-team', {
            slidesPerView: 4,
            spaceBetween: 30,
            speed: 1500,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next3',
                prevEl: '.swiper-button-prev3',
            },
            breakpoints: {
                1500: {
                    slidesPerView: 5,
                },
                1200: {
                    slidesPerView: 4,
                },
                991: {
                    slidesPerView: 3,
                },
                576: {
                    slidesPerView: 2,
                },
                100: {
                    slidesPerView: 1,
                },
            }
        });
    }

// Swiper Portfolio
    if (jQuery('.swiper-client').length > 0) {
        var swiper4 = new Swiper('.swiper-client', {
            slidesPerView: 1,
            spaceBetween: 30,
            speed: 1500,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next3',
                prevEl: '.swiper-button-prev3',
            },
        });
        swiper4.on('slideChange', function () {
            setTimeout(function () {
                var dataRel = $('.swiper-client .swiper-slide-active').data('rel');
                jQuery('.client-area li').removeClass('active');
                jQuery('.client-area li[data-member=' + dataRel + ']').addClass('active');
            }, 500);
        });
        jQuery('.client-area li a').on('click', function (e) {
            e.preventDefault();
            var memberRel = jQuery(this).parent().data('member');
            swiper4.slideTo(memberRel);
        });
    }

// Blog Swiper
    if (jQuery('.blog-swiper').length > 0) {
        var swiper5 = new Swiper('.blog-swiper', {
            slidesPerView: 3,
            spaceBetween: 0,
            speed: 1500,
            loop: true,
            breakpoints: {
                1280: {
                    slidesPerView: 3,
                },
                991: {
                    slidesPerView: 3,
                },
                691: {
                    slidesPerView: 2,
                },
                320: {
                    slidesPerView: 1,
                },
            }
        });
    }

// Blog Swiper
    if (jQuery('.post-swiper').length > 0) {
        var swiper6 = new Swiper('.post-swiper', {
            slidesPerView: 1,
            spaceBetween: 0,
            speed: 1500,
            loop: true,
            navigation: {
                nextEl: '.prev-post-swiper-btn',
                prevEl: '.next-post-swiper-btn',
            },
        });
    }

// Testimonial Swiper
    if (jQuery('.testimonial-swiper').length > 0) {
        var swiper7 = new Swiper('.testimonial-swiper', {
            speed: 1500,
            parallax: true,
            slidesPerView: 3,
            spaceBetween: 30,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next3',
                prevEl: '.swiper-button-prev3',
            },
            breakpoints: {
                1191: {
                    slidesPerView: 3,
                },
                691: {
                    slidesPerView: 2,
                },
                320: {
                    slidesPerView: 1,
                },
            }
        });
    }

// Testimonial Swiper
    if (jQuery('.testimonial-swiper-2').length > 0) {
        var swiper3 = new Swiper('.testimonial-swiper-2', {
            speed: 1500,
            slidesPerView: 1,
            spaceBetween: 30,
            autoplay: {
                delay: 3000,
            },
        });
    }



// Team Swiper
    if (jQuery('.team-swiper').length > 0) {
        var swiper8 = new Swiper('.team-swiper', {
            speed: 1500,
            parallax: true,
            slidesPerView: 4,
            spaceBetween: 30,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next4',
                prevEl: '.swiper-button-prev4',
            },
            breakpoints: {
                1191: {
                    slidesPerView: 4,
                },
                991: {
                    slidesPerView: 3,
                },
                591: {
                    slidesPerView: 2,
                },
                320: {
                    slidesPerView: 1,
                },
            }
        });
    }

// Team Swiper
    if (jQuery('.team-swiper-2').length > 0) {
        var swiper4 = new Swiper('.team-swiper-2', {
            speed: 1500,
            parallax: true,
            slidesPerView: 4,
            spaceBetween: 30,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next4',
                prevEl: '.swiper-button-prev4',
            },
            breakpoints: {
                1191: {
                    slidesPerView: 4,
                },
                991: {
                    slidesPerView: 3,
                },
                591: {
                    slidesPerView: 2,
                },
                320: {
                    slidesPerView: 1,
                },
            }
        });
    }

// Clients Swiper
    if (jQuery('.clients-swiper').length > 0) {
        var swiper9 = new Swiper('.clients-swiper', {
            speed: 1500,
            parallax: true,
            slidesPerView: 4,
            spaceBetween: 30,
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next5',
                prevEl: '.swiper-button-prev5',
            },
            breakpoints: {
                1191: {
                    slidesPerView: 6,
                },
                991: {
                    slidesPerView: 5,
                },
                691: {
                    slidesPerView: 4,
                },
                591: {
                    slidesPerView: 3,
                },
                320: {
                    slidesPerView: 2,
                },
            }
        });
    }

// Packages Material Swiper
    if (jQuery('.package-material-swiper').length > 0) {
        var swiper10 = new Swiper('.package-material-swiper', {
            autoplay: {
                delay: 3000,
                disableOnInteraction: true,
                pauseOnMouseEnter: true
            },
            speed: 1000,
            parallax: true,
            slidesPerView: 1.1,
            spaceBetween: 10,
            loop: true,
            centeredSlides: true,
            pagination: {
                el: ".swiper-pagination",
                dynamicBullets: true,
            },
        });
    }

});
/* Document .ready END */