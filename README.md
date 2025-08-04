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
- [ ]User can input an activity and duration to get calories burned
- [ ]User sees results on the same screen or in a result view
- [ ]User sees error messages for invalid inputs
- [ ]User can view a list of past searches
- [ ]App shows a loading indicator while fetching

#### Optional Nice-to-have Stories
- [ ]User can save favorite activities
- [ ]User sees graphs of weekly burned calories
- [ ]User can log in/out and track history per account
- [ ]User gets motivational tips based on activity

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

<img src="https://www.figma.com/proto/6cKYa4kWwP9INo6JMtVV6k/Untitled?node-id=1-36&t=CgGXGQ0azuZXDEll-1" width=600>


---

## [BONUS] Digital Wireframes & Mockups

*Add Figma or digital mockups if you’ve made them*

---

## [BONUS] Interactive Prototype

*Link to Figma prototype here if you’ve created one*

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
