<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="xbr" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk_in" />
        <signal name="clk_out" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <port polarity="Input" name="clk_in" />
        <port polarity="Output" name="clk_out" />
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="fd" name="XLXI_1">
            <blockpin signalname="clk_out" name="C" />
            <blockpin signalname="XLXN_6" name="D" />
            <blockpin signalname="XLXN_5" name="Q" />
        </block>
        <block symbolname="xor2" name="XLXI_2">
            <blockpin signalname="clk_in" name="I0" />
            <blockpin signalname="XLXN_6" name="I1" />
            <blockpin signalname="clk_out" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_3">
            <blockpin signalname="XLXN_5" name="I" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1472" y="1536" name="XLXI_1" orien="R0" />
        <instance x="1104" y="1696" name="XLXI_2" orien="R0" />
        <instance x="1088" y="1312" name="XLXI_3" orien="R0" />
        <branch name="clk_in">
            <wire x2="1088" y1="1632" y2="1632" x1="992" />
            <wire x2="1104" y1="1632" y2="1632" x1="1088" />
        </branch>
        <branch name="clk_out">
            <wire x2="1376" y1="1600" y2="1600" x1="1360" />
            <wire x2="1440" y1="1600" y2="1600" x1="1376" />
            <wire x2="1872" y1="1600" y2="1600" x1="1440" />
            <wire x2="1472" y1="1408" y2="1408" x1="1440" />
            <wire x2="1440" y1="1408" y2="1600" x1="1440" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1040" y1="1136" y2="1280" x1="1040" />
            <wire x2="1088" y1="1280" y2="1280" x1="1040" />
            <wire x2="1920" y1="1136" y2="1136" x1="1040" />
            <wire x2="1920" y1="1136" y2="1280" x1="1920" />
            <wire x2="1920" y1="1280" y2="1280" x1="1856" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1040" y1="1472" y2="1568" x1="1040" />
            <wire x2="1104" y1="1568" y2="1568" x1="1040" />
            <wire x2="1344" y1="1472" y2="1472" x1="1040" />
            <wire x2="1344" y1="1280" y2="1280" x1="1312" />
            <wire x2="1472" y1="1280" y2="1280" x1="1344" />
            <wire x2="1344" y1="1280" y2="1472" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="992" y="1632" name="clk_in" orien="R180" />
        <iomarker fontsize="28" x="1872" y="1600" name="clk_out" orien="R0" />
    </sheet>
</drawing>