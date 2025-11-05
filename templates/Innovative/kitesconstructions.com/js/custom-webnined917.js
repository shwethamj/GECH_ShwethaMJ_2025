$(document).ready(function (e) {
    initTooltips();
    initEvents();
    initLazyLoad();
    if ($("#form-lead-information").length > 0) {
        initFormValidation();
    }
});

function initLazyLoad() {
    if ($('.lazy').length) {
        $('.lazy').Lazy({
            // your configuration goes here
            scrollDirection: 'vertical',
            effect: 'fadeIn',
            visibleOnly: true,
            afterLoad: function (element) {

            },
            onError: function (element) {

            }
        });
    }
}

function initTooltips() {
    if ($('[data-toggle="tooltip"]').length) {
        $('[data-toggle="tooltip"]').tooltip();
    }

    $('.bstooltip').mouseleave(function () {
        $(this).tooltip('hide');
    });

    $('.move-to-in-page-enquiry-form').unbind("click").on("click", function (e) {
        e.preventDefault();
        var target = $(this).attr("href");
        $('html, body').animate({
            scrollTop: $(target).offset().top - $("#navbarNavDropdown").height()
        }, 1000);
    });
}

function initEvents() {
    if ($(".testimonial-video-wrapper").length) {
        $(".testimonial-video-wrapper").unbind("click").on("click", function (e) {
            var testimonialVideo = $(this).attr("data-testimonial-src");
            $("#modal-testimonial-video iframe").attr("src", testimonialVideo);
            $("#modal-testimonial-video").modal("show");
        });
        $('#modal-testimonial-video').on('hidden.bs.modal', function () {
            $("#modal-testimonial-video iframe").attr("src", null);
        });
    }
}

function initFormValidation() {

    $.validator.addMethod("alpha", function (value, element) {
        return this.optional(element) || value == value.match(/^[a-zA-Z ]*$/);
    }, "Letters and spaces only please");
    $.validator.addMethod("mobilenumber", function (value, element) {
        return this.optional(element) || value == value.match(/^[0-9() .+-]*$/);
    }, "Letters and spaces only please");

    $("form#form-lead-information").validate({
        ignore: [],
        errorClass: "error is-invalid",
        errorElement: "span",
        errorPlacement: function (error, element) {
            error.appendTo($(element).closest(".form-floating"));
        },
        rules: {
            property_type: {
                required: true,
            },
            plot_size: {
                required: true,
            },
            number_of_floors: {
                required: true,
            },
            locality: {
                required: true,
            },
            name: {
                required: true,
                alpha: true
            },
            email_address: {
                required: false,
                email: true
            },
            mobile_number: {
                required: true,
                mobilenumber: true
            },
        },
        messages: {
            property_type: {
                required: "Property type is required",
            },
            plot_size: {
                required: "Plot size is required",
            },
            number_of_floors: {
                required: "Number of floors is required",
            },
            locality: {
                required: "Locality is required",
            },
            name: {
                required: "Name is required",
                alpha: "Enter a valid name"
            },
            email_address: {
                required: "Email Address is required",
                email: "Enter a valid email address"
            },
            mobile_number: {
                required: "Mobile Number is required",
                mobilenumber: "Enter a valid mobile number"
            },
        },
        submitHandler: function (form) {
            var formfields = $(form).serializeArray();
            var formdata = {};
            $.each(formfields, function (i, v) {
                formdata[v.name] = v.value;
            });
            //Add Any Special Components if Any
            saveLead(formdata, $("form#form-lead-information [type='submit']"));
        }
    });
}


function saveLead(formdata, submitButton) {
    $(submitButton).attr('disabled', 'disabled');
    formdata['page'] = window.location.href;
    formdata['lead_for'] = 3; //General Website Inquiry
    $.ajax({
        type: "post",
        url: "api.php?do=saveLead",
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formdata),
        success: function (response) {
            $(submitButton).removeAttr('disabled', 'disabled');
            if (response.success === true) {
                document.location = "thank-you-for-submitting-your-informtion.html";
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: response.errorMsg
                });
            }
        },
        error: function (response) {
            $(submitButton).removeAttr('disabled', 'disabled');
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Something went wrong!'
            });
        }
    });
}