# 🧠 Green Screen App – Eco-Aware Waste Detection and Management

Welcome to the **Green Screen App**, a full-stack sustainability-focused platform developed during a hackathon to promote environmental awareness and responsible waste disposal.

---

## 🌱 Project Overview

**Green Screen App** empowers users to capture and classify waste using AI, understand its recyclability, and build a more sustainable future through informed decisions. The platform is split into two core parts:

- **Frontend**: A cross-platform Flutter app for image capture, waste analysis, and user engagement.
- **Backend**: A Python backend (Django/FastAPI) that handles image classification and data persistence.

---

## 🚀 Features

### 📱 Flutter Frontend
- Clean, eco-friendly UI built with Flutter.
- Camera & gallery access for image input.
- Real-time waste classification (organic/recyclable).
- User-friendly onboarding and scan interface.

### 🧠 Backend (Python/Django)
- Image classification using a TensorFlow Lite model.
- Fast and scalable API for frontend communication.
- Modular code with REST API endpoints for:
  - Uploading waste images
  - Receiving classification results
  - Logging submissions

---

## 🛠️ Tech Stack

| Layer        | Tech Used               |
|-------------|--------------------------|
| Frontend    | Flutter, Dart            |
| Backend     | Python, Django/DRF       |
| AI Model    | TensorFlow Lite (`.tflite`) |
| Versioning  | Git + GitHub             |

---

## 🧪 How It Works

1. **User uploads** an image of waste through the Flutter app.
2. **Backend API** receives the image and processes it with a TFLite model.
3. The image is **classified** as either:
   - `"O"` → Organic Waste
   - `"R"` → Recyclable Waste
4. Classification result is **returned to frontend** and displayed to user.

---

## 📸 Sample Use Case

- A user sees a piece of plastic waste.
- Opens the app → scans the object.
- App tells them: "♻️ This is recyclable!"
- Bonus: You can track how many recyclable vs. organic items you scanned today!

---

## 📁 Project Structure

