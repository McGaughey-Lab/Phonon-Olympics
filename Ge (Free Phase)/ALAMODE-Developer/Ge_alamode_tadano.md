## Summary note of the phonon olympics entry for Germanium

- **Author**: Terumasa TADANO (NIMS)
- **Date**: Jan. 27, 2022.
- **Codes**: VASP 6.2.1 + ALAMODE 1.3.0 (some new features of dev branch are also tested)
- **Compilers**: Intel Compiler version 20.0.2.254 + Intel MKL
- **Compile flags**: `-O2` for ALAMODE, `-O2 -xHOST` for VASP
- **MPI library**: HPE MPI 2.21
- **Computer Resource**: NIMS simulator (Intel Xeon Platinum 8268 24core 2.9 GHz x 2 / node)

## 1. Structure - summary

The calculations were performed using `VASP` code with the following input parameters:
```
 PREC = Accurate
 ENCUT = 300
 EDIFF = 1.0e-8
 EDIFFG = -1.0e-4
 ISMEAR = 2
 SIGMA = 0.2
 ALGO= Normal
 LREAL = .FALSE.
 ADDGRID = .TRUE.
 LWAVE = .FALSE.
 LCHARG = .FALSE.
 ICHARG= 2
 ISTART=0
 NELM=200

 NPAR = 8
 ISIF = 3
 IBRION = 2
 NSW = 100
 POTIM = 0.1

 GGA = PS
 ```

As shown in the tables and figures below, the lattice constant obtained from the variable-cell relaxation (`ISIF=3`) appears to reach convergence at 8x8x8 k points and `ENCUT=300`. So, I have chosen

- **ENCUT = 300**
- **8x8x8 k points for primitive**
- **a = 5.7019 Angstrom**

for the following electronic/phonon calculations.

<div class="alert alert-block alert-info">
<b>Note:</b> The k point may be denser for supercell calculations as described in the phonon dispersion part.




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
      <th>energy (eV)</th>
      <th>lattice constant (Ang.)</th>
      <th>ionic_steps</th>
      <th>cores</th>
      <th>Elapsed time (sec)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>200</td>
      <td>-9.789082</td>
      <td>5.70080</td>
      <td>4</td>
      <td>96</td>
      <td>13.557</td>
    </tr>
    <tr>
      <th>1</th>
      <td>250</td>
      <td>-9.790439</td>
      <td>5.70250</td>
      <td>3</td>
      <td>96</td>
      <td>8.925</td>
    </tr>
    <tr>
      <th>2</th>
      <td>300</td>
      <td>-9.791442</td>
      <td>5.70199</td>
      <td>4</td>
      <td>96</td>
      <td>8.242</td>
    </tr>
    <tr>
      <th>3</th>
      <td>350</td>
      <td>-9.792332</td>
      <td>5.70202</td>
      <td>3</td>
      <td>96</td>
      <td>7.098</td>
    </tr>
    <tr>
      <th>4</th>
      <td>400</td>
      <td>-9.792902</td>
      <td>5.70231</td>
      <td>3</td>
      <td>96</td>
      <td>8.194</td>
    </tr>
    <tr>
      <th>5</th>
      <td>450</td>
      <td>-9.793038</td>
      <td>5.70243</td>
      <td>3</td>
      <td>96</td>
      <td>8.021</td>
    </tr>
    <tr>
      <th>6</th>
      <td>500</td>
      <td>-9.793123</td>
      <td>5.70239</td>
      <td>3</td>
      <td>96</td>
      <td>7.977</td>
    </tr>
    <tr>
      <th>7</th>
      <td>550</td>
      <td>-9.793240</td>
      <td>5.70232</td>
      <td>3</td>
      <td>96</td>
      <td>7.604</td>
    </tr>
    <tr>
      <th>8</th>
      <td>600</td>
      <td>-9.793352</td>
      <td>5.70232</td>
      <td>1</td>
      <td>96</td>
      <td>5.874</td>
    </tr>
    <tr>
      <th>9</th>
      <td>650</td>
      <td>-9.793414</td>
      <td>5.70238</td>
      <td>3</td>
      <td>96</td>
      <td>8.895</td>
    </tr>
    <tr>
      <th>10</th>
      <td>700</td>
      <td>-9.793437</td>
      <td>5.70238</td>
      <td>1</td>
      <td>96</td>
      <td>6.954</td>
    </tr>
    <tr>
      <th>11</th>
      <td>750</td>
      <td>-9.793448</td>
      <td>5.70238</td>
      <td>1</td>
      <td>96</td>
      <td>7.419</td>
    </tr>
    <tr>
      <th>12</th>
      <td>800</td>
      <td>-9.793466</td>
      <td>5.70237</td>
      <td>2</td>
      <td>96</td>
      <td>9.082</td>
    </tr>
    <tr>
      <th>13</th>
      <td>850</td>
      <td>-9.793488</td>
      <td>5.70237</td>
      <td>2</td>
      <td>96</td>
      <td>8.599</td>
    </tr>
    <tr>
      <th>14</th>
      <td>900</td>
      <td>-9.793506</td>
      <td>5.70237</td>
      <td>1</td>
      <td>96</td>
      <td>7.685</td>
    </tr>
    <tr>
      <th>15</th>
      <td>950</td>
      <td>-9.793521</td>
      <td>5.70232</td>
      <td>6</td>
      <td>96</td>
      <td>14.759</td>
    </tr>
    <tr>
      <th>16</th>
      <td>1000</td>
      <td>-9.793547</td>
      <td>5.70232</td>
      <td>1</td>
      <td>96</td>
      <td>7.895</td>
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
      <th>energy (eV)</th>
      <th>lattice constant (Ang.)</th>
      <th>ionic_steps</th>
      <th>cores</th>
      <th>Elapsed time (sec)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>5</td>
      <td>-9.687007</td>
      <td>5.71213</td>
      <td>3</td>
      <td>96</td>
      <td>2.227</td>
    </tr>
    <tr>
      <th>1</th>
      <td>6</td>
      <td>-9.791674</td>
      <td>5.70153</td>
      <td>4</td>
      <td>96</td>
      <td>3.766</td>
    </tr>
    <tr>
      <th>2</th>
      <td>7</td>
      <td>-9.770145</td>
      <td>5.70430</td>
      <td>3</td>
      <td>96</td>
      <td>2.577</td>
    </tr>
    <tr>
      <th>3</th>
      <td>8</td>
      <td>-9.792838</td>
      <td>5.70229</td>
      <td>5</td>
      <td>96</td>
      <td>5.862</td>
    </tr>
    <tr>
      <th>4</th>
      <td>9</td>
      <td>-9.786484</td>
      <td>5.70219</td>
      <td>8</td>
      <td>96</td>
      <td>4.549</td>
    </tr>
    <tr>
      <th>5</th>
      <td>10</td>
      <td>-9.793064</td>
      <td>5.70242</td>
      <td>3</td>
      <td>96</td>
      <td>5.923</td>
    </tr>
    <tr>
      <th>6</th>
      <td>11</td>
      <td>-9.790658</td>
      <td>5.70225</td>
      <td>12</td>
      <td>96</td>
      <td>7.895</td>
    </tr>
    <tr>
      <th>7</th>
      <td>12</td>
      <td>-9.793123</td>
      <td>5.70239</td>
      <td>3</td>
      <td>96</td>
      <td>7.977</td>
    </tr>
    <tr>
      <th>8</th>
      <td>13</td>
      <td>-9.792114</td>
      <td>5.70253</td>
      <td>3</td>
      <td>96</td>
      <td>4.833</td>
    </tr>
    <tr>
      <th>9</th>
      <td>14</td>
      <td>-9.793118</td>
      <td>5.70228</td>
      <td>7</td>
      <td>96</td>
      <td>17.006</td>
    </tr>
    <tr>
      <th>10</th>
      <td>15</td>
      <td>-9.792685</td>
      <td>5.70258</td>
      <td>3</td>
      <td>96</td>
      <td>5.848</td>
    </tr>
    <tr>
      <th>11</th>
      <td>16</td>
      <td>-9.793104</td>
      <td>5.70224</td>
      <td>7</td>
      <td>96</td>
      <td>25.237</td>
    </tr>
    <tr>
      <th>12</th>
      <td>17</td>
      <td>-9.792922</td>
      <td>5.70256</td>
      <td>3</td>
      <td>96</td>
      <td>7.545</td>
    </tr>
    <tr>
      <th>13</th>
      <td>18</td>
      <td>-9.793097</td>
      <td>5.70224</td>
      <td>7</td>
      <td>96</td>
      <td>36.111</td>
    </tr>
    <tr>
      <th>14</th>
      <td>19</td>
      <td>-9.793031</td>
      <td>5.70253</td>
      <td>3</td>
      <td>96</td>
      <td>9.380</td>
    </tr>
    <tr>
      <th>15</th>
      <td>20</td>
      <td>-9.793095</td>
      <td>5.70225</td>
      <td>7</td>
      <td>96</td>
      <td>50.120</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](Ge_alamode_tadano_files/Ge_alamode_tadano_7_0.png)
    


