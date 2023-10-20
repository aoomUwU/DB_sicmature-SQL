const params = new URLSearchParams(window.location.search);
const product_id = params.get('product_id');

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
    const USERdata = await getData(`/accounts`);
    const midNewElements = document.getElementsByClassName("mid-new"); 
    const lastMidNewElement = midNewElements[midNewElements.length - 1]; 
    const addr = document.createElement("p");
    lastMidNewElement.appendChild(addr);    
    addr.innerHTML = `${USERdata[0].Address}`;

    const user_id = await getUSerID();
    const productsList = document.getElementById("products_list");
    productsList.innerHTML = "";
    try {
        const data = await getData(`/shippings/${user_id}`);
        let totalPrice = 0;
        await Promise.all(data.map(async (item) => {
            console.log(`${product_id} === ${item.Product_ID}`);
            if (Number(product_id) === Number(item.Product_ID)) {
                const Pdata = await getData(`/product/${item.Product_ID}`);
                console.log(Pdata);

                const divP = document.createElement("div");
                divP.classList.add("mid-new-1");
                divP.id = `${item.Product_ID}`;
                divP.style.display = "flex";
                divP.style.alignItems = "center";
                divP.style.justifyContent = "space-between";
                productsList.appendChild(divP);

                const imgP = document.createElement("img");
                imgP.classList.add("mid-img");
                divP.appendChild(imgP);
                imgP.src = Pdata[0].Img;

                const divPtext = document.createElement("div");
                divP.appendChild(divPtext);
                divPtext.style.padding = "5px";

                const pPname = document.createElement("p");
                divPtext.appendChild(pPname);
                pPname.textContent = `${Pdata[0].Product_name}`;

                const pPamount = document.createElement("p");
                divPtext.appendChild(pPamount);
                pPamount.textContent = `${item.Amount} ชื้น`;

                const pPprice = document.createElement("p");
                divPtext.appendChild(pPprice);
                const itemPrice = item.Price * item.Amount;
                pPprice.textContent = `฿${itemPrice}`;
                totalPrice += itemPrice;
            } else {
                console.log("X");
            }
        }));
        const divTotal = document.createElement("div");
        divTotal.classList.add("mid-new-3");
        productsList.appendChild(divTotal);

        const PTotalprice = document.createElement("p");
        divTotal.appendChild(PTotalprice);
        PTotalprice.textContent = `ราคารวม ฿${totalPrice}`;

    } catch (error) {
      console.error(error);
    }
}

async function buy(){
  const user_id = await getUSerID();
  const generateID = generateOrderId();

  try {
    const data = await getData(`/shippings/${user_id}`);
    await Promise.all(data.map(async (item) => {
      if (Number(product_id) === Number(item.Product_ID)) {
        const POSTresponse = await fetch(`http://localhost:8000/statments`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
              Order_ID: generateID,
              Order_Date: getCurrentDate(),
              User_id: user_id,
              Product_ID: item.Product_ID,
              Price: item.Price,
              Amount: item.Amount,
              Payment: getSelectedPaymentMethod(),
            }),
        });
        const data = await POSTresponse.json();
        console.log(data);
        const DELresponse = await fetch(`http://localhost:8000/shippings/${user_id}&${item.Product_ID}&${item.Price}`, {
              method: 'DELETE',
              headers: {
                'Content-Type': 'application/json',
              },
            });

            if (DELresponse.ok) {
              const data = await DELresponse.json();
              console.log(data.message);
            } else {
              console.error('Error deleting shipping information');
            }
      }
    }));
    const NEXTurl = `main.html`;
    window.location.href = NEXTurl;
  } catch (error) {
      console.error(error);
  }
}





const PayableDelivery = document.getElementById("Payable_delivery");
const Krungthai = document.getElementById("krungthai");
const KPlus = document.getElementById("K_PLUS");
function setColor(selectedElement, otherElements) {
    selectedElement.style.color = "#ffffff";
    selectedElement.style.backgroundColor = "#000000"; 
    otherElements.forEach(element => {
        element.style.color = "#000000"; 
        element.style.backgroundColor = "#ffffff"; 
    });
}
function payableDelivery() { 
    const selectedElement = PayableDelivery;
    const otherElement = [Krungthai, KPlus];
    setColor(selectedElement,otherElement)
}
function krungthai() { 
    const selectedElement = Krungthai;
    const otherElement = [PayableDelivery, KPlus];
    setColor(selectedElement,otherElement)
}
function kPlus() { 
    const selectedElement = KPlus;
    const otherElement = [Krungthai, PayableDelivery];
    setColor(selectedElement,otherElement)
}


function generateOrderId() {
    const timestamp = new Date().getTime(); 
    const randomNum = Math.floor(Math.random());
    console.log(`${timestamp}${randomNum}`);
    return `${timestamp}${randomNum}`;
}
async function getUSerID() {
    const data = await getData(`/accounts`);
    console.log(data[data.length - 1].User_id);
    return data[data.length - 1].User_id;
}
function getSelectedPaymentMethod() {
    const payableDelivery = document.getElementById("Payable_delivery");
    const krungthai = document.getElementById("krungthai");
    const kPlus = document.getElementById("K_PLUS");

    if (payableDelivery && krungthai && kPlus) {
        if (payableDelivery.style.backgroundColor === "rgb(0, 0, 0)") {
            return "เก็บเงินปลายทาง";
        } else if (krungthai.style.backgroundColor === "rgb(0, 0, 0)") {
            return "krungthai NEXT";
        } else if (kPlus.style.backgroundColor === "rgb(0, 0, 0)") {
            return "K PLUS";
        } else {
        return "เก็บเงินปลายทาง"; 
        }
    }
}
function getCurrentDate() {
    const currentDate = new Date();
    const day = String(currentDate.getDate()).padStart(2, '0');
    const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Note: January is 0!
    const year = currentDate.getFullYear();
    return `${year}-${month}-${day}`;
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
