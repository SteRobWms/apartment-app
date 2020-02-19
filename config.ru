$LOAD_PATH.unshift '.'
require 'config/environment'

use ApartmentsController
use TenantsController
# use ApplicationController
run ApplicationController