## 2. Electronic - summary
The electronic band dispersion obtained from the 8x8x8 k points agrees well with the result obtained from the denser 12x12x12 k points. So, we conclude that 8x8x8 kpoints was accurate enough.


    
![png](Ge_alamode_tadano_files/Ge_alamode_tadano_11_0.png)
    


## 3.1 Harmonic - convergence at G, X, and L points

The phonon frequencies at Gamma (0,0,0), X(0.5, 0.5, 0), and L(0.5, 0.5, 0.5) points are calculated using the following conditions:

- 2x2x2 supercell (16 atoms)
- displacement magnitude : 0.01 Angstrom
- make full use of symmetry (permutation, space group)
- consider ASR as constraint
- Fit displacement-force dataset by ordinary least squares

The results of convergence check with respect to `ENCUT` are shown in the table and figure. As `ENCUT` increases, the frequencies tend to increase gradually and eventually reach convergence at `ENCUT ~ 600`. Still, our initial choice of `ENCUT = 300` already gives very reasonable results and meets the target accuracy of < 0.1 THz.




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
      <th>f_X1</th>
      <th>f_X2</th>
      <th>f_X3</th>
      <th>f_L1</th>
      <th>f_L2</th>
      <th>f_L3</th>
      <th>f_L4</th>
      <th>k mesh style</th>
      <th>k mesh</th>
      <th>k mesh shift</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>200</td>
      <td>8.4898</td>
      <td>2.1055</td>
      <td>6.9020</td>
      <td>7.8668</td>
      <td>1.7014</td>
      <td>6.3573</td>
      <td>6.9656</td>
      <td>8.2978</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>1</th>
      <td>250</td>
      <td>8.4916</td>
      <td>2.1038</td>
      <td>6.9009</td>
      <td>7.8671</td>
      <td>1.7006</td>
      <td>6.3565</td>
      <td>6.9641</td>
      <td>8.2988</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>2</th>
      <td>300</td>
      <td>8.4926</td>
      <td>2.1046</td>
      <td>6.9020</td>
      <td>7.8683</td>
      <td>1.7010</td>
      <td>6.3575</td>
      <td>6.9656</td>
      <td>8.2999</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>3</th>
      <td>350</td>
      <td>8.4935</td>
      <td>2.1031</td>
      <td>6.9020</td>
      <td>7.8690</td>
      <td>1.6998</td>
      <td>6.3571</td>
      <td>6.9658</td>
      <td>8.3007</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>4</th>
      <td>400</td>
      <td>8.4943</td>
      <td>2.1048</td>
      <td>6.9028</td>
      <td>7.8697</td>
      <td>1.7010</td>
      <td>6.3581</td>
      <td>6.9667</td>
      <td>8.3014</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>5</th>
      <td>450</td>
      <td>8.4942</td>
      <td>2.1047</td>
      <td>6.9025</td>
      <td>7.8695</td>
      <td>1.7010</td>
      <td>6.3578</td>
      <td>6.9662</td>
      <td>8.3012</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>6</th>
      <td>500</td>
      <td>8.4944</td>
      <td>2.1044</td>
      <td>6.9026</td>
      <td>7.8697</td>
      <td>1.7007</td>
      <td>6.3577</td>
      <td>6.9663</td>
      <td>8.3014</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>7</th>
      <td>550</td>
      <td>8.4948</td>
      <td>2.1047</td>
      <td>6.9029</td>
      <td>7.8701</td>
      <td>1.7009</td>
      <td>6.3581</td>
      <td>6.9668</td>
      <td>8.3018</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>8</th>
      <td>600</td>
      <td>8.4949</td>
      <td>2.1049</td>
      <td>6.9031</td>
      <td>7.8703</td>
      <td>1.7010</td>
      <td>6.3582</td>
      <td>6.9670</td>
      <td>8.3020</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>9</th>
      <td>650</td>
      <td>8.4950</td>
      <td>2.1052</td>
      <td>6.9032</td>
      <td>7.8703</td>
      <td>1.7013</td>
      <td>6.3584</td>
      <td>6.9670</td>
      <td>8.3020</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>10</th>
      <td>700</td>
      <td>8.4949</td>
      <td>2.1052</td>
      <td>6.9031</td>
      <td>7.8702</td>
      <td>1.7012</td>
      <td>6.3583</td>
      <td>6.9669</td>
      <td>8.3020</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>11</th>
      <td>750</td>
      <td>8.4950</td>
      <td>2.1053</td>
      <td>6.9031</td>
      <td>7.8703</td>
      <td>1.7013</td>
      <td>6.3583</td>
      <td>6.9670</td>
      <td>8.3020</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
    <tr>
      <th>12</th>
      <td>800</td>
      <td>8.4951</td>
      <td>2.1052</td>
      <td>6.9031</td>
      <td>7.8703</td>
      <td>1.7013</td>
      <td>6.3583</td>
      <td>6.9670</td>
      <td>8.3021</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](Ge_alamode_tadano_files/Ge_alamode_tadano_15_0.png)
    


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
      <th># of cores</th>
      <th>Total CPU time (sec.)</th>
      <th>Wall time (sec.)</th>
      <th>magnitude of\ndisplacement (Ang.)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>222</td>
      <td>16</td>
      <td>300.0</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
      <td>96</td>
      <td>13.830</td>
      <td>14.293</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>1</th>
      <td>222conv</td>
      <td>64</td>
      <td>300.0</td>
      <td>Gamma</td>
      <td>[3, 3, 3]</td>
      <td>[0.0, 0.0, 0.0]</td>
      <td>96</td>
      <td>33.521</td>
      <td>35.776</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>2</th>
      <td>222conv_fine</td>
      <td>64</td>
      <td>300.0</td>
      <td>Monkhorst</td>
      <td>[4, 4, 4]</td>
      <td>[0.5, 0.5, 0.5]</td>
      <td>96</td>
      <td>48.116</td>
      <td>51.821</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>3</th>
      <td>444</td>
      <td>128</td>
      <td>300.0</td>
      <td>Monkhorst</td>
      <td>[2, 2, 2]</td>
      <td>[0.5, 0.5, 0.5]</td>
      <td>96</td>
      <td>160.485</td>
      <td>166.963</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>4</th>
      <td>333conv</td>
      <td>216</td>
      <td>300.0</td>
      <td>Monkhorst</td>
      <td>[2, 2, 2]</td>
      <td>[0.5, 0.5, 0.5]</td>
      <td>96</td>
      <td>183.162</td>
      <td>186.060</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>5</th>
      <td>444conv</td>
      <td>512</td>
      <td>300.0</td>
      <td>Gamma</td>
      <td>[1, 1, 1]</td>
      <td>[0.0, 0.0, 0.0]</td>
      <td>96</td>
      <td>608.538</td>
      <td>612.415</td>
      <td>0.01</td>
    </tr>
    <tr>
      <th>6</th>
      <td>444conv_fine</td>
      <td>512</td>
      <td>300.0</td>
      <td>Monkhorst</td>
      <td>[2, 2, 2]</td>
      <td>[0.5, 0.5, 0.5]</td>
      <td>192</td>
      <td>1143.610</td>
      <td>1150.086</td>
      <td>0.01</td>
    </tr>
  </tbody>
