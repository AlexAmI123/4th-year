#!/usr/bin/env python3
import rospy
import time
from turtlesim.msg import Color
from turtlesim.srv import SetPen
from geometry_msgs.msg import Twist

droprate = 30
droppacket = 0
#count to keep track of movement timing
count = 0


def colour_update(msg):
    global droprate
    global droppacket
    global count

    #On Red reverse
    if (((msg.r == 255) and (msg.g == 0) and (msg.b == 0))):
        reverse = Twist()
        reverse.linear.x = -1
        twist_pub.publish(reverse)
        time.sleep(2)
        reverse.linear.x = 0
        reverse.angular.z= 1.57
        twist_pub.publish(reverse)
        time.sleep(2)
        return

    #On white move forward and every 150 count check for a wall on the right (Right Hand Rule Algorithm)
    if ((msg.r == 255) and (msg.g == 255) and (msg.b == 255)):
        move = Twist()
        if (count==150):
            move.angular.z= -1.57 
            twist_pub.publish(move)  
            time.sleep(2)
            move.linear.x = 1
            twist_pub.publish(move)
            count=0

        else:
            move.linear.x = 1
            twist_pub.publish(move)
            count=count+1
        
        return
    
    #On Green Deadstop
    if ((msg.r == 0) and (msg.g == 255) and (msg.b == 0)):
        dead_stop = Twist()
        twist_pub.publish(dead_stop)
        return
    #On Blue Deadstop
    if ((msg.r == 0) and (msg.g == 0) and (msg.b == 255)):
        dead_stop = Twist()
        twist_pub.publish(dead_stop)
        return

    print('Colour: %d %d %d ' % (msg.r, msg.g, msg.b))

    droppacket = (droppacket + 1)%droprate
    if (droppacket != 0):
        return

if __name__=='__main__':
    # Initialise node
    rospy.init_node('random_walker',anonymous=True)
    # Create Color subscriber and attach to colour_update() callback
    colour_sub = rospy.Subscriber("turtle1/color_sensor",Color,\
        colour_update, queue_size=1)
    
    # Create a publisher endpoint for publishing Twist messages
    twist_pub = rospy.Publisher('turtle1/cmd_vel', Twist, queue_size=1)

    # This try / except block uses the service interface of the
    # turtlesim node to instruct it not to draw its path
    try:
        rospy.wait_for_service('turtle1/set_pen')
        set_pen = rospy.ServiceProxy('turtle1/set_pen', SetPen)
        set_pen(0,0,0,0,1)
    except rospy.ServiceException as e:
        print("Service call failed: {e}")

    # Here we enter into the ros spin loop which hands control
    # to ROS. This results in execution of the colour_update()
    # callback whenever a Color message is received.
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Keyboard input")