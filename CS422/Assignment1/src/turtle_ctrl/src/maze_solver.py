#!/usr/bin/env python3
import rospy

# Imports SetPen structure to instruct turtle not to draw its path
# through its SetPen service interface
from turtlesim.srv import SetPen

# Imports Twist message structure for issuing motion commands to turtle
from geometry_msgs.msg import Twist
import random

droprate = 30
droppacket = 0
rotate = False

# Imports Color message structure for monitoring if
# turtle is over red square
from turtlesim.msg import Color

def colour_update(msg):
    global droprate
    global droppacket
    global rotate

    # Check if we are at the edge of the image and if so
    # reverse and turn 90 degrees
    if (((msg.r == 255) and (msg.g == 0) and (msg.b == 0))):
        #droppacket = 1
        backup = Twist()
        backup.linear.x = -3
        twist_pub.publish(backup)
        rotate = True
        return

    print('Colour: %d %d %d ' % (msg.r, msg.g, msg.b))

    # Check if we are on the Green or Blue square and if so then set
    # moving to False and come to a dead stop
    if ((msg.r == 0) and (msg.g == 255) and (msg.b == 0)) or ((msg.r == 0) and (msg.g == 0) and (msg.b == 255)) :
        dead_stop = Twist()
        twist_pub.publish(dead_stop)
        return

    # Color messages are published at a high rate by turtlesim
    # which means that if we publish Twist messages at the same
    # rate the motion will be very erratic
    #
    # To avoid this we use droppacket and droprate to control the
    # ratio of Color messages received to Twist messages published
    droppacket = (droppacket + 1)%droprate
    if (droppacket != 0):
        return

    #if rotate
    if(rotate == True):
        rotate_motion = Twist()
        rotate_motion.angular.z = 1.57
        twist_pub.publish(rotate_motion)


    #forward motion
    next_move = Twist() # initialises to zero motion
    next_move.linear.x = 3


    # Publish the next_move
    twist_pub.publish(next_move)

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