</table>
</div>



The results are plotted in the **figure below.**

For the supercell size, 222 conventional (`222 conv. denser k`) appears to be adequate, but using a larger conventional supercell (`333 conv.` or `444 conv. denser k`) slightly improves the accuracy. Also, when the k mesh shift is 0 (or when the k mesh density is not enough?), the TO frequency at Gamma was underestimated. So, we will use the "denser k" option when necessary.


    
![png](Ge_alamode_tadano_files/Ge_alamode_tadano_20_0.png)
    


## 4.1 Anharmonic - convergence w.r.t. cutoff radius and supercell size

The results of the convergence check with respect to the cutoff radius for the third-order IFC and the supercell size are shown in the table and figures below.

The force constants are calculated with the following methods:

- Finite displacements with magnitude of 0.03 Ang.
- Full space group symmetry considered
- Impose ASR as constraints
- Estimate third-order IFCs by ordinary least squares
- **When fitting the third-order IFCs, the second-order IFCs are fixed to the values obtained in the step 3.**

The thermal conductivity calculations are performed with the following conditions:

- 30x30x30 q points
- Use space group symmetry for reducing sampling q points and triplets (q, q', q'')
- Tetrahedron method (`ISMEAR = -1`) for delta function evaluation
- Atomic mass : 69.924 u
- RTA
- no ph-iso scattering, no ph-boundary effects
- Phonon group velocity is evaluated as $\boldsymbol{v}_{\boldsymbol{q}j} \approx (\omega_{\boldsymbol{q}+\Delta\boldsymbol{q}j} - \omega_{\boldsymbol{q}-\Delta\boldsymbol{q}j})/2\Delta\boldsymbol{q}$ where $\Delta\boldsymbol{q}$ is a small value (~0.001).

<div class="alert alert-block alert-info">
<b>Developer Note:</b>For future reference, we have used the new mirror image convention (MIC=1) for third-order IFCs. This option is available only in the develop version of ALAMODE. Only the old convention (MIC=0) is available in the released version of ALAMODE. When the supercell size is 222conv, MIC=1 appears to give a smoother $r_c$ dependence of $\kappa_{L}$ than the MIC=0 case. The details of the new convention will be described elsewhere. </div>




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
      <th>Mirror image convention</th>
      <th># irred. IFC3</th>
      <th>kappa_{RTA,pure} (W/mK)</th>
      <th>qmesh</th>
      <th>node hour (vasp)</th>
      <th>node hour (kappa)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>4.66573</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>3</td>
      <td>41.9497</td>
      <td>30 30 30</td>
      <td>0.070111</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <th>2</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>7.61911</td>
      <td>2</td>
      <td>16</td>
      <td>0</td>
      <td>27</td>
      <td>53.8133</td>
      <td>30 30 30</td>
      <td>0.785553</td>
      <td>0.057778</td>
    </tr>
    <tr>
      <th>4</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>8.93420</td>
      <td>3</td>
      <td>16</td>
      <td>0</td>
      <td>82</td>
      <td>57.0099</td>
      <td>30 30 30</td>
      <td>0.785553</td>
      <td>0.095556</td>
    </tr>
    <tr>
      <th>6</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>10.77500</td>
      <td>4</td>
      <td>22</td>
      <td>0</td>
      <td>108</td>
      <td>58.3448</td>
      <td>30 30 30</td>
      <td>0.986054</td>
      <td>0.145556</td>
    </tr>
    <tr>
      <th>8</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>11.74180</td>
      <td>5</td>
      <td>22</td>
      <td>0</td>
      <td>197</td>
      <td>57.1037</td>
      <td>30 30 30</td>
      <td>0.986054</td>
      <td>0.283333</td>
    </tr>
    <tr>
      <th>10</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>13.19670</td>
      <td>6</td>
      <td>36</td>
      <td>0</td>
      <td>403</td>
      <td>50.3056</td>
      <td>30 30 30</td>
      <td>1.703464</td>
      <td>0.815556</td>
    </tr>
    <tr>
      <th>12</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>13.99720</td>
      <td>7</td>
      <td>36</td>
      <td>0</td>
      <td>541</td>
      <td>49.4076</td>
      <td>30 30 30</td>
      <td>1.703464</td>
      <td>1.087778</td>
    </tr>
    <tr>
      <th>14</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>15.23820</td>
      <td>8</td>
      <td>42</td>
      <td>0</td>
      <td>647</td>
      <td>46.5413</td>
      <td>30 30 30</td>
      <td>1.903855</td>
      <td>1.461111</td>
    </tr>
    <tr>
      <th>16</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>18.66290</td>
      <td>9</td>
      <td>45</td>
      <td>0</td>
      <td>777</td>
      <td>49.6683</td>
      <td>30 30 30</td>
      <td>1.988652</td>
      <td>1.906667</td>
    </tr>
    <tr>
      <th>54</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>4.66573</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>3</td>
      <td>43.8893</td>
      <td>30 30 30</td>
      <td>19.182040</td>
      <td>0.052222</td>
    </tr>
    <tr>
      <th>56</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>7.61911</td>
      <td>2</td>
      <td>16</td>
      <td>0</td>
      <td>27</td>
      <td>55.2852</td>
      <td>30 30 30</td>
      <td>19.897482</td>
      <td>0.064444</td>
    </tr>
    <tr>
      <th>58</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>8.93420</td>
      <td>3</td>
      <td>16</td>
      <td>0</td>
      <td>82</td>
      <td>59.4980</td>
      <td>30 30 30</td>
      <td>19.897482</td>
      <td>0.101111</td>
    </tr>
    <tr>
      <th>60</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>10.77500</td>
      <td>4</td>
      <td>22</td>
      <td>0</td>
      <td>108</td>
      <td>60.8296</td>
      <td>30 30 30</td>
      <td>20.097984</td>
      <td>0.144444</td>
    </tr>
    <tr>
      <th>62</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>11.74180</td>
      <td>5</td>
      <td>22</td>
      <td>0</td>
      <td>197</td>
      <td>60.6645</td>
      <td>30 30 30</td>
      <td>20.097984</td>
      <td>0.286667</td>
    </tr>
    <tr>
      <th>64</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>13.19670</td>
      <td>6</td>
      <td>36</td>
      <td>0</td>
      <td>403</td>
      <td>52.0562</td>
      <td>30 30 30</td>
      <td>20.815394</td>
      <td>0.821111</td>
    </tr>
    <tr>
      <th>66</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>13.99720</td>
      <td>7</td>
      <td>36</td>
      <td>0</td>
      <td>541</td>
      <td>50.7921</td>
      <td>30 30 30</td>
      <td>20.815394</td>
      <td>1.038889</td>
    </tr>
    <tr>
      <th>68</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>15.23820</td>
      <td>8</td>
      <td>42</td>
      <td>0</td>
      <td>647</td>
      <td>48.1163</td>
      <td>30 30 30</td>
      <td>21.015784</td>
      <td>1.458889</td>
    </tr>
    <tr>
      <th>70</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>18.66290</td>
      <td>9</td>
      <td>45</td>
      <td>0</td>
      <td>777</td>
      <td>51.9249</td>
      <td>30 30 30</td>
      <td>21.100581</td>
      <td>1.905556</td>
    </tr>
    <tr>
      <th>18</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>4.66573</td>
      <td>1</td>
      <td>2</td>
      <td>0</td>
      <td>3</td>
      <td>43.9943</td>
      <td>30 30 30</td>
      <td>0.260459</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <th>20</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>7.61911</td>
      <td>2</td>
      <td>16</td>
      <td>0</td>
      <td>27</td>
      <td>56.5825</td>
      <td>30 30 30</td>
      <td>2.568716</td>
      <td>0.063333</td>
    </tr>
    <tr>
      <th>22</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>8.93420</td>
      <td>3</td>
      <td>16</td>
      <td>0</td>
      <td>82</td>
      <td>60.2724</td>
      <td>30 30 30</td>
      <td>2.568716</td>
      <td>0.114444</td>
    </tr>
    <tr>
      <th>24</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>10.77500</td>
      <td>4</td>
      <td>25</td>
      <td>0</td>
      <td>110</td>
      <td>62.5659</td>
      <td>30 30 30</td>
      <td>3.841756</td>
      <td>0.127778</td>
    </tr>
    <tr>
      <th>26</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>11.74180</td>
      <td>5</td>
      <td>25</td>
      <td>0</td>
      <td>199</td>
      <td>61.6772</td>
      <td>30 30 30</td>
      <td>3.841756</td>
      <td>0.243333</td>
    </tr>
    <tr>
      <th>28</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>13.19670</td>
      <td>6</td>
      <td>45</td>
      <td>0</td>
      <td>437</td>
      <td>60.7980</td>
      <td>30 30 30</td>
      <td>7.753127</td>
      <td>0.548889</td>
    </tr>
    <tr>
      <th>30</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>13.99720</td>
      <td>7</td>
      <td>45</td>
      <td>0</td>
      <td>672</td>
      <td>59.9551</td>
      <td>30 30 30</td>
      <td>7.753127</td>
      <td>0.838889</td>
    </tr>
    <tr>
      <th>32</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>15.23820</td>
      <td>8</td>
      <td>59</td>
      <td>0</td>
      <td>879</td>
      <td>57.5333</td>
      <td>30 30 30</td>
      <td>10.103715</td>
      <td>1.216667</td>
    </tr>
    <tr>
      <th>34</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>15.93650</td>
      <td>9</td>
      <td>59</td>
      <td>0</td>
      <td>1353</td>
      <td>61.4298</td>
      <td>30 30 30</td>
      <td>10.103715</td>
      <td>1.646667</td>
    </tr>
    <tr>
      <th>36</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>17.03680</td>
      <td>10</td>
      <td>72</td>
      <td>0</td>
      <td>1886</td>
      <td>59.1438</td>
      <td>30 30 30</td>
      <td>11.974133</td>
      <td>2.761111</td>
    </tr>
    <tr>
      <th>38</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>17.66420</td>
      <td>11</td>
      <td>72</td>
      <td>0</td>
      <td>2233</td>
      <td>59.2816</td>
      <td>30 30 30</td>
      <td>11.974133</td>
      <td>3.233333</td>
    </tr>
    <tr>
      <th>40</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>18.66290</td>
      <td>12</td>
      <td>80</td>
      <td>0</td>
      <td>2447</td>
      <td>58.4536</td>
      <td>30 30 30</td>
      <td>13.417731</td>
      <td>3.533333</td>
    </tr>
    <tr>
      <th>42</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>19.23730</td>
      <td>13</td>
      <td>80</td>
      <td>0</td>
      <td>3106</td>
      <td>59.5940</td>
      <td>30 30 30</td>
      <td>13.417731</td>
      <td>4.445556</td>
    </tr>
    <tr>
      <th>44</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>20.15830</td>
      <td>14</td>
      <td>101</td>
      <td>0</td>
      <td>4598</td>
      <td>51.3066</td>
      <td>30 30 30</td>
      <td>17.167046</td>
      <td>8.478889</td>
    </tr>
    <tr>
      <th>46</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>20.69120</td>
      <td>15</td>
      <td>101</td>
      <td>0</td>
      <td>5768</td>
      <td>55.3364</td>
      <td>30 30 30</td>
      <td>17.167046</td>
      <td>10.918889</td>
    </tr>
    <tr>
      <th>48</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>22.85730</td>
      <td>16</td>
      <td>107</td>
      <td>0</td>
      <td>6822</td>
      <td>54.6249</td>
      <td>30 30 30</td>
      <td>17.856011</td>
      <td>14.932222</td>
    </tr>
    <tr>
      <th>50</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>23.32870</td>
      <td>17</td>
      <td>107</td>
      <td>0</td>
      <td>7406</td>
      <td>55.5794</td>
      <td>30 30 30</td>
      <td>17.856011</td>
      <td>14.383333</td>
    </tr>
    <tr>
      <th>52</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>25.26970</td>
      <td>18</td>
      <td>116</td>
      <td>0</td>
      <td>8578</td>
      <td>54.9731</td>
      <td>30 30 30</td>
      <td>19.111929</td>
      <td>18.636667</td>
    </tr>
    <tr>
      <th>1</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>4.66573</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>41.9497</td>
      <td>30 30 30</td>
      <td>0.070111</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <th>3</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>7.61911</td>
      <td>2</td>
      <td>16</td>
      <td>1</td>
      <td>27</td>
      <td>53.8133</td>
      <td>30 30 30</td>
      <td>0.785553</td>
      <td>0.057778</td>
    </tr>
    <tr>
      <th>5</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>8.93420</td>
      <td>3</td>
      <td>16</td>
      <td>1</td>
      <td>82</td>
      <td>57.0099</td>
      <td>30 30 30</td>
      <td>0.785553</td>
      <td>0.095556</td>
    </tr>
    <tr>
      <th>7</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>10.77500</td>
      <td>4</td>
      <td>22</td>
      <td>1</td>
      <td>107</td>
      <td>59.7641</td>
      <td>30 30 30</td>
      <td>0.986054</td>
      <td>0.121111</td>
    </tr>
    <tr>
      <th>9</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>11.74180</td>
      <td>5</td>
      <td>22</td>
      <td>1</td>
      <td>196</td>
      <td>57.8157</td>
      <td>30 30 30</td>
      <td>0.986054</td>
      <td>0.234444</td>
    </tr>
    <tr>
      <th>11</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>13.19670</td>
      <td>6</td>
      <td>36</td>
      <td>1</td>
      <td>395</td>
      <td>55.1884</td>
      <td>30 30 30</td>
      <td>1.703464</td>
      <td>0.520000</td>
    </tr>
    <tr>
      <th>13</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>13.99720</td>
      <td>7</td>
      <td>36</td>
      <td>1</td>
      <td>529</td>
      <td>56.5767</td>
      <td>30 30 30</td>
      <td>1.703464</td>
      <td>0.708889</td>
    </tr>
    <tr>
      <th>15</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>15.23820</td>
      <td>8</td>
      <td>42</td>
      <td>1</td>
      <td>630</td>
      <td>56.1841</td>
      <td>30 30 30</td>
      <td>1.903855</td>
      <td>0.867778</td>
    </tr>
    <tr>
      <th>17</th>
      <td>222conv_fine</td>
      <td>222conv_fine</td>
      <td>18.66290</td>
      <td>9</td>
      <td>45</td>
      <td>1</td>
      <td>743</td>
      <td>54.2696</td>
      <td>30 30 30</td>
      <td>1.988652</td>
      <td>1.127778</td>
    </tr>
    <tr>
      <th>55</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>4.66573</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>43.8893</td>
      <td>30 30 30</td>
      <td>19.182040</td>
      <td>0.051111</td>
    </tr>
    <tr>
      <th>57</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>7.61911</td>
      <td>2</td>
      <td>16</td>
      <td>1</td>
      <td>27</td>
      <td>55.2852</td>
      <td>30 30 30</td>
      <td>19.897482</td>
      <td>0.062222</td>
    </tr>
    <tr>
      <th>59</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>8.93420</td>
      <td>3</td>
      <td>16</td>
      <td>1</td>
      <td>82</td>
      <td>59.4980</td>
      <td>30 30 30</td>
      <td>19.897482</td>
      <td>0.098889</td>
    </tr>
    <tr>
      <th>61</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>10.77500</td>
      <td>4</td>
      <td>22</td>
      <td>1</td>
      <td>107</td>
      <td>62.2392</td>
      <td>30 30 30</td>
      <td>20.097984</td>
      <td>0.128889</td>
    </tr>
    <tr>
      <th>63</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>11.74180</td>
      <td>5</td>
      <td>22</td>
      <td>1</td>
      <td>196</td>
      <td>61.7227</td>
      <td>30 30 30</td>
      <td>20.097984</td>
      <td>0.236667</td>
    </tr>
    <tr>
      <th>65</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>13.19670</td>
      <td>6</td>
      <td>36</td>
      <td>1</td>
      <td>395</td>
      <td>57.4343</td>
      <td>30 30 30</td>
      <td>20.815394</td>
      <td>0.524444</td>
    </tr>
    <tr>
      <th>67</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>13.99720</td>
      <td>7</td>
      <td>36</td>
      <td>1</td>
      <td>529</td>
      <td>59.2178</td>
      <td>30 30 30</td>
      <td>20.815394</td>
      <td>0.695556</td>
    </tr>
    <tr>
      <th>69</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>15.23820</td>
      <td>8</td>
      <td>42</td>
      <td>1</td>
      <td>630</td>
      <td>58.8900</td>
      <td>30 30 30</td>
      <td>21.015784</td>
      <td>0.866667</td>
    </tr>
    <tr>
      <th>71</th>
      <td>333conv</td>
      <td>222conv_fine</td>
      <td>18.66290</td>
      <td>9</td>
      <td>45</td>
      <td>1</td>
      <td>743</td>
      <td>57.3074</td>
      <td>30 30 30</td>
      <td>21.100581</td>
      <td>1.127778</td>
    </tr>
    <tr>
      <th>19</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>4.66573</td>
      <td>1</td>
      <td>2</td>
      <td>1</td>
      <td>3</td>
      <td>43.9943</td>
      <td>30 30 30</td>
      <td>0.260459</td>
      <td>0.050000</td>
    </tr>
    <tr>
      <th>21</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>7.61911</td>
      <td>2</td>
      <td>16</td>
      <td>1</td>
      <td>27</td>
      <td>56.5825</td>
      <td>30 30 30</td>
      <td>2.568716</td>
      <td>0.063333</td>
    </tr>
    <tr>
      <th>23</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>8.93420</td>
      <td>3</td>
      <td>16</td>
      <td>1</td>
      <td>82</td>
      <td>60.2724</td>
      <td>30 30 30</td>
      <td>2.568716</td>
      <td>0.114444</td>
    </tr>
    <tr>
      <th>25</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>10.77500</td>
      <td>4</td>
      <td>25</td>
      <td>1</td>
      <td>110</td>
      <td>62.5659</td>
      <td>30 30 30</td>
      <td>3.841756</td>
      <td>0.125556</td>
    </tr>
    <tr>
      <th>27</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>11.74180</td>
      <td>5</td>
      <td>25</td>
      <td>1</td>
      <td>199</td>
      <td>61.6772</td>
      <td>30 30 30</td>
      <td>3.841756</td>
      <td>0.252222</td>
    </tr>
    <tr>
      <th>29</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>13.19670</td>
      <td>6</td>
      <td>45</td>
      <td>1</td>
      <td>437</td>
      <td>60.7980</td>
      <td>30 30 30</td>
      <td>7.753127</td>
      <td>0.525556</td>
    </tr>
    <tr>
      <th>31</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>13.99720</td>
      <td>7</td>
      <td>45</td>
      <td>1</td>
      <td>672</td>
      <td>59.9551</td>
      <td>30 30 30</td>
      <td>7.753127</td>
      <td>0.831111</td>
    </tr>
    <tr>
      <th>33</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>15.23820</td>
      <td>8</td>
      <td>59</td>
      <td>1</td>
      <td>879</td>
      <td>57.5333</td>
      <td>30 30 30</td>
      <td>10.103715</td>
      <td>1.253333</td>
    </tr>
    <tr>
      <th>35</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>15.93650</td>
      <td>9</td>
      <td>59</td>
      <td>1</td>
      <td>1353</td>
      <td>61.4298</td>
      <td>30 30 30</td>
      <td>10.103715</td>
      <td>1.637778</td>
    </tr>
    <tr>
      <th>37</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>17.03680</td>
      <td>10</td>
      <td>72</td>
      <td>1</td>
      <td>1879</td>
      <td>60.1619</td>
      <td>30 30 30</td>
      <td>11.974133</td>
      <td>2.304444</td>
    </tr>
    <tr>
      <th>39</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>17.66420</td>
      <td>11</td>
      <td>72</td>
      <td>1</td>
      <td>2226</td>
      <td>60.8593</td>
      <td>30 30 30</td>
      <td>11.974133</td>
      <td>2.840000</td>
    </tr>
    <tr>
      <th>41</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>18.66290</td>
      <td>12</td>
      <td>80</td>
      <td>1</td>
      <td>2440</td>
      <td>59.6788</td>
      <td>30 30 30</td>
      <td>13.417731</td>
      <td>2.985556</td>
    </tr>
    <tr>
      <th>43</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>19.23730</td>
      <td>13</td>
      <td>80</td>
      <td>1</td>
      <td>3095</td>
      <td>61.2347</td>
      <td>30 30 30</td>
      <td>13.417731</td>
      <td>3.782222</td>
    </tr>
    <tr>
      <th>45</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>20.15830</td>
      <td>14</td>
      <td>101</td>
      <td>1</td>
      <td>4572</td>
      <td>53.1382</td>
      <td>30 30 30</td>
      <td>17.167046</td>
      <td>5.830000</td>
    </tr>
    <tr>
      <th>47</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>20.69120</td>
      <td>15</td>
      <td>101</td>
      <td>1</td>
      <td>5733</td>
      <td>60.2106</td>
      <td>30 30 30</td>
      <td>17.167046</td>
      <td>8.494444</td>
    </tr>
    <tr>
      <th>49</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>22.85730</td>
      <td>16</td>
      <td>107</td>
      <td>1</td>
      <td>6761</td>
      <td>58.3787</td>
      <td>30 30 30</td>
      <td>17.856011</td>
      <td>8.671111</td>
    </tr>
    <tr>
      <th>51</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>23.32870</td>
      <td>17</td>
      <td>107</td>
      <td>1</td>
      <td>7336</td>
      <td>57.6586</td>
      <td>30 30 30</td>
      <td>17.856011</td>
      <td>9.443333</td>
    </tr>
    <tr>
      <th>53</th>
      <td>333conv</td>
      <td>333conv</td>
      <td>25.26970</td>
      <td>18</td>
      <td>116</td>
      <td>1</td>
      <td>8472</td>
      <td>54.5134</td>
      <td>30 30 30</td>
      <td>19.111929</td>
      <td>11.575556</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](Ge_alamode_tadano_files/Ge_alamode_tadano_24_0.png)
    


