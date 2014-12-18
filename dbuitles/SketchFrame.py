#coding:utf-8
import wx

class SketchWindow(wx.Window):

    def __init__(self,parent,ID):
        wx.Window.__init__(self,parent,ID)
        self.SetBackgroundColour("White")
        self.color = 'Red'
        self.thickness = 1
        # 创建一个wx.Pen对象
        self.pen = wx.Pen(self.color,self.thickness,wx.SOLID)
        self.lines = []
        self.curLine = []
        self.pos = (0,0)
        self.InitBuffer()
        # 连接事件
        self.Bind(wx.EVT_LEFT_DOWN,self.OnLeftDown)
        self.Bind(wx.EVT_LEFT_UP,self.OnLeftUp)
        self.Bind(wx.EVT_MOTION,self.OnMotion)
        self.Bind(wx.EVT_SIZE,self.OnSize)
        self.Bind(wx.EVT_IDLE,self.OnIdle)
        self.Bind(wx.EVT_PAINT,self.OnPaint)

    def InitBuffer(self):
        size = self.GetClientSize()
        #创建一个缓存的设备上下文
        self.buffer = wx.EmptyBitmap(size.width,size.height)
        dc = wx.BufferedDC(None,self.buffer)

        # 使用设备上下文
        dc.SetBackground(wx.Brush(self.GetBackgroundColour()))
        dc.Clear()
        self.DrawLines(dc)

        self.reInitBuffer = False

    def GetLinesData(self):
        return self.lines[:]

    def SetLineData(self,lines):
        self.lines = lines[:]
        self.InitBuffer()
        self.Refresh()

    def OnLeftDown(self,event):
        self.curLine = []
        self.pos = event.GetPositionTuple()
        self.CaptureMouse()

    def OnLeftUp(self,event):
        if self.HasCapture():
            self.lines.append((self.color,
                               self.thickness,
                               self.curLine))
            self.curLine = []
            self.ReleaseMouse()

    def OnMotion(self,event):
        if event.Dragging() and event.LeftIsDown():
            dc = wx.BufferedDC(wx.ClientDC(self),self.buffer)
            self.drawMotion(dc,event)
        event.Skip()

    def drawMotion(self,dc,event):
        dc.SetPen(self.pen)
        newPos = event.GetPositionTuple()
        coords = self.pos + newPos
        self.curLine.append(coords)
        dc.DrawLine(*coords)
        self.pos = newPos

    def OnSize(self,event):
        self.reInitBuffer = True

    def OnIdle(self,event):
        if self.reInitBuffer:
            self.InitBuffer()
            self.Refresh(False)

    def OnPaint(self,event):
        dc = wx.BufferedPaintDC(self,self.buffer)

    def DrawLines(self,dc):
        for colour,thickness,line in self.lines:
            pen = wx.Pen(colour,thickness,wx.SOLID)
            dc.SetPen(pen)
            for coords in line:
                dc.DrawLine(*coords)

    def SetColor(self,color):
        self.color = color
        self.pen = wx.Pen(self.color,self.thickness,wx.SOLID)

    def SetThickness(self,num):
        self.thickness = num
        self.pen = wx.Pen(self.color,self.thickness,wx.SOLID)

class SketchFrame(wx.Frame):

    def __init__(self,parent):
        wx.Frame.__init__(self,parent,-1,"Sketch Frame",size=(800,600))
        self.sketch = SketchWindow(self,-1)
        self.sketch.Bind(wx.EVT_MOTION,self.OnSketchMotion)
        self.initStatusBar()
        self.createMenuBar()

    def initStatusBar(self):
        self.statusbar = self.CreateStatusBar()
        self.statusbar.SetFieldsCount(3)
        self.statusbar.SetStatusWidths([-1,-2,-3])


    def OnSketchMotion(self,event):
        self.statusbar.SetStatusText("Pos:%s" % str(event.GetPositionTuple()),0)
        self.statusbar.SetStatusText("Current Pts:%s" % len(self.sketch.curLine),1)
        self.statusbar.SetStatusText("Line Count:%s" % len(self.sketch.lines),2)
        event.Skip()

    def menuData(self):
        return [("&File",(
                ("&New","New Sketch file",self.OnNew),
                ("&Open","Open sketch file",self.OnOpen),
                ("&Save","Save sketch file",self.OnSave),
                ("","",""),
                ("&Color",(
                    ("&Black","",self.OnColor,wx.ITEM_RADIO),
                    ("&Red","",self.OnColor,wx.ITEM_RADIO),
                    ("&Green","",self.OnColor,wx.ITEM_RADIO),
                    ("&Blue","",self.OnColor,wx.ITEM_RADIO),
                    ("&Other...","",self.OnOtherColor,wx.ITEM_RADIO))),
                ("","",""),
                ("&Quit","Quit",self.OnCloseWindow)))]

    def OnOtherColor(self,event):
        dlg = wx.ColourDialog(self)
        dlg.GetColourData().SetChooseFull(True)
        if dlg.ShowModal() == wx.ID_OK:
            self.sketch.SetColor(dlg.GetColourData().GetColour())
        dlg.Destroy()

    def createMenuBar(self):
        menuBar = wx.MenuBar()
        for eachMenuData in self.menuData():
            menuLabel = eachMenuData[0]
            menuItems = eachMenuData[1]
            menuBar.Append(self.createMenu(menuItems),menuLabel)
        self.SetMenuBar(menuBar)

    def createMenu(self,menuData):
        menu = wx.Menu()
        for eachItem in menuData:
            if len(eachItem) == 2:
                label = eachItem[0]
                subMenu = self.createMenu(eachItem[1])
                menu.AppendMenu(wx.NewId(),label,subMenu)
            else:
                self.createMenuItem(menu,*eachItem)
        return menu

    def createMenuItem(self,menu,label,status,handler,kind=wx.ITEM_NORMAL):
        if not label:
            menu.AppendSeparator()
            return
        menuItem = menu.Append(-1,label,status,kind)
        self.Bind(wx.EVT_MENU,handler,menuItem)

    def OnNew(self,event):pass
    def OnOpen(self,event):pass
    def OnSave(self,event):pass

    def OnColor(self,event):
        menuBar = self.GetMenuBar()
        itemId = event.GetId()
        item = menuBar.FindItemById(itemId)
        color = item.GetLabel()
        self.sketch.SetColor(color)

    def OnCloseWindow(self,event):
        self.Destroy()


if __name__ == '__main__':
    app = wx.PySimpleApp()
    frame = SketchFrame(None)
    frame.Show(True)
    app.MainLoop()
