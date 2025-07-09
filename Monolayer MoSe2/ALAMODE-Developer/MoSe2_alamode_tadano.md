## Summary note of the phonon olympics entry for Germanium

- **Author**: Terumasa TADANO (NIMS)
- **Date**: June. 6, 2022.
- **Codes**: VASP 6.2.1 + ALAMODE 1.3.0 (some new features of dev branch are also tested)
- **Compilers**: Intel Compiler version 20.0.2.254 + Intel MKL
- **Compile flags**: `-O2` for ALAMODE, `-O2 -xHOST` for VASP
- **MPI library**: HPE MPI 2.21
- **Computer Resource**: NIMS simulator (Intel Xeon Platinum 8268 24core 2.9 GHz x 2 / node)

## 1. Structure - summary

The calculations were performed using `VASP` code with the following input parameters:
```
 PREC = Accurate
 ENCUT = 450
 EDIFF = 1.0e-8
 EDIFFG = -1.0e-4
 ISMEAR = 0
 SIGMA = 0.05
 ALGO= Normal
 LREAL = .FALSE.
 ADDGRID = .TRUE.
 LWAVE = .FALSE.
 LCHARG = .FALSE.
 ICHARG= 2
 ISTART=0
 NELM=200

 NPAR = 12
 ISIF = 4
 IBRION = 2
 NSW = 100
 POTIM = 0.1

 GGA = PS
 LAPSH = .True.
 ```

As shown in the tables and figures below, the lattice constant obtained from the equation-of-state fitting appears to reach convergence at 12x12x12 k points and `ENCUT=450`. So, I have chosen

- **ENCUT = 450**
- **12x12x12 k points for primitive**
- **a = 3.27 Angstrom**
- **c = 18.35 Angstrom**
- **d_{Se-Se} = 3.33 Angstrom**

for the following electronic/phonon calculations.





<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ENCUT (eV)</th>
      <th>lattice constant (Ang.)</th>
      <th>energy (eV)</th>
      <th>Se-Se distance (Ang.)</th>
      <th>Core Hours</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>200.0</td>
      <td>3.263367</td>
      <td>-21.302035</td>
      <td>3.332592</td>
      <td>2.692267</td>
    </tr>
    <tr>
      <th>1</th>
      <td>250.0</td>
      <td>3.270600</td>
      <td>-21.573823</td>
      <td>3.331152</td>
      <td>3.308640</td>
    </tr>
    <tr>
      <th>2</th>
      <td>300.0</td>
      <td>3.270181</td>
      <td>-21.588636</td>
      <td>3.330525</td>
      <td>3.794987</td>
    </tr>
    <tr>
      <th>3</th>
      <td>350.0</td>
      <td>3.270074</td>
      <td>-21.582925</td>
      <td>3.330557</td>
      <td>4.325120</td>
    </tr>
    <tr>
      <th>4</th>
      <td>400.0</td>
      <td>3.270230</td>
      <td>-21.584045</td>
      <td>3.330342</td>
      <td>4.891573</td>
    </tr>
    <tr>
      <th>5</th>
      <td>450.0</td>
      <td>3.270077</td>
      <td>-21.585465</td>
      <td>3.330229</td>
      <td>5.247520</td>
    </tr>
    <tr>
      <th>6</th>
      <td>500.0</td>
      <td>3.270074</td>
      <td>-21.586037</td>
      <td>3.330194</td>
      <td>6.251360</td>
    </tr>
    <tr>
      <th>7</th>
      <td>550.0</td>
      <td>3.270084</td>
      <td>-21.586228</td>
      <td>3.330177</td>
      <td>6.940533</td>
    </tr>
    <tr>
      <th>8</th>
      <td>600.0</td>
      <td>3.270054</td>
      <td>-21.586555</td>
      <td>3.330170</td>
      <td>7.747253</td>
    </tr>
    <tr>
      <th>9</th>
      <td>650.0</td>
      <td>3.270008</td>
      <td>-21.586735</td>
      <td>3.330147</td>
      <td>8.662880</td>
    </tr>
    <tr>
      <th>10</th>
      <td>700.0</td>
      <td>3.269988</td>
      <td>-21.586872</td>
      <td>3.330130</td>
      <td>9.229333</td>
    </tr>
    <tr>
      <th>11</th>
      <td>750.0</td>
      <td>3.269981</td>
      <td>-21.586922</td>
      <td>3.330128</td>
      <td>10.549600</td>
    </tr>
    <tr>
      <th>12</th>
      <td>800.0</td>
      <td>3.269974</td>
      <td>-21.586987</td>
      <td>3.330125</td>
      <td>11.809547</td>
    </tr>
    <tr>
      <th>13</th>
      <td>850.0</td>
      <td>3.269968</td>
      <td>-21.586911</td>
      <td>3.330121</td>
      <td>13.072640</td>
    </tr>
    <tr>
      <th>14</th>
      <td>900.0</td>
      <td>3.269968</td>
      <td>-21.586709</td>
      <td>3.330117</td>
      <td>14.110987</td>
    </tr>
    <tr>
      <th>15</th>
      <td>950.0</td>
      <td>3.269964</td>
      <td>-21.586556</td>
      <td>3.330113</td>
      <td>15.729333</td>
    </tr>
    <tr>
      <th>16</th>
      <td>1000.0</td>
      <td>3.269964</td>
      <td>-21.586437</td>
      <td>3.330109</td>
      <td>16.822827</td>
    </tr>
  </tbody>
