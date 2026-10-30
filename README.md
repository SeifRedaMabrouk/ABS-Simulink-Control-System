# Design and Simulation of Quarter-Car ABS with Slip Ratio Control

![MATLAB](https://img.shields.io/badge/MATLAB-R2023b-blue.svg)
![Simulink](https://img.shields.io/badge/Simulink-Model--Based%20Design-orange.svg)
![Status](https://img.shields.io/badge/Status-Completed-success.svg)

A complete **Model-Based Design (MBD)** implementation of an **Anti-Lock Braking System (ABS)** built in MATLAB/Simulink. The project models quarter-car longitudinal dynamics, wheel rotational inertia, non-linear tire friction using the **Pacejka Magic Formula**, hydraulic brake actuator dynamics, and a **PI Controller** for closed-loop optimal slip ratio regulation ($\lambda_{\text{ref}} = 0.20$).

---

## 🚗 Key Features
- **Quarter-Car Vehicle Model:** Dynamics for vehicle velocity ($v$) and wheel angular speed ($\omega$).
- **Non-Linear Pacejka Tire Dynamics:** Longitudinal force calculation based on dynamic slip ratio ($\lambda$).
- **Closed-Loop PI Control:** Regulates brake torque ($T_b$) to lock slip ratio at the optimal peak friction point ($\mu_{\max}$).
- **Hydraulic Actuator Lag:** First-order model ($\tau_b = 0.03\text{ s}$) with torque saturation limit ($2000\text{ N}\cdot\text{m}$).
- **Advanced Testing Scenarios:** Performance comparison (ABS ON vs. ABS OFF) and sudden road surface transition testing (Split-$\mu$).

---

## 📊 System Architecture & Model Structure


### Mathematical Equations

1. **Vehicle Dynamics:**
   $$\dot{v} = -\frac{F_x}{m_q}$$

2. **Wheel Dynamics:**
   $$\dot{\omega} = \frac{R_{\text{eff}} \cdot F_x - T_b}{J_w}$$

3. **Slip Ratio Calculation:**
   $$\lambda = \frac{v - R_{\text{eff}} \cdot \omega}{\max(v, v_{\epsilon})}$$

4. **Pacejka Magic Formula:**
   $$\mu(\lambda) = D \cdot \sin\left(C \cdot \arctan\left(B \cdot \lambda - E \cdot (B \cdot \lambda - \arctan(B \cdot \lambda))\right)\right)$$

---

## 📈 Simulation Results & Highlights

### 1. ABS ON vs. ABS OFF Performance Benchmark
![ABS ON vs OFF Comparison](results/ABS_ON_vs_OFF.png)

| Parameter | ABS OFF (Locked Braking) | ABS ON (PI Controlled) |
| :--- | :--- | :--- |
| **Wheel Behavior** | Immediate Lockup ($\omega = 0\text{ rad/s}$) at $t \approx 0.2\text{s}$ | Smooth rotation, zero lockup |
| **Slip Ratio ($\lambda$)** | Maxed at $1.0$ (Full Skidding) | Regulated at $\lambda \approx 0.20$ |
| **Stopping Distance** | $43.5\text{ m}$ | **$39.8\text{ m}$** (Saved $3.7\text{ m}$) |
| **Stopping Time** | $3.2\text{ s}$ | **$2.8\text{ s}$** |
| **Steering Capability** | Lost | **Retained** |

---

### 2. Road Surface Transition Test (Split-$\mu$)
![Surface Transition Result](results/Surface_Transition.png)

- **Condition:** Transitioning from Dry Asphalt ($D = 1.0$) to Wet Surface ($D = 0.4$) at $t = 1.0\text{ s}$.
- **Result:** The PI Controller immediately drops the hydraulic pressure from $\approx 1100\text{ N}\cdot\text{m}$ to $\approx 440\text{ N}\cdot\text{m}$, preventing wheel lockup under low-friction conditions.

---

## 🛠️ How to Run the Model

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/YourUsername/ABS-Simulink-Control-System.git](https://github.com/YourUsername/ABS-Simulink-Control-System.git)
   ```
2. **Initialize Parameters:**
   Open MATLAB, navigate to `models/`, and run `Parameters.m` to load variables into the Workspace.
3. **Run Simulation:**
   Open `ABS.slx` in Simulink and click **Run**.
4. **Inspect Results:**
   Open **Simulation Data Inspector** or the connected **Scopes** to view results.

---

## 📂 Project Report
A complete engineering report with detailed parameter tables and mathematical derivations is available in `docs/ABS_Project_Report.pdf`.
