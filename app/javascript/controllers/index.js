// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
import DatepickerController from "controllers/datepicker_controller"
import BookingController from "controllers/booking_controller"
application.register("datepicker", DatepickerController)
application.register("booking", BookingController)
