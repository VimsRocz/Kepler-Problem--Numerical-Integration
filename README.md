# Kepler-Problem--Numerical-Integration
This repository implements numerical integration of the Kepler problem for the CHAMP satellite orbit, assuming zero eccentricity and inclination of 90 degrees. It compares analytical and numerical solutions and explores the impact of step size on a custom integrator. (Uses MATLAB)

# Run only Numerical_orbit.m file 

# Kepler Problem - Numerical Integration

This GitHub repository explores the numerical simulation of the CHAMP satellite's orbit using MATLAB. It implements simplifying assumptions (e = 0, i = 90°) for the Kepler problem and allows you to compare analytical and numerical integration approaches.

## Key Functionalities

* Code to define the differential equations of the Kepler problem (`kepler_eom.m`).
* Script to compare analytical and numerically integrated orbits for 3 revolutions (`compare_orbits.m`).
* Program for a custom numerical integrator with variable step size to analyze accuracy (`custom_integrator.m`).

## Requirements

* MATLAB

## Usage

1. Clone this repository.
2. Open MATLAB.
3. Navigate to the project directory.
4. Run the desired script(s):

   * `kepler_eom.m`: Defines the differential equations.
   * `compare_orbits.m`: Compares analytical vs. numerical solutions.
   * `custom_integrator.m`: Implements the custom integrator.

**Note:** Modify initial conditions and parameters within the scripts as needed.

## Expected Results

* `compare_orbits.m` generates a plot showing the difference between analytical and numerical orbits.
* `custom_integrator.m` allows you to analyze how step size affects accuracy (smaller steps generally improve accuracy but increase computation time).

## Contributing

We welcome contributions! Create a pull request with your proposed changes.

## License

This project is licensed under the MIT License (see the LICENSE file for details).
