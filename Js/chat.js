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

async function displayChatRoom() {
  const data = await getData('/chat_room');
  const chatRoom = document.getElementById("rooms");
  chatRoom.innerHTML = "";
  if (data && data.length > 0) {
    data.forEach((item) => {
      const divR = document.createElement("div");
      divR.classList.add("Chat-Room");
      divR.id = `Chat_${item.Chat_id}`;
      divR.onclick = function() {
          displayChat(`/chat/${item.Chat_id}`,item.Chat_id,item.Chat_name);
        }

      const pRName = document.createElement("p");
      pRName.classList.add("chat-name");
      pRName.textContent = `${item.Chat_name}`;
      divR.appendChild(pRName);

      chatRoom.appendChild(divR);
    });
  } else {
    console.log("ไม่พบข้อมูล");
  }
}
displayChatRoom();

async function displayChat(endpoint,Chat_id,Chat_name) {
  const data = await getData(endpoint);
  const chat = document.getElementById("chat");
  chat.innerHTML = "";

  const ChatName =document.getElementById("chatName");
  ChatName.textContent = `${Chat_name}`;

  const divC = document.createElement("div");
  divC.classList.add("message");
  divC.id = `${Chat_id}`;
  chat.appendChild(divC);

  const userSend_id = await getUSerID();
  if (data && data.length > 0) {
    data.forEach((item) => {

      const pCId = document.createElement("p");
      const pCName = document.createElement("p");
      pCName.classList.add("text");
      pCName.innerHTML = `${item.Text}`;
      pCId.appendChild(pCName);
      divC.appendChild(pCId);

      divC.scrollTop = divC.scrollHeight;
      if (userSend_id === item.Person_id_send) {
        pCId.style.textAlign = "right"; 
      } else {
        pCId.style.textAlign = "left"; 
      }
    });
  } else {
    console.log("ไม่พบข้อมูล");
  }
}

function getCurrentDateTime() {
  const currentDate = new Date();
  const year = currentDate.getFullYear();
  const month = String(currentDate.getMonth() + 1).padStart(2, '0');
  const day = String(currentDate.getDate()).padStart(2, '0');
  const hours = String(currentDate.getHours()).padStart(2, '0');
  const minutes = String(currentDate.getMinutes()).padStart(2, '0');
  const seconds = String(currentDate.getSeconds()).padStart(2, '0');
  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}
async function getUSerID() {
  const data = await getData(`/accounts`);
  return data[data.length - 1].User_id;
}
const inputElement = document.getElementById("chatInput");
inputElement.addEventListener("keydown", async function (event) { 
  if (event.key === "Enter") {
    const input = inputElement.value.trim();
    console.log(input);
    if (input !== null && (document.querySelector(".message")) !== null) {
      const messageText = input;
      inputElement.value = "";
      const chatMessageElement = document.querySelector(".message");
      const Chat_id = chatMessageElement.id;
      const Chat_name =(document.getElementById("chatName")).textContent;
      const userSend_id = await getUSerID();
      try {
        const response = await fetch(`http://localhost:8000/chat/${Chat_id}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
              Chat_id: Chat_id,
              Person_id_send: userSend_id, 
              Video: null,  
              Text: messageText,
              Datetime: getCurrentDateTime(), 
              Photo: null  
            }),
        });
        const data = await response.json();
        console.log(data);
        displayChat(`/chat/${Chat_id}`, Chat_id, Chat_name);
      } catch (error) {
          console.error(error);
      }
    }
  }
});
