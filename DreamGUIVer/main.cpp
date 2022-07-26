#include "widget.h"

#include <QApplication>

//argc命令行变量数量 argv命令行变量数组
int main(int argc, char *argv[])
{
    QApplication a(argc, argv);//a为应用程序对象
    Widget w;//窗口对象 w
    w.show();//使用了一个show方法，使用show方法显示窗口
    return a.exec();//应用程序对象进入消息循环机制（点击X退出防止一闪而过）
}
