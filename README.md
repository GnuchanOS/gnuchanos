<img src="https://raw.githubusercontent.com/gnuchanos/GnuchanOS/main/bg.png" align="center" style="width: 100%" />
</div>

<div align="center">this is dream gnu/linux distro maybe one day become real
</div>  
<hr>
<ul>

</ul>



<div align="center"> not for me 
If you are running Bumblebee with NVIDIA driver, you need to disable power management for the GPU in TLP in order to make Bumblebee control the power of the GPU.

Depending on the driver(s) that you are using, blacklist one or more of them, preventing TLP from managing their power state:

/etc/tlp.conf
RUNTIME_PM_DRIVER_DENYLIST="nouveau nvidia"
</div>


<br/>