## 4.2 Anharmonic - convergence w.r.t. q mesh

The convergence of $\kappa_{L}$ with respect to the q point density was examined using the following computational conditions:

- `222conv_fine` supercell for second- and third-order IFCs
- Mass : 72.63 u **(Sorry, this is the standard atomic weight. I should have used 69.924 u instead, but the results are still valid because the purpose here is just to check the convergence.)**
- $r_c = 9.0$ bohr for third-order IFCs
- Increase q mesh from 10^3 to 100^3

The results below shows that $\kappa_{L}$ keeps increasing with increasing $N_q$.<br>
The computational cost increases dramatically (approximately proportional to $N_q^6$), but the improvement in the $\kappa_{L}$ value is very small in $N_q >50$.<br>
So, **we will use $N_q$ = 50 in the production run**.




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
      <th>node hour (kappa)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>10</td>
      <td>48.0115</td>
      <td>0.002222</td>
    </tr>
    <tr>
      <th>1</th>
      <td>20</td>
      <td>53.9465</td>
      <td>0.015556</td>
    </tr>
    <tr>
      <th>2</th>
      <td>30</td>
      <td>55.8224</td>
      <td>0.104444</td>
    </tr>
    <tr>
      <th>3</th>
      <td>40</td>
      <td>57.1469</td>
      <td>0.500000</td>
    </tr>
    <tr>
      <th>4</th>
      <td>50</td>
      <td>57.6150</td>
      <td>1.700000</td>
    </tr>
    <tr>
      <th>5</th>
      <td>60</td>
      <td>57.9273</td>
      <td>4.751111</td>
    </tr>
    <tr>
      <th>6</th>
      <td>70</td>
      <td>58.0341</td>
      <td>11.406667</td>
    </tr>
    <tr>
      <th>7</th>
      <td>80</td>
      <td>58.2699</td>
      <td>24.135556</td>
    </tr>
    <tr>
      <th>8</th>
      <td>90</td>
      <td>58.4567</td>
      <td>47.275556</td>
    </tr>
    <tr>
      <th>9</th>
      <td>100</td>
      <td>58.5975</td>
      <td>85.433333</td>
    </tr>
  </tbody>
