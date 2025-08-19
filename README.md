# BurnTrack

## Table of Contents
- Overview
- Product Spec
- Wireframes
- Schema

---

## Overview

### Description
BurnTrack is a mobile fitness app that allows users to estimate how many calories they've burned based on the activity and time entered. It uses the [Calories Burned API](https://www.api-ninjas.com/api/caloriesburned) to return real-time data for various exercises, helping users understand the impact of their workouts.

### App Evaluation

| Attribute | Details |
|-----------|---------|
| **Category** | Health & Fitness |
| **Mobile** | Yes – designed for mobile use and context-aware tracking |
| **Story** | Helps users understand their workout effort and calorie output in a quick, intuitive way |
| **Market** | Anyone interested in fitness, weight loss, or active lifestyle |
| **Habit** | Users may use this daily post-exercise |
| **Scope** | MVP is achievable with a simple input, API call, and results screen |

---

## Product Spec

### 1. User Stories

#### Required Must-have Stories
- [x] User can input an activity and duration to get calories burned
- [x] User sees results on the same screen or in a result view
- [x] User sees error messages for invalid inputs
- [x] User can view a list of past searches
- [x] App shows a loading indicator while fetching

#### Optional Nice-to-have Stories
- [x] User can save favorite activities
- [x] User sees graphs of weekly burned calories
- [x] User can log in/out and track history per account

---

### 2. Screen Archetypes

- **Home Screen**
  - Input fields for activity + duration
  - Button to fetch results

- **Results Display**
  - Shows calories burned with activity summary

- **Activity History**
  - Shows recent searches and calories burned

- **Profile Screen (Optional)**
  - User login/logout
  - Saved favorites or streaks

---

### 3. Navigation

#### Tab Navigation
- Home
- Activity History
- Profile

#### Flow Navigation
- Home → Result View
- Activity History → Activity Detail
- Profile → Login / Favorites

---

## Wireframes

<img width="375" height="812" alt="splash" src="https://github.com/user-attachments/assets/7073f6fd-e498-4c63-8f67-299dad3d3ced" />

<img width="375" height="812" alt="login" src="https://github.com/user-attachments/assets/34fc1f60-cdb1-4d36-a6e2-11e21056d48e" />

<img width="375" height="812" alt="Homepage" src="https://github.com/user-attachments/assets/19d48bbd-efbd-4657-8604-b7fe3cef5b0e" />

<img width="375" height="886" alt="body weight tracking" src="https://github.com/user-attachments/assets/6dae0953-f628-44c6-93fa-7a81637801a6" />

<img width="375" height="886" alt="Calorie tracking" src="https://github.com/user-attachments/assets/28e01908-10a7-4627-a1c5-1f395164e1a4" />

<img width="375" height="813" alt="workout complete pop up" src="https://github.com/user-attachments/assets/faa90db3-eb65-49fd-a603-75217886531a" />

---

## [BONUS] Digital Wireframes & Mockups

*Add Figma or digital mockups if you’ve made them*

---

## [BONUS] Interactive Prototype

*Link to Figma prototype here if you’ve created one*
https://www.figma.com/design/yZtxtZQXXU3mHS8vaY2SgR/Fitness---Workout-App-UI-Kit-%7C-3D-Effect--Community-?node-id=234-2801&t=sBSssHi2oNmKKp0j-0

---


### Models

| Model | Property | Type | Description |
|-------|----------|------|-------------|
| ActivityLog | exercise | String | Exercise name |
| | duration | Int | Minutes exercised |
| | caloriesBurned | Float | From API |
| | createdAt | Date | Time of logging |

---

### Networking

#### API Endpoint
