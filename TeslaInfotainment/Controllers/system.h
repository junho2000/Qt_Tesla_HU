#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>
class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool carLocked READ carLocked WRITE setCarLocked NOTIFY carLockedChanged)
    Q_PROPERTY(int outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString currentTime READ currentTime WRITE setcurrentTime NOTIFY currentTimeChanged)

public:
    explicit System(QObject *parent = nullptr);

    bool carLocked() const;
    int outdoorTemp() const;
    QString name() const;
    QString currentTime() const;

signals:
    void carLockedChanged(bool carLocked);
    void outdoorTempChanged(int outdoorTemp);
    void nameChanged(QString name);
    void currentTimeChanged(QString currentTime);

public slots:
    void setCarLocked(bool carLocked);
    void setOutdoorTemp(int outdoorTemp);
    void setName(QString name);
    void setcurrentTime(QString currentTime);
    void currentTimeTimerTimeout();

private:
    bool m_carLocked;
    int m_outdoorTemp;
    QString m_name;
    QString m_currentTime;
    QTimer * m_currentTimeTimer;
};

#endif // SYSTEM_H
