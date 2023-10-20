const body = document.querySelector("body");
const darkLight = document.querySelector("#darkLight");
const sidebar = document.querySelector(".sidebar");
const submenuItems = document.querySelectorAll(".submenu_item");
const sidebarOpen = document.querySelector("#sidebarOpen");
const sidebarClose = document.querySelector(".collapse_sidebar");
const sidebarExpand = document.querySelector(".expand_sidebar");
sidebarOpen.addEventListener("click", () => sidebar.classList.toggle("close"));

sidebarClose.addEventListener("click", () => {
  sidebar.classList.add("close", "hoverable");
});
sidebarExpand.addEventListener("click", () => {
  sidebar.classList.remove("close", "hoverable");
});

sidebar.addEventListener("mouseenter", () => {
  if (sidebar.classList.contains("hoverable")) {
    sidebar.classList.remove("close");
  }
});
sidebar.addEventListener("mouseleave", () => {
  if (sidebar.classList.contains("hoverable")) {
    sidebar.classList.add("close");
  }
});

darkLight.addEventListener("click", () => {
  body.classList.toggle("dark");
  if (body.classList.contains("dark")) {
    document.setI
    darkLight.classList.replace("bx-sun", "bx-moon");
  } else {
    darkLight.classList.replace("bx-moon", "bx-sun");
  }
});

submenuItems.forEach((item, index) => {
  item.addEventListener("click", () => {
    item.classList.toggle("show_submenu");
    submenuItems.forEach((item2, index2) => {
      if (index !== index2) {
        item2.classList.remove("show_submenu");
      }
    });
  });
});

if (window.innerWidth < 768) {
  sidebar.classList.add("close");
} else {
  sidebar.classList.remove("close");
} 
const profileDropdown = document.querySelector('.profile-dropdown');

profileDropdown.addEventListener('click', function () {
  const dropdownMenu = this.querySelector('.dropdown-menu');
  dropdownMenu.style.display = dropdownMenu.style.display === 'block' ? 'none' : 'block';
});

// ปิดเมนูดรอปดาวน์เมื่อคลิกที่ที่อื่นบนหน้าเว็บ
document.addEventListener('click', function (event) {
  if (!profileDropdown.contains(event.target)) {
    const dropdownMenu = profileDropdown.querySelector('.dropdown-menu');
    dropdownMenu.style.display = 'none';
  }
}); 
// script.js
function addToCart(productName) {
  // อ่านรายการสินค้าที่มีอยู่ใน shopping cart จาก localStorage
  let cart = JSON.parse(localStorage.getItem('cart')) || [];
  
  // เพิ่มสินค้าลงใน shopping cart
  cart.push(productName);
  
  // บันทึกรายการสินค้าใหม่ลงใน localStorage
  localStorage.setItem('cart', JSON.stringify(cart));
  
  // อัพเดทแสดงรายการสินค้าใน shopping cart
  updateCartDisplay();
}

function removeFromCart(index) {
  // อ่านรายการสินค้าใน shopping cart จาก localStorage
  let cart = JSON.parse(localStorage.getItem('cart')) || [];
  
  // ลบสินค้าที่เลือกจาก shopping cart
  cart.splice(index, 1);
  
  // บันทึกรายการใหม่ลงใน localStorage
  localStorage.setItem('cart', JSON.stringify(cart));
  
  // อัพเดทแสดงรายการสินค้าใน shopping cart
  updateCartDisplay();
}

function updateCartDisplay() {
  // อ่านรายการสินค้าใน shopping cart จาก localStorage
  let cart = JSON.parse(localStorage.getItem('cart')) || [];

  // แสดงรายการสินค้าใน shopping cart ใหม่
  let cartList = document.getElementById('cart-list');
  cartList.innerHTML = '';
  cart.forEach((item, index) => {
      let li = document.createElement('li');
      li.innerHTML = `${item} <button onclick="removeFromCart(${index})">ลบ</button>`;
      cartList.appendChild(li);
  });
}

// รันฟังก์ชันนี้เมื่อโหลดหน้าเว็บ
updateCartDisplay();


const host = "http://localhost:8000";

async function getData(endpoint) {
    try {
      const response = await fetch(host + endpoint);
      const data = await response.json();
      return data
    } catch (error) {
      console.error(error);
    }
}

window.onload = async function() {
  const user_id = await getUSerID();
  const productsList = document.getElementById("product-list");
  productsList.innerHTML = "";
  try {
      const data = await getData(`/shippings/${user_id}`);
      await Promise.all(data.map(async (item) => {
          const dataP = await getData(`/product/${item.Product_ID}`);

          const liP = document.createElement("li");
          liP.id = `${item.Product_ID}`;
          productsList.appendChild(liP);

          const imgP = document.createElement("img");
          imgP.src = `${dataP[0].Img}`;
          liP.appendChild(imgP);

          const pPname = document.createElement("p");
          liP.appendChild(pPname);
          pPname.textContent = `${dataP[0].Product_name}`;

          const buttonP = document.createElement("button");
          liP.appendChild(buttonP);
          buttonP.textContent = `เพิ่มเข้าในตะกร้า`;
          buttonP.onclick = function() {
            addToCart(dataP[0].Product_name)
            console.log('ปุ่มถูกคลิกแล้ว!');
          };
      }));
  } catch (error) {
    console.error(error);
  }
}


async function getUSerID() {
  const data = await getData(`/accounts`);
  console.log(data[data.length - 1].User_id);
  return data[data.length - 1].User_id;
}


async function buy() {
  const user_id = await getUSerID();
  const data = await getData(`/shippings/${user_id}`);
  const NEXTurl = `statment.html?product_id=${data[0].Product_ID}`;
  window.location.href = NEXTurl;
}