</table>
</div>






<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th># k points along each axis</th>
      <th>lattice constant (Ang.)</th>
      <th>energy (eV)</th>
      <th>Se-Se distance (Ang.)</th>
      <th>Core Hours</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5</td>
      <td>3.271222</td>
      <td>-21.583849</td>
      <td>3.329585</td>
      <td>5.972800</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>3.269911</td>
      <td>-21.585260</td>
      <td>3.330606</td>
      <td>6.126667</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7</td>
      <td>3.270034</td>
      <td>-21.586395</td>
      <td>3.330231</td>
      <td>6.003840</td>
    </tr>
    <tr>
      <th>3</th>
      <td>8</td>
      <td>3.270107</td>
      <td>-21.586227</td>
      <td>3.330122</td>
      <td>6.493173</td>
    </tr>
    <tr>
      <th>4</th>
      <td>9</td>
      <td>3.270027</td>
      <td>-21.586506</td>
      <td>3.330199</td>
      <td>6.661440</td>
    </tr>
    <tr>
      <th>5</th>
      <td>10</td>
      <td>3.270074</td>
      <td>-21.586584</td>
      <td>3.330137</td>
      <td>7.236907</td>
    </tr>
    <tr>
      <th>6</th>
      <td>11</td>
      <td>3.270057</td>
      <td>-21.586550</td>
      <td>3.330166</td>
      <td>7.219520</td>
    </tr>
    <tr>
      <th>7</th>
      <td>12</td>
      <td>3.270054</td>
      <td>-21.586555</td>
      <td>3.330170</td>
      <td>7.747253</td>
    </tr>
    <tr>
      <th>8</th>
      <td>13</td>
      <td>3.270057</td>
      <td>-21.586561</td>
      <td>3.330165</td>
      <td>8.285867</td>
    </tr>
    <tr>
      <th>9</th>
      <td>14</td>
      <td>3.270054</td>
      <td>-21.586552</td>
      <td>3.330169</td>
      <td>8.448693</td>
    </tr>
    <tr>
      <th>10</th>
      <td>15</td>
      <td>3.270054</td>
      <td>-21.586557</td>
      <td>3.330168</td>
      <td>8.988800</td>
    </tr>
    <tr>
      <th>11</th>
      <td>16</td>
      <td>3.270054</td>
      <td>-21.586558</td>
      <td>3.330168</td>
      <td>9.528533</td>
    </tr>
    <tr>
      <th>12</th>
      <td>17</td>
      <td>3.270054</td>
      <td>-21.586554</td>
      <td>3.330168</td>
      <td>10.015573</td>
    </tr>
    <tr>
      <th>13</th>
      <td>18</td>
      <td>3.270054</td>
      <td>-21.586555</td>
      <td>3.330168</td>
      <td>10.721867</td>
    </tr>
    <tr>
      <th>14</th>
      <td>19</td>
      <td>3.270054</td>
      <td>-21.586555</td>
      <td>3.330168</td>
      <td>10.856747</td>
    </tr>
    <tr>
      <th>15</th>
      <td>20</td>
      <td>3.270057</td>
      <td>-21.586554</td>
      <td>3.330167</td>
      <td>11.463947</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](MoSe2_alamode_tadano_files/MoSe2_alamode_tadano_7_0.png)
    


