<script>
   document.addEventListener('DOMContentLoaded', function () {
     // Toggle shipping fields visibility
     const sameAsBillingCheckbox = document.getElementById('same-as-billing');
     const shippingFields = document.getElementById('shipping-fields');

     sameAsBillingCheckbox.addEventListener('change', function () {
       if (this.checked) {
         shippingFields.classList.add('hidden');
       } else {
         shippingFields.classList.remove('hidden');
       }
     });

     // Toggle payment method fields
     const paymentMethods = document.querySelectorAll('input[name="payment-method"]');
     const creditCardFields = document.getElementById('credit-card-fields');
     const bankTransferFields = document.getElementById('bank-transfer-fields');

     paymentMethods.forEach(method => {
       method.addEventListener('change', function () {
         if (this.value === 'credit-card') {
           creditCardFields.classList.remove('hidden');
           bankTransferFields.classList.add('hidden');
         } else if (this.value === 'bank-transfer') {
           creditCardFields.classList.add('hidden');
           bankTransferFields.classList.remove('hidden');
         } else {
           creditCardFields.classList.add('hidden');
           bankTransferFields.classList.add('hidden');
         }
       });
     });

     // Update shipping cost based on selected method
     const shippingMethods = document.querySelectorAll('input[name="shipping-method"]');
     const shippingCostElement = document.getElementById('shipping-cost');
     const orderTotalElement = document.getElementById('order-total');

     shippingMethods.forEach(method => {
       method.addEventListener('change', function () {
         let shippingCost = 0;

         if (this.value === 'standard') {
           shippingCost = 50;
         } else if (this.value === 'express') {
           shippingCost = 120;
         }

         shippingCostElement.textContent = shippingCost === 0 ? 'Free' : '$' + shippingCost.toFixed(2);

         // Update total
         const subtotal = 6450;
         const tax = subtotal * 0.08;
         const total = subtotal + tax + shippingCost;

         orderTotalElement.textContent = '$' + total.toFixed(2);
       });
     });

     // Form validation
     const checkoutForm = document.getElementById('checkout-form');

     checkoutForm.addEventListener('submit', function (event) {
       event.preventDefault();

       // Simple validation
       let isValid = true;
       const requiredFields = checkoutForm.querySelectorAll('[required]');

       requiredFields.forEach(field => {
         if (!field.value.trim()) {
           isValid = false;
           field.classList.add('invalid');
         } else {
           field.classList.remove('invalid');
         }
       });

       if (isValid) {
         // Simulate form submission
         alert('Order placed successfully! Redirecting to confirmation page...');
         // In a real application, you would submit the form or make an API call here
         // window.location.href = 'order-confirmation.html';
       } else {
         alert('Please fill in all required fields.');
       }
     });

     // Remove invalid class on input
     const formInputs = checkoutForm.querySelectorAll('input, select, textarea');

     formInputs.forEach(input => {
       input.addEventListener('input', function () {
         if (this.value.trim()) {
           this.classList.remove('invalid');
         }
       });
     });
   });
 </script>