</table>
</div>




    
![png](Ge_alamode_tadano_files/Ge_alamode_tadano_28_0.png)
    


## 4. Anharmonic - production run

After checking the convergence of kappa w.r.t. various parameters, I have chosen the following set of parameters for the production calculation.

- Lattice constant (Ang.) : 5.7019 
- ENCUT = 300
- SC for IFC2: `333conv`
- SC for IFC3: `222conv_fine`
- Cutoff radius for IFC3 (bohr): 9.0 (includes up to 3nn shells)
- 50x50x50 q points
- tetrahedron method for delta function
- Mass of Ge: 72.63 u for $\kappa_{nat}$, 69.924 u for $\kappa_{pure}$.
- isotope factor: 5.86712e-04 for $\kappa_{nat}$, 0 for $\kappa_{pure}$ 
- temperature step: 1 K (1,000 temperature points)

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
      <td>10</td>
      <td>4164.6404</td>
      <td>81248.4561</td>
    </tr>
    <tr>
      <th>1</th>
      <td>20</td>
      <td>1533.4823</td>
      <td>14143.2884</td>
    </tr>
    <tr>
      <th>2</th>
      <td>30</td>
      <td>925.5216</td>
      <td>5728.8972</td>
    </tr>
    <tr>
      <th>3</th>
      <td>40</td>
      <td>678.0002</td>
      <td>2704.8869</td>
    </tr>
    <tr>
      <th>4</th>
      <td>50</td>
      <td>517.7304</td>
      <td>1439.3737</td>
    </tr>
    <tr>
      <th>5</th>
      <td>75</td>
      <td>286.6413</td>
      <td>508.9327</td>
    </tr>
    <tr>
      <th>6</th>
      <td>100</td>
      <td>187.9214</td>
      <td>281.0113</td>
    </tr>
    <tr>
      <th>7</th>
      <td>125</td>
      <td>139.4809</td>
      <td>191.3812</td>
    </tr>
    <tr>
      <th>8</th>
      <td>150</td>
      <td>111.5504</td>
      <td>145.3769</td>
    </tr>
    <tr>
      <th>9</th>
      <td>175</td>
      <td>93.4468</td>
      <td>117.6502</td>
    </tr>
    <tr>
      <th>10</th>
      <td>200</td>
      <td>80.7202</td>
      <td>99.1177</td>
    </tr>
    <tr>
      <th>11</th>
      <td>225</td>
      <td>71.2437</td>
      <td>85.8260</td>
    </tr>
    <tr>
      <th>12</th>
      <td>250</td>
      <td>63.8841</td>
      <td>75.8013</td>
    </tr>
    <tr>
      <th>13</th>
      <td>275</td>
      <td>57.9842</td>
      <td>67.9526</td>
    </tr>
    <tr>
      <th>14</th>
      <td>300</td>
      <td>53.1362</td>
      <td>61.6288</td>
    </tr>
    <tr>
      <th>15</th>
      <td>400</td>
      <td>40.0251</td>
      <td>45.0969</td>
    </tr>
    <tr>
      <th>16</th>
      <td>500</td>
      <td>32.2297</td>
      <td>35.6675</td>
    </tr>
    <tr>
      <th>17</th>
      <td>600</td>
      <td>27.0232</td>
      <td>29.5387</td>
    </tr>
    <tr>
      <th>18</th>
      <td>700</td>
      <td>23.2859</td>
      <td>25.2241</td>
    </tr>
    <tr>
      <th>19</th>
      <td>800</td>
      <td>20.4672</td>
      <td>22.0174</td>
    </tr>
    <tr>
      <th>20</th>
      <td>900</td>
      <td>18.2629</td>
      <td>19.5384</td>
    </tr>
    <tr>
      <th>21</th>
      <td>1000</td>
      <td>16.4905</td>
      <td>17.5636</td>
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
      <th>iq (irred.)</th>
      <th>ib</th>
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
      <td>8.469826e+00</td>
      <td>1.93132</td>
      <td>0.000000</td>
      <td>1</td>
      <td>0.000000e+00</td>
    </tr>
    <tr>
      <th>4</th>
      <td>1</td>
      <td>5</td>
      <td>8.469826e+00</td>
      <td>1.93132</td>
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
      <th>18637</th>
      <td>3107</td>
      <td>2</td>
      <td>3.043553e+00</td>
      <td>12.18500</td>
      <td>2.549820</td>
      <td>12</td>
      <td>4.156040e-07</td>
    </tr>
    <tr>
      <th>18638</th>
      <td>3107</td>
      <td>3</td>
      <td>5.883337e+00</td>
      <td>1.57527</td>
      <td>0.374041</td>
      <td>12</td>
      <td>6.557070e-08</td>
    </tr>
    <tr>
      <th>18639</th>
      <td>3107</td>
      <td>4</td>
      <td>5.883337e+00</td>
      <td>1.57527</td>
      <td>0.374202</td>
      <td>12</td>
      <td>6.562700e-08</td>
    </tr>
    <tr>
      <th>18640</th>
      <td>3107</td>
      <td>5</td>
      <td>7.926962e+00</td>
      <td>1.79782</td>
      <td>0.014979</td>
      <td>12</td>
      <td>8.686780e-11</td>
    </tr>
    <tr>
      <th>18641</th>
      <td>3107</td>
      <td>6</td>
      <td>7.926962e+00</td>
      <td>1.79782</td>
      <td>0.015145</td>
      <td>12</td>
      <td>8.880470e-11</td>
    </tr>
  </tbody>
</table>
<p>18642 rows × 7 columns</p>
</div>




    
![png](Ge_alamode_tadano_files/Ge_alamode_tadano_33_0.png)
    

