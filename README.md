# 🧠 Green Screen App – Eco-Aware Waste Detection and Management

Welcome to the **Green Screen App**, a full-stack sustainability-focused platform developed during a hackathon to promote environmental awareness and responsible waste disposal.

---

## 🌱 Project Overview

**Green Screen App** empowers users to capture and classify waste using AI, understand its recyclability, and build a more sustainable future through informed decisions. The platform is split into two core parts:

* **Frontend**: A cross-platform Flutter app for image capture, waste analysis, and user engagement.
* **Backend**: A Python backend (Django/FastAPI) that handles image classification and data persistence.

---

## 🚀 Features

### 📱 Flutter Frontend

* Clean, eco-friendly UI built with Flutter.
* Camera & gallery access for image input.
* Real-time waste classification (organic/recyclable).
* User-friendly onboarding and scan interface.
* History of previous scans (local or server-based).
* Sustainability tips pop-ups based on waste types.

**⬇️ \[Insert Screenshot of Flutter App Home & Scan Screen Here]**

### 🧠 Backend (Python/Django)

* Image classification using a TensorFlow Lite model.
* Fast and scalable API for frontend communication.
* Modular code with REST API endpoints for:

  * Uploading waste images
  * Receiving classification results
  * Logging submissions & scan history

**⬇️ \[Insert Screenshot of API Response or Swagger Docs Here]**

---

## 🛠️ Tech Stack

| Layer      | Tech Used                   |
| ---------- | --------------------------- |
| Frontend   | Flutter, Dart               |
| Backend    | Python, Django/DRF          |
| AI Model   | TensorFlow Lite (`.tflite`) |
| API Format | RESTful JSON                |
| Versioning | Git + GitHub                |

---

## 🧪 How It Works

1. **User uploads** an image of waste through the Flutter app.
2. **Backend API** receives the image and processes it with a TFLite model.
3. The image is **classified** as either:

   * `"O"` → Organic Waste
   * `"R"` → Recyclable Waste
4. Classification result is **returned to frontend** and displayed to user.
5. A toast or alert shows: "This is recyclable!"
6. Stats and streaks are updated for user engagement.

**⬇️ \[Insert Workflow Diagram or Architecture Image Here]**

---

## 📸 Sample Use Case

* A user sees a piece of plastic waste.
* Opens the app → scans the object.
* App tells them: "♻️ This is recyclable!"
* Bonus: They earn 10 eco-points for taking an action.
* They can check progress in a dashboard or leaderboard.

**⬇️ \[Insert Use Case Storyboard or Screen Flow Here]**

---

## 📁 Project Structure (Simplified)

```
GreenScreenApp/
├── frontend/             # Flutter app code
│   ├── lib/
│   └── assets/
├── backend/              # Django or FastAPI server
│   ├── api/
│   └── tflite_model/     # Pre-trained waste classification model
└── README.md           # This file
```

---

## 🚀 Future Enhancements

* Leaderboards and daily challenges for gamification
* Smart dustbin integration with ESP32 (volume + type sensing)
* AR overlay to guide how to dispose of scanned waste
* User eco-profile and rewards store

---

## 📅 Hackathon Details

* **Event:** Cyfuture AI Hackathon
* **Track:** Sustainability and Smart Cities
* **Date:** June 10, 2025

---

## 📈 Impact

* Promotes eco-awareness through real-time waste classification.
* Helps reduce improper waste disposal and increases recycling rates.
* Educates users with every scan – empowering sustainable action.

---

## 🙏 Acknowledgements

* Built by Aditya Vashisht, Karamveer singh: https://github.com/end-9214, suhani singhal: https://github.com/suhanisinghal274, Kairav bhatia:https://github.com/kairavb]
* Special thanks to mentor(Dr. Shalini Gambhir)

---

**Let’s make the Earth a cleaner, smarter place – one scan at a time!**

![WhatsApp Image 2025-06-10 at 23 05 49_7e339636](https://github.com/user-attachments/assets/88e2abd6-aa6f-402f-a667-7ec0fe408aaa)


![WhatsApp Image 2025-06-10 at 23 05 49_79bb8060](https://github.com/user-attachments/assets/48ff7ec5-e71c-448e-a221-40e4ff306360)

![bar code scanning](https://github.com/user-attachments/assets/72f5b82a-702e-4e56-b74a-55c200bcdf5b)


![WhatsApp Image 2025-06-10 at 23 05 50_4e63c127](https://github.com/user-attachments/assets/7df0ee32-7866-473c-bc77-2937c14ecc5d)


