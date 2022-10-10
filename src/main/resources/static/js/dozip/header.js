const toggleBtn = document.querySelector('.toggleBtn');
const menu = document.querySelector('.menu');
const icons = document.querySelector('.links');

toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active'); //클릭시 active, 없으면 active추가
    icons.classList.toggle('active');
});