## 2. Electronic - summary
The electronic band dispersion obtained from the 12x12x1 k points agrees well with the result obtained from the denser 16x16x1 k points. So, we conclude that 12x12x1 kpoints was accurate enough.


    
![png](MoSe2_alamode_tadano_files/MoSe2_alamode_tadano_10_0.png)
    


## 3.1 Harmonic - convergence at G and M points

The phonon frequencies at Gamma (0,0,0) and M(0.5, 0.0, 0.0) points are calculated using the following conditions:

- 2x2x1 supercell (12 atoms)
- displacement magnitude : 0.01 Angstrom
- make full use of symmetry (permutation, space group)
- consider ASR as constraint
- Fit displacement-force dataset by ordinary least squares




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>ENCUT (eV)</th>
      <th>f_G1</th>
      <th>f_G2</th>
      <th>f_G3</th>
      <th>f_G4</th>
      <th>f_M1</th>
      <th>f_M2</th>
      <th>f_M3</th>
      <th>f_M4</th>
      <th>f_M5</th>
      <th>f_M6</th>
      <th>f_M7</th>
      <th>f_M8</th>
      <th>f_M9</th>
      <th>k mesh style</th>
      <th>k mesh</th>
      <th>k mesh shift</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>400</td>
      <td>5.0299</td>
      <td>7.2436</td>
      <td>8.6062</td>
      <td>10.6454</td>
      <td>3.2184</td>
      <td>3.9465</td>
      <td>4.7459</td>
      <td>5.4730</td>
      <td>6.1385</td>
      <td>6.5083</td>
      <td>8.4890</td>
      <td>8.9536</td>
      <td>9.0362</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>1</th>
      <td>450</td>
      <td>5.0303</td>
      <td>7.2437</td>
      <td>8.6068</td>
      <td>10.6464</td>
      <td>3.2178</td>
      <td>3.9462</td>
      <td>4.7465</td>
      <td>5.4732</td>
      <td>6.1391</td>
      <td>6.5079</td>
      <td>8.4900</td>
      <td>8.9549</td>
      <td>9.0369</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>2</th>
      <td>500</td>
      <td>5.0301</td>
      <td>7.2434</td>
      <td>8.6066</td>
      <td>10.6458</td>
      <td>3.2180</td>
      <td>3.9459</td>
      <td>4.7463</td>
      <td>5.4729</td>
      <td>6.1386</td>
      <td>6.5078</td>
      <td>8.4897</td>
      <td>8.9544</td>
      <td>9.0362</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>3</th>
      <td>550</td>
      <td>5.0304</td>
      <td>7.2441</td>
      <td>8.6077</td>
      <td>10.6465</td>
      <td>3.2186</td>
      <td>3.9461</td>
      <td>4.7473</td>
      <td>5.4734</td>
      <td>6.1392</td>
      <td>6.5086</td>
      <td>8.4908</td>
      <td>8.9558</td>
      <td>9.0371</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>4</th>
      <td>600</td>
      <td>5.0308</td>
      <td>7.2447</td>
      <td>8.6085</td>
      <td>10.6475</td>
      <td>3.2193</td>
      <td>3.9466</td>
      <td>4.7485</td>
      <td>5.4739</td>
      <td>6.1399</td>
      <td>6.5093</td>
      <td>8.4919</td>
      <td>8.9576</td>
      <td>9.0382</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>5</th>
      <td>650</td>
      <td>5.0309</td>
      <td>7.2449</td>
      <td>8.6087</td>
      <td>10.6474</td>
      <td>3.2192</td>
      <td>3.9467</td>
      <td>4.7481</td>
      <td>5.4742</td>
      <td>6.1401</td>
      <td>6.5098</td>
      <td>8.4920</td>
      <td>8.9573</td>
      <td>9.0382</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>6</th>
      <td>700</td>
      <td>5.0308</td>
      <td>7.2445</td>
      <td>8.6081</td>
      <td>10.6472</td>
      <td>3.2189</td>
      <td>3.9469</td>
      <td>4.7476</td>
      <td>5.4741</td>
      <td>6.1399</td>
      <td>6.5097</td>
      <td>8.4913</td>
      <td>8.9565</td>
      <td>9.0380</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>7</th>
      <td>750</td>
      <td>5.0309</td>
      <td>7.2446</td>
      <td>8.6081</td>
      <td>10.6471</td>
      <td>3.2191</td>
      <td>3.9468</td>
      <td>4.7477</td>
      <td>5.4742</td>
      <td>6.1398</td>
      <td>6.5097</td>
      <td>8.4914</td>
      <td>8.9565</td>
      <td>9.0379</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
    <tr>
      <th>8</th>
      <td>800</td>
      <td>5.0310</td>
      <td>7.2445</td>
      <td>8.6082</td>
      <td>10.6473</td>
      <td>3.2190</td>
      <td>3.9467</td>
      <td>4.7477</td>
      <td>5.4742</td>
      <td>6.1398</td>
      <td>6.5095</td>
      <td>8.4915</td>
      <td>8.9567</td>
      <td>9.0381</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](MoSe2_alamode_tadano_files/MoSe2_alamode_tadano_14_0.png)
    


