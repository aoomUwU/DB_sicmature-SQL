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

// ดึง DOM element ของ input
const inputElement = document.getElementById("search-input");
// เพิ่ม event listener สำหรับ keyup event
inputElement.addEventListener("keyup", function(event) {
  // ตรวจสอบว่าปุ่มที่ถูกกดคือ Enter (keyCode 13)
  if (event.key === "Enter") {
    // ตรวจสอบว่า input ไม่ว่างเปล่า
    const searchText = inputElement.value.trim();
    if (searchText !== "") {
      // ถ้า input ไม่ว่างเปล่า ทำงานต่อ
      [document.getElementById("Gfood"), document.getElementById("Gfoodplus"), document.getElementById("Gtool")].forEach(element => {
        element.style.color = "#979797"; 
        element.style.backgroundColor = "#f6f6f6"; 
      });
      displayProductsList('/product_name/' + searchText);
      console.log("ค่าที่ผู้ใช้ป้อนในช่องค้นหา: " + searchText);
    } else {
      // ถ้า input ว่างเปล่า ไม่ทำอะไร
      console.log("กรุณาป้อนคำค้นหา");
    }
  }
});

async function displayProductsList(endpoint) {
  const data = await getData(endpoint);
  const productsList = document.getElementById("products_list");
  productsList.innerHTML = "";
  if (data && data.length > 0) {
    document.getElementById("image0").src = data[0].Img;
    document.getElementById("name0").textContent = data[0].Product_name;
    document.getElementById("price0").textContent = `฿${data[0].Price}`;

    const topPLink = document.createElement("a");
    topPLink.href = `product.html?product_id=${data[0].Product_ID}`;
    topPLink.textContent = `Go to Top Order click`;
    (document.getElementById("enter-order")).appendChild(topPLink);
    await Promise.all(data.map(async (item) => {
      const linkP = document.createElement("a");
      linkP.href = `product.html?product_id=${item.Product_ID}`;

      const divP = document.createElement("div");
      divP.classList.add("product-item");
      divP.id = `product_${item.Product_ID}`;

      const img = document.createElement("img");
      img.src = item.Img;
      divP.appendChild(img);

      const pPName = document.createElement("p");
      pPName.classList.add("product-item-name");
      pPName.textContent = item.Product_name; 
      const pPPrice = document.createElement("p");
      pPPrice.classList.add("product-item-Price");
      pPPrice.textContent = `฿${item.Price}`; 
      const divText = document.createElement("div");
      divText.classList.add("product-item-content");

      const plusIcon = document.createElement("i");
      plusIcon.classList.add("bi", "bi-plus-circle-fill");

      divText.appendChild(pPName);
      divText.appendChild(pPPrice);
      divP.appendChild(divText);
      divP.appendChild(plusIcon);

      linkP.appendChild(divP);
      productsList.appendChild(linkP);
    }));
  } else {
    console.log("ไม่พบข้อมูล");

    const divP = document.createElement("div");
    divP.classList.add("noting");
    divP.style.display = "grid";
    divP.style.gridTemplateColumns = "auto 1fr";
    divP.style.alignItems = "center";
    divP.style.color = "red";
    const icon = document.createElement("i");
    icon.classList.add("bx", "bxs-dizzy");
    icon.style.fontSize = "3.5rem";
    divP.appendChild(icon);
    const iconText = document.createElement("p");
    iconText.textContent = "ไม่มีสินค้า";
    iconText.style.fontSize = "1.3rem";
    iconText.style.margin = "0"; 
    divP.appendChild(iconText);
    productsList.appendChild(divP);
  }
}

function setColor(selectedElement, otherElements) {
  selectedElement.style.color = "#454545";
  selectedElement.style.backgroundColor = "#ff90e7"; 
  otherElements.forEach(element => {
      element.style.color = "#979797"; 
      element.style.backgroundColor = "#f6f6f6"; 
  });
}

const GfoodButton = document.getElementById("Gfood");
const GfoodplusButton = document.getElementById("Gfoodplus");
const GfoodtabletsButton = document.getElementById("Gfoodtablets");
const GfoodwetButton = document.getElementById("Gfoodwet");
const GtoyButton = document.getElementById("Gtoy");
const GtoolButton = document.getElementById("Gtool");

function fetchDataFood() {
  const selectedElement = GfoodButton;
  const otherElement = [GfoodplusButton, GfoodtabletsButton, GfoodwetButton, GtoyButton, GtoolButton];
  setColor(selectedElement,otherElement)
  displayProductsList('/foodProducts');
}
function fetchDataFoodplus() {
  const selectedElement = GfoodplusButton;
  const otherElement = [GfoodButton, GfoodtabletsButton, GfoodwetButton, GtoyButton, GtoolButton];
  setColor(selectedElement,otherElement)
  displayProductsList('/products/Food_Supply');
}
function fetchDatafoodtablets() {
  const selectedElement = GfoodtabletsButton;
  const otherElement = [GfoodplusButton, GfoodButton, GfoodwetButton, GtoyButton, GtoolButton];
  setColor(selectedElement,otherElement)
  displayProductsList('/products/Food_grain');
}
function fetchDatafoodwet() {
  const selectedElement = GfoodwetButton;
  const otherElement = [GfoodplusButton, GfoodtabletsButton, GfoodButton, GtoyButton, GtoolButton];
  setColor(selectedElement,otherElement)
  displayProductsList('/products/Food_Wet');
}
function fetchDatatoy() {
  const selectedElement = GtoyButton;
  const otherElement = [GfoodplusButton, GfoodtabletsButton, GfoodwetButton, GfoodButton, GtoolButton];
  setColor(selectedElement,otherElement)
  displayProductsList('/products/Toys');
}
function fetchDatatool() {
  const selectedElement = GtoolButton;
  const otherElement = [GfoodplusButton, GfoodtabletsButton, GfoodwetButton, GtoyButton, GfoodButton];
  setColor(selectedElement,otherElement)
  displayProductsList('/products/Gadget');
}


document.getElementById("chatIcon").addEventListener("click", function() {
  window.location.href = "chat.html";
});

document.getElementById("cart-add").addEventListener("click", function() {
  window.location.href = "Shipping.html";
});