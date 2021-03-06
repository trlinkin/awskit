# awskit::create_windows_node
#
# @summary Creates a number of Windows nodes
#
# @summary Creates $count of Windows nodes
#
# @example
#   include awskit::create_windows_node
class awskit::create_windows_node (
  $instance_type,
  $user_data,
  $count         = 1,
  $instance_name = 'awskit-windows',
){

  include awskit

  # create $count Windows nodes

  range(1,$count).each | $i | {
    awskit::create_host { "${instance_name}-${i}":
      ami           => $awskit::windows_ami,
      instance_type => $instance_type,
      user_data     => $user_data,
    }
  }
}
