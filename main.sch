<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xbr" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_12" />
        <signal name="C_clk" />
        <signal name="A_cpu_reset" />
        <signal name="B_post" />
        <signal name="LED_dbg" />
        <signal name="XLXN_79" />
        <signal name="XLXN_96" />
        <signal name="XLXN_98" />
        <signal name="E_i2c_scl" />
        <signal name="D_i2c_sda" />
        <port polarity="Input" name="C_clk" />
        <port polarity="BiDirectional" name="A_cpu_reset" />
        <port polarity="Input" name="B_post" />
        <port polarity="Output" name="LED_dbg" />
        <port polarity="Output" name="E_i2c_scl" />
        <port polarity="Output" name="D_i2c_sda" />
        <blockdef name="freq_doubler">
            <timestamp>2020-12-9T20:40:27</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="glitcher">
            <timestamp>2020-12-9T3:42:41</timestamp>
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="4" y1="-96" y2="-96" x1="68" />
            <rect width="256" x="64" y="-128" height="136" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="hana_i2c">
            <timestamp>2020-12-9T9:6:18</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="hana_i2c_clk">
            <timestamp>2020-12-9T6:41:30</timestamp>
            <rect width="320" x="64" y="-64" height="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
        </blockdef>
        <blockdef name="post_counter">
            <timestamp>2020-12-9T6:40:23</timestamp>
            <rect width="256" x="64" y="-128" height="240" />
            <line x2="384" y1="-16" y2="-16" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-16" y2="-16" x1="64" />
            <line x2="384" y1="64" y2="64" x1="320" />
        </blockdef>
        <block symbolname="post_counter" name="POST">
            <blockpin signalname="A_cpu_reset" name="cpu_reset" />
            <blockpin signalname="B_post" name="postbit1" />
            <blockpin signalname="XLXN_79" name="glitch" />
            <blockpin signalname="XLXN_96" name="i2c_send" />
            <blockpin signalname="LED_dbg" name="led" />
        </block>
        <block symbolname="freq_doubler" name="CLK_192">
            <blockpin signalname="C_clk" name="clk_in" />
            <blockpin signalname="XLXN_12" name="clk_out" />
        </block>
        <block symbolname="hana_i2c_clk" name="I2C_HANA_CLK">
            <blockpin signalname="C_clk" name="clk_48m" />
            <blockpin signalname="XLXN_98" name="clk_400k" />
        </block>
        <block symbolname="glitcher" name="GLITCH">
            <blockpin signalname="XLXN_12" name="clk_96m" />
            <blockpin signalname="A_cpu_reset" name="cpu_reset" />
            <blockpin signalname="XLXN_79" name="glitch" />
        </block>
        <block symbolname="hana_i2c" name="I2C_HANA">
            <blockpin signalname="XLXN_98" name="clk_400k" />
            <blockpin signalname="XLXN_96" name="i2c_send" />
            <blockpin signalname="D_i2c_sda" name="i2c_sda_io" />
            <blockpin signalname="E_i2c_scl" name="i2c_scl_io" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="544" y="1184" name="CLK_192" orien="R0">
        </instance>
        <branch name="A_cpu_reset">
            <wire x2="480" y1="992" y2="992" x1="352" />
            <wire x2="1472" y1="992" y2="992" x1="480" />
            <wire x2="1472" y1="992" y2="1152" x1="1472" />
            <wire x2="480" y1="992" y2="1392" x1="480" />
            <wire x2="544" y1="1392" y2="1392" x1="480" />
            <wire x2="1472" y1="1152" y2="1152" x1="1408" />
        </branch>
        <branch name="B_post">
            <wire x2="544" y1="1312" y2="1312" x1="288" />
        </branch>
        <branch name="LED_dbg">
            <wire x2="944" y1="1392" y2="1392" x1="928" />
            <wire x2="1456" y1="1392" y2="1392" x1="944" />
        </branch>
        <branch name="C_clk">
            <wire x2="400" y1="1152" y2="1152" x1="272" />
            <wire x2="544" y1="1152" y2="1152" x1="400" />
            <wire x2="400" y1="1152" y2="1648" x1="400" />
            <wire x2="528" y1="1648" y2="1648" x1="400" />
        </branch>
        <branch name="XLXN_12">
            <wire x2="1024" y1="1152" y2="1152" x1="928" />
        </branch>
        <instance x="1024" y="1248" name="GLITCH" orien="R0">
        </instance>
        <branch name="XLXN_79">
            <wire x2="992" y1="1312" y2="1312" x1="928" />
            <wire x2="992" y1="1216" y2="1312" x1="992" />
            <wire x2="1024" y1="1216" y2="1216" x1="992" />
        </branch>
        <instance x="544" y="1408" name="POST" orien="R0">
        </instance>
        <instance x="528" y="1680" name="I2C_HANA_CLK" orien="R0">
        </instance>
        <iomarker fontsize="28" x="288" y="1312" name="B_post" orien="R180" />
        <iomarker fontsize="28" x="272" y="1152" name="C_clk" orien="R180" />
        <iomarker fontsize="28" x="352" y="992" name="A_cpu_reset" orien="R180" />
        <branch name="XLXN_98">
            <wire x2="1024" y1="1648" y2="1648" x1="976" />
        </branch>
        <instance x="1024" y="1680" name="I2C_HANA" orien="R0">
        </instance>
        <branch name="XLXN_96">
            <wire x2="992" y1="1472" y2="1472" x1="928" />
            <wire x2="992" y1="1472" y2="1584" x1="992" />
            <wire x2="1024" y1="1584" y2="1584" x1="992" />
        </branch>
        <branch name="E_i2c_scl">
            <wire x2="1424" y1="1648" y2="1648" x1="1408" />
            <wire x2="1456" y1="1648" y2="1648" x1="1424" />
        </branch>
        <branch name="D_i2c_sda">
            <wire x2="1424" y1="1584" y2="1584" x1="1408" />
            <wire x2="1440" y1="1584" y2="1584" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1440" y="1584" name="D_i2c_sda" orien="R0" />
        <iomarker fontsize="28" x="1456" y="1648" name="E_i2c_scl" orien="R0" />
        <iomarker fontsize="28" x="1456" y="1392" name="LED_dbg" orien="R0" />
    </sheet>
</drawing>