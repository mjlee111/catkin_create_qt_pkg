/**
 * @file /src/qnode.cpp
 *
 * @brief Ros communication central!
 *
 * @date February 2011
 **/

/*****************************************************************************
** Includes
*****************************************************************************/

#include <ros/ros.h>
#include <ros/network.h>
#include <string>
#include <std_msgs/String.h>
#include <sstream>
#include "../include/% (package)s/qnode.hpp"

/*****************************************************************************
** Namespaces
*****************************************************************************/

namespace % (package)s
{

    /*****************************************************************************
    ** Implementation
    *****************************************************************************/

    QNode::QNode(int argc, char **argv) : init_argc(argc),
                                          init_argv(argv)
    {
    }

    QNode::~QNode()
    {
        if (ros::isStarted())
        {
            ros::shutdown(); // explicitly needed since we use ros::start();
            ros::waitForShutdown();
        }
        wait();
    }

    bool QNode::init()
    {
        ros::init(init_argc, init_argv, "% (package)s");
        if (!ros::master::check())
        {
            return false;
        }
        ros::start(); // explicitly needed since our nodehandle is going out of scope.
        ros::NodeHandle n;
        // Add your ros communications here.
        start();
        return true;
    }

    void QNode::run()
    {
        ros::Rate loop_rate(33);
        while (ros::ok())
        {

            ros::spinOnce();
            loop_rate.sleep();
        }
        std::cout << "Ros shutdown, proceeding to close the gui." << std::endl;
        Q_EMIT rosShutdown(); // used to signal the gui for a shutdown (useful to roslaunch)
    }

} // namespace % (package)s
