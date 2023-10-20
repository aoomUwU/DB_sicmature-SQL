const params = new URLSearchParams(window.location.search);
const productId = params.get('product_id');

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

const productImg = document.getElementById("productImg");
const productName = document.getElementById("productName");
const productDiscription = document.getElementById("productDiscription");
const productSize = document.getElementById("productSize");
const productPrice = document.getElementById("productPrice");

window.onload = async function() {
  if(productId) {
    try {
      const data = await getData(`/product/${productId}`);
      
      if (data && data.length > 0) {
        function PPSize(price, idSize) {
          return function() {
              const orderIDSize = document.querySelectorAll("#productSize div");
              orderIDSize.forEach(element => {
                  element.style.color = "#979797";
                  element.style.backgroundColor = "#f6f6f6";
              });
              const selectedIDSize = document.getElementById(idSize);
              selectedIDSize.style.color = "#454545";
              selectedIDSize.style.backgroundColor = "#ff90e7";
              productPrice.textContent = `฿${price}`;
          };
        } 

        const img = document.createElement("img");
        img.id = "Img";
        img.src = data[0].Img;
        productImg.appendChild(img);
        productName.textContent = data[0].Product_name;
        productDiscription.textContent = data[0].Description;
        productPrice.textContent = `฿${data[0].Price}`;

        data.forEach((item) => {
          const pPsize = document.createElement("div");
          pPsize.textContent = item.Size;
          pPsize.id = `${item.Size}`;
          pPsize.onclick = PPSize(item.Price, item.Size);
          productSize.appendChild(pPsize);

          const selectedIDSize = document.getElementById(`${data[0].Size}`);
          selectedIDSize.style.color = "#454545";
          selectedIDSize.style.backgroundColor = "#ff90e7";
        });
      } else {
        console.log("ไม่พบข้อมูล");
      }
    } catch (error) {
      console.error(error);
    }
  } else {
    console.log("ไม่พบข้อมูล");
  }
};

const amountProductElement = document.getElementById("amountProduct");
function increaseAmount() {
  const currentAmount = parseInt(amountProductElement.textContent);
  if (currentAmount < 100) { 
      amountProductElement.textContent = currentAmount + 1;
  }
}
function decreaseAmount() {
  const currentAmount = parseInt(amountProductElement.textContent);
  if (currentAmount > 1) { 
      amountProductElement.textContent = currentAmount - 1;
  }
}

async function getUSerID() {
  const data = await getData(`/accounts`);
  console.log(data[data.length - 1].User_id);
  return data[data.length - 1].User_id;
}

async function buy(){
  const productPrice = document.getElementById("productPrice").textContent;
  const productPricevalue = parseInt(productPrice.replace(/\D/g, ''), 10);
  const amountProductvalue = document.getElementById("amountProduct").textContent;
  const user_id = await getUSerID();

  try {
    const response = await fetch(`http://localhost:8000/shippings/${user_id}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          Product_ID: Number(productId), 
          Price: productPricevalue,
          Amount: Number(amountProductvalue), 
        }),
    });
    const data = await response.json();
    console.log(data);
    const NEXTurl = `statment.html?product_id=${productId}`;
    window.location.href = NEXTurl;
  } catch (error) {
      console.error(error);
  }
}
async function add(){
  const productPrice = document.getElementById("productPrice").textContent;
  const productPricevalue = parseInt(productPrice.replace(/\D/g, ''), 10);
  const amountProductvalue = document.getElementById("amountProduct").textContent;
  const user_id = await getUSerID();

  try {
    const response = await fetch(`http://localhost:8000/shippings/${user_id}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          Product_ID: Number(productId), 
          Price: productPricevalue,
          Amount: Number(amountProductvalue), 
        }),
    });
    const data = await response.json();
    console.log(data);
    const NEXTurl = `Shipping.html`;
    window.location.href = NEXTurl;
  } catch (error) {
      console.error(error);
  }
}



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