## 3.2 Harmonic - convergence of dispersion

To examine the convergence of phonon dispersion curves, we have performed phonon calculations using various supercells and k points as summarized below:




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Supercell (SC) size</th>
      <th># atoms in SC</th>
      <th>ENCUT</th>
      <th>k mesh style</th>
      <th>k mesh</th>
      <th>k mesh shift</th>
      <th>Core hours</th>
      <th>magnitude of\ndisplacement (Ang.)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>221</td>
      <td>12</td>
      <td>450.0</td>
      <td>Gamma</td>
      <td>[6, 6, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
      <td>10.561600</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>1</th>
      <td>661</td>
      <td>108</td>
      <td>450.0</td>
      <td>Gamma</td>
      <td>[2, 2, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
      <td>278.402240</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>2</th>
      <td>881</td>
      <td>192</td>
      <td>450.0</td>
      <td>Gamma</td>
      <td>[2, 2, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
      <td>1476.334613</td>
      <td>0.01</td>
    </tr>
  </tbody>
</table>
</div>



The results are plotted in the **figure below.**

The difference between 6x6x1 and 8x8x1 results is very small. When we did not include the nonanalytic correction, a small imaginary frequency pocket appeared near the gamma point for the ZA mode when 6x6x1 cell was used. This imaginary pocket can be removed by considering the nonanalytic correction or by using a larger 8x8x1 supercell (even without nonanalytic correction).



    
![png](MoSe2_alamode_tadano_files/MoSe2_alamode_tadano_19_0.png)
    


## 4.1 Anharmonic - convergence w.r.t. cutoff radius and supercell size

The result of the convergence check with respect to the cutoff radius for the third-order IFC is shown in the table and figures below.

The force constants are calculated with the following methods:

- Random displacements of all atoms with magnitude of 0.03 Ang. **The number of training snapshots is fixed to 200 irrespective of the cutoff radius for IFC3.**
- Full space group symmetry considered
- Impose ASR as constraints
- Estimate third-order IFCs by ordinary least squares
- **When fitting the third-order IFCs, the second-order IFCs are fixed to the values obtained in the step 3.**

The thermal conductivity calculations are performed with the following conditions:

- 60x60x1 q points
- Use space group symmetry for reducing sampling q points and triplets (q, q', q'')
- Tetrahedron method (`ISMEAR = -1`) for delta function evaluation (It is indeed a triangle method for 2D.)
- Atomic mass : 97.905404 au (Mo), 79.916522 au (Se)
- RTA
- no ph-iso scattering, no ph-boundary effects
- Phonon group velocity is evaluated as $\boldsymbol{v}_{\boldsymbol{q}j} \approx (\omega_{\boldsymbol{q}+\Delta\boldsymbol{q}j} - \omega_{\boldsymbol{q}-\Delta\boldsymbol{q}j})/2\Delta\boldsymbol{q}$ where $\Delta\boldsymbol{q}$ is a small value (~0.001).
- Nonanalytic correction with Ewald method.
- **The dielectric tensor of monolayer MoSe2 is estimated using the method in https://www.nature.com/articles/s41699-018-0050-x**
- **The Born effective charges of monolayer MoSe2 are estimated by fitting the values computed with various vacuum spacing with a polynomial function**






<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>SC size IFC2</th>
      <th>SC size IFC3</th>
      <th>Cutoff radius for IFC3 (bohr)</th>
      <th>nn shell</th>
      <th># disp. patterns.</th>
      <th># irred. IFC3</th>
      <th>kappa_{RTA,pure} (W/mK)</th>
      <th>qmesh</th>
      <th>Core hours (vasp)</th>
      <th>Core hours (kappa)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>881</td>
      <td>661</td>
      <td>4.75713</td>
      <td>1</td>
      <td>34</td>
      <td>24</td>
      <td>258.861145</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>1.280000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>881</td>
      <td>661</td>
      <td>6.17955</td>
      <td>2</td>
      <td>121</td>
      <td>102</td>
      <td>138.237985</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>1.280000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>881</td>
      <td>661</td>
      <td>6.29329</td>
      <td>3</td>
      <td>121</td>
      <td>113</td>
      <td>154.008646</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>1.333333</td>
    </tr>
    <tr>
      <th>3</th>
      <td>881</td>
      <td>661</td>
      <td>7.79854</td>
      <td>4</td>
      <td>147</td>
      <td>194</td>
      <td>110.964268</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>1.386667</td>
    </tr>
    <tr>
      <th>4</th>
      <td>881</td>
      <td>661</td>
      <td>8.82000</td>
      <td>5</td>
      <td>192</td>
      <td>308</td>
      <td>108.132240</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>1.440000</td>
    </tr>
    <tr>
      <th>5</th>
      <td>881</td>
      <td>661</td>
      <td>9.95008</td>
      <td>6</td>
      <td>288</td>
      <td>563</td>
      <td>71.519184</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>1.706667</td>
    </tr>
    <tr>
      <th>6</th>
      <td>881</td>
      <td>661</td>
      <td>10.70330</td>
      <td>7</td>
      <td>406</td>
      <td>814</td>
      <td>70.806357</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>2.133333</td>
    </tr>
    <tr>
      <th>7</th>
      <td>881</td>
      <td>661</td>
      <td>12.35910</td>
      <td>8</td>
      <td>502</td>
      <td>1095</td>
      <td>67.235983</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>2.773333</td>
    </tr>
    <tr>
      <th>8</th>
      <td>881</td>
      <td>661</td>
      <td>12.41640</td>
      <td>9</td>
      <td>522</td>
      <td>1346</td>
      <td>64.333921</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>2.826667</td>
    </tr>
    <tr>
      <th>9</th>
      <td>881</td>
      <td>661</td>
      <td>13.24300</td>
      <td>10</td>
      <td>558</td>
      <td>1871</td>
      <td>64.482781</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>3.680000</td>
    </tr>
    <tr>
      <th>10</th>
      <td>881</td>
      <td>661</td>
      <td>13.86910</td>
      <td>11</td>
      <td>594</td>
      <td>2186</td>
      <td>64.541191</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>4.160000</td>
    </tr>
    <tr>
      <th>11</th>
      <td>881</td>
      <td>661</td>
      <td>14.61380</td>
      <td>12</td>
      <td>630</td>
      <td>2498</td>
      <td>65.590300</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>5.280000</td>
    </tr>
    <tr>
      <th>12</th>
      <td>881</td>
      <td>661</td>
      <td>15.86670</td>
      <td>13</td>
      <td>762</td>
      <td>3158</td>
      <td>78.297846</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>5.653333</td>
    </tr>
    <tr>
      <th>13</th>
      <td>881</td>
      <td>661</td>
      <td>16.34960</td>
      <td>14</td>
      <td>925</td>
      <td>4335</td>
      <td>58.907759</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>7.360000</td>
    </tr>
    <tr>
      <th>14</th>
      <td>881</td>
      <td>661</td>
      <td>17.51890</td>
      <td>15</td>
      <td>997</td>
      <td>5265</td>
      <td>51.755103</td>
      <td>60 60 1</td>
      <td>11447.614347</td>
      <td>8.640000</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](MoSe2_alamode_tadano_files/MoSe2_alamode_tadano_23_0.png)
    


## 4.2 Anharmonic - convergence w.r.t. q mesh

The convergence of $\kappa_{L}$ with respect to the q point density was examined using the following computational conditions:

- `881` supercell for second-order IFCs, `661` for third-order IFCs
- Atomic mass : 97.905404 au (Mo), 79.916522 au (Se)
- $r_c = 12.43$ bohr for third-order IFCs
- Increase q mesh from 20x20x1 to 180x180x1
- RTA
- No isotope scattering

The results below shows that $\kappa_{L}$ keeps increasing with increasing $N_q$. </br>
Not sure if $\kappa_{L}$ converges in the $N_q\longrightarrow \infty$ limit. </br>
**We will use $N_q$ = 100 in the production run**.




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th># q points along each axis</th>
      <th>kappa_{RTA,pure} (W/mK)</th>
      <th>Core hours (kappa)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>20</td>
      <td>63.029056</td>
      <td>0.320000</td>
    </tr>
    <tr>
      <th>1</th>
      <td>40</td>
      <td>63.896414</td>
      <td>0.906667</td>
    </tr>
    <tr>
      <th>2</th>
      <td>60</td>
      <td>64.333921</td>
      <td>2.773333</td>
    </tr>
    <tr>
      <th>3</th>
      <td>80</td>
      <td>64.747894</td>
      <td>6.880000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>100</td>
      <td>65.050151</td>
      <td>14.346667</td>
    </tr>
    <tr>
      <th>5</th>
      <td>120</td>
      <td>65.317532</td>
      <td>26.080000</td>
    </tr>
    <tr>
      <th>6</th>
      <td>140</td>
      <td>65.521683</td>
      <td>42.773333</td>
    </tr>
    <tr>
      <th>7</th>
      <td>160</td>
      <td>65.758441</td>
      <td>66.986667</td>
    </tr>
    <tr>
      <th>8</th>
      <td>180</td>
      <td>65.932536</td>
      <td>99.093333</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](MoSe2_alamode_tadano_files/MoSe2_alamode_tadano_27_0.png)
    


## 4. Anharmonic - production run

After checking the convergence of kappa w.r.t. various parameters, I have chosen the following set of parameters for the production calculation.

- Lattice constant (Ang.) : 3.27
- C-axis length (Ang.) : 18.35
- Se-Se distance (Ang.) : 3.33
- ENCUT = 450
- SC for IFC2: `881`
- SC for IFC3: `661`
- Cutoff radius for IFC3 (bohr): 12.43 (includes up to 9NN shells)
- 100x100x1 q points
- tetrahedron method for delta function
- Mass of Mo : 95.9487 au for $\kappa_{nat}$, 97.905404 au for $\kappa_{pure}$
- Mass of Se : 78.9596 au for $\kappa_{nat}$, 79.916522 au for $\kappa_{pure}$
- isotope factor of Mo: 5.96749e-04 for $\kappa_{nat}$, 0 for $\kappa_{pure}$ 
- isotope factor of Se: 4.62933e-04 for $\kappa_{nat}$, 0 for $\kappa_{pure}$ 
- temperature step: 25 K 

The results of the production calculation are shown in the following tables/figures.




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>temperature (K)</th>
      <th>kappa_{nat, RTA} (W/mK)</th>
      <th>kappa_{pure, RTA} (W/mK)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>50</td>
      <td>557.704121</td>
      <td>721.181118</td>
    </tr>
    <tr>
      <th>1</th>
      <td>75</td>
      <td>319.412319</td>
      <td>365.449777</td>
    </tr>
    <tr>
      <th>2</th>
      <td>100</td>
      <td>218.455417</td>
      <td>239.437883</td>
    </tr>
    <tr>
      <th>3</th>
      <td>125</td>
      <td>165.706213</td>
      <td>177.752537</td>
    </tr>
    <tr>
      <th>4</th>
      <td>150</td>
      <td>133.762542</td>
      <td>141.624623</td>
    </tr>
    <tr>
      <th>5</th>
      <td>175</td>
      <td>112.399846</td>
      <td>117.952752</td>
    </tr>
    <tr>
      <th>6</th>
      <td>200</td>
      <td>97.093912</td>
      <td>101.226834</td>
    </tr>
    <tr>
      <th>7</th>
      <td>225</td>
      <td>85.568456</td>
      <td>88.760583</td>
    </tr>
    <tr>
      <th>8</th>
      <td>250</td>
      <td>76.560578</td>
      <td>79.094886</td>
    </tr>
    <tr>
      <th>9</th>
      <td>275</td>
      <td>69.315771</td>
      <td>71.370891</td>
    </tr>
    <tr>
      <th>10</th>
      <td>300</td>
      <td>63.355414</td>
      <td>65.050151</td>
    </tr>
    <tr>
      <th>11</th>
      <td>400</td>
      <td>47.260947</td>
      <td>48.140780</td>
    </tr>
    <tr>
      <th>12</th>
      <td>500</td>
      <td>37.759988</td>
      <td>38.272066</td>
    </tr>
    <tr>
      <th>13</th>
      <td>600</td>
      <td>31.466751</td>
      <td>31.784036</td>
    </tr>
    <tr>
      <th>14</th>
      <td>700</td>
      <td>26.983369</td>
      <td>27.186953</td>
    </tr>
    <tr>
      <th>15</th>
      <td>800</td>
      <td>23.624235</td>
      <td>23.756650</td>
    </tr>
    <tr>
      <th>16</th>
      <td>900</td>
      <td>21.011670</td>
      <td>21.097300</td>
    </tr>
    <tr>
      <th>17</th>
      <td>1000</td>
      <td>18.921391</td>
      <td>18.974981</td>
    </tr>
  </tbody>
</table>
</div>






<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>k index (irred.)</th>
      <th>branch index</th>
      <th>f (THz)</th>
      <th>lifetime (ps)</th>
      <th>mfp (nm)</th>
      <th>multiplicity</th>
      <th>modal kappa (W/mK)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>1</td>
      <td>1</td>
      <td>3.289832e-12</td>
      <td>0.00000</td>
      <td>0.000000</td>
      <td>1</td>
      <td>0.000000e+00</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>2</td>
      <td>3.289832e-12</td>
      <td>0.00000</td>
      <td>0.000000</td>
      <td>1</td>
      <td>0.000000e+00</td>
    </tr>
    <tr>
      <th>2</th>
      <td>1</td>
      <td>3</td>
      <td>3.289832e-12</td>
      <td>0.00000</td>
      <td>0.000000</td>
      <td>1</td>
      <td>0.000000e+00</td>
    </tr>
    <tr>
      <th>3</th>
      <td>1</td>
      <td>4</td>
      <td>5.030757e+00</td>
      <td>7.35286</td>
      <td>0.000000</td>
      <td>1</td>
      <td>0.000000e+00</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>5</td>
      <td>5.030757e+00</td>
      <td>7.35286</td>
      <td>0.000000</td>
      <td>1</td>
      <td>0.000000e+00</td>
    </tr>
    <tr>
      <th>...</th>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    <tr>
      <th>7951</th>
      <td>884</td>
      <td>5</td>
      <td>6.084408e+00</td>
      <td>6.24462</td>
      <td>0.251167</td>
      <td>6</td>
      <td>1.076216e-07</td>
    </tr>
    <tr>
      <th>7952</th>
      <td>884</td>
      <td>6</td>
      <td>6.096130e+00</td>
      <td>4.83518</td>
      <td>0.259852</td>
      <td>6</td>
      <td>1.487271e-07</td>
    </tr>
    <tr>
      <th>7953</th>
      <td>884</td>
      <td>7</td>
      <td>8.406720e+00</td>
      <td>5.44486</td>
      <td>0.092557</td>
      <td>6</td>
      <td>1.562546e-08</td>
    </tr>
    <tr>
      <th>7954</th>
      <td>884</td>
      <td>8</td>
      <td>8.869660e+00</td>
      <td>3.31397</td>
      <td>0.075109</td>
      <td>6</td>
      <td>1.662863e-08</td>
    </tr>
    <tr>
      <th>7955</th>
      <td>884</td>
      <td>9</td>
      <td>9.143430e+00</td>
      <td>2.61728</td>
      <td>0.059038</td>
      <td>6</td>
      <td>1.287696e-08</td>
    </tr>
  </tbody>
</table>
<p>7956 rows × 7 columns</p>
</div>




    
![png](MoSe2_alamode_tadano_files/MoSe2_alamode_tadano_32_0.png)
    


    63.35546780321118

