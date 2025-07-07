
    document.addEventListener('DOMContentLoaded', function () {
      // Quantity controls
      const minusButtons = document.querySelectorAll('.quantity-btn.minus');
      const plusButtons = document.querySelectorAll('.quantity-btn.plus');

      minusButtons.forEach(button => {
        button.addEventListener('click', function () {
          const input = this.nextElementSibling;
          let value = parseInt(input.value);
          if (value > 1) {
            input.value = value - 1;
            updateSubtotal(this);
          }
        });
      });

      plusButtons.forEach(button => {
        button.addEventListener('click', function () {
          const input = this.previousElementSibling;
          let value = parseInt(input.value);
          if (value < 10) {
            input.value = value + 1;
            updateSubtotal(this);
          }
        });
      });

      // Remove item
      const removeButtons = document.querySelectorAll('.remove-item');

      removeButtons.forEach(button => {
        button.addEventListener('click', function () {
          const cartItem = this.closest('.cart-item');
          cartItem.style.opacity = '0';
          setTimeout(() => {
            cartItem.remove();
            updateCartTotal();
          }, 300);
        });
      });

      // Update subtotal when quantity changes
      function updateSubtotal(element) {
        const cartItem = element.closest('.cart-item');
        const price = parseFloat(cartItem.querySelector('.item-price').innerText.replace('$', ''));
        const quantity = parseInt(cartItem.querySelector('input[type="number"]').value);
        const subtotal = price * quantity;

        cartItem.querySelector('.item-subtotal').innerText = '$' + subtotal.toFixed(2);
        updateCartTotal();
      }

      // Update cart total
      function updateCartTotal() {
        let subtotal = 0;
        const subtotals = document.querySelectorAll('.item-subtotal');

        subtotals.forEach(item => {
          subtotal += parseFloat(item.innerText.replace('$', ''));
        });

        const tax = subtotal * 0.08;
        let shipping = 50; // Default to standard shipping

        if (document.getElementById('express').checked) {
          shipping = 120;
        } else if (document.getElementById('pickup').checked) {
          shipping = 0;
        }

        const total = subtotal + tax + shipping;

        document.querySelector('.summary-row:first-child span:last-child').innerText = '$' + subtotal.toFixed(2);
        document.querySelector('.summary-row:nth-child(3) span:last-child').innerText = '$' + tax.toFixed(2);
        document.querySelector('.total span:last-child').innerText = '$' + total.toFixed(2);
      }

      // Shipping option change
      const shippingOptions = document.querySelectorAll('input[name="shipping"]');

      shippingOptions.forEach(option => {
        option.addEventListener('change', updateCartTotal);
      });

      // Product hover effects in related products
      const productCards = document.querySelectorAll('.product-card');

      productCards.forEach(card => {
        card.addEventListener('mouseenter', function () {
          this.querySelector('.product-actions').style.opacity = '1';
        });

        card.addEventListener('mouseleave', function () {
          this.querySelector('.product-actions').style.opacity = '0';
        });
      });
    });
