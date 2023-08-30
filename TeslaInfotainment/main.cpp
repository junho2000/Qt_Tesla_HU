#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<Controllers/system.h>
#include <QQmlContext>
#include<Controllers/hvachandler.h>
#include<Controllers/audiocontroller.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    System m_systemHandler;
    HVACHandler m_driverHVACHandler;
    HVACHandler m_passenderHVACHandler;
    AudioController m_audioController;

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QQmlContext * context(engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("driverHVAC", &m_driverHVACHandler);
    context->setContextProperty("passengerHVAC", &m_passenderHVACHandler);
    context->setContextProperty("audioController", &m_audioController);

    return app.exec();
}
