1. Download an R binary from [CRAN](https://cran.r-project.org/bin/macosx/) and install. Be sure to select the binary built for Apple silicon.

2. Install Apple's Command Line Tools for Xcode.
```
sudo xcode-select --install
```

3. Install the [GNU Fortran binary](https://mac.r-project.org/tools/).
```
curl -LO https://github.com/R-macos/gcc-12-branch/releases/download/12.2-darwin-r0.1/gfortran-12.2-darwin20-r0.1-universal.tar.xz
sudo tar xvf gfortran-12.2-darwin20-r0.1-universal.tar.xz -C /
sudo ln -sfn $(xcrun --show-sdk-path) /opt/gfortran/SDK
```

4. Query your Apple Clang version. 
```
clang --version
```

5. Install an [OpenMP](https://mac.r-project.org/openmp/) runtime suitable for your Apple Clang version.
```
curl -LO https://mac.r-project.org/openmp/openmp-14.0.6-darwin20-Release.tar.gz
sudo tar xvf openmp-14.0.6-darwin20-Release.tar.gz -C /
```

6. (Optional) Create ```(HOME)/.R/Makevars```.
```
mkdir -p ~/.R
touch ~/.R/Makevars
```

7. Add the following lines to ```(HOME)/.R/Makevars```.
```
CPPFLAGS += -I/usr/local/include -Xclang -fopenmp
LDFLAGS += -L/usr/local/lib -lomp
```
