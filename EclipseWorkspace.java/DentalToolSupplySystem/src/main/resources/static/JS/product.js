<script src="animated-header.js"></script>
 <script>
   // Simple JavaScript for filter functionality
   document.addEventListener('DOMContentLoaded', function () {
     // View toggle (grid/list)
     const viewButtons = document.querySelectorAll('.view-btn');
     const productsGrid = document.querySelector('.products-grid');

     viewButtons.forEach(button => {
       button.addEventListener('click', function () {
         viewButtons.forEach(btn => btn.classList.remove('active'));
         this.classList.add('active');

         const viewType = this.getAttribute('data-view');
         if (viewType === 'grid') {
           productsGrid.classList.remove('list-view');
         } else {
           productsGrid.classList.add('list-view');
         }
       });
     });

     // Product hover effects
     const productItems = document.querySelectorAll('.product-item');

     productItems.forEach(item => {
       item.addEventListener('mouseenter', function () {
         this.querySelector('.product-actions').style.opacity = '1';
       });

       item.addEventListener('mouseleave', function () {
         this.querySelector('.product-actions').style.opacity = '0';
       });
     });
   });
 </script>