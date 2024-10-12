

const internal = function () {
    this.last_timeout;
    this.filtering = false;
    this.last = null;
	
	this.START_ellipse = null;
}
internal.prototype = Object.assign (internal.prototype, {
    options_internal: function () {
        var internals = this;

        const options_external = function (PARAMS) {
            internals.every = PARAMS.every;
			internals.START_ellipse = new Date ();
        }
        options_external.prototype = Object.assign (options_external.prototype, {
            attempt: function (show) {
                const ellipse = new Date ();

                clearTimeout (internals.last_timeout);
				
                internals.last_timeout = setTimeout (() => {
                    if (typeof internals.last === "function") {
                        internals.last ({
                            ellipse,
                            is_last: true
                        });
                    }
                }, internals.every);

                if (!internals.filtering) {
                    internals.filtering = true;
					
                    show ({
                        ellipse,
                        is_last: false
                    });

                    setTimeout (() => {
                        internals.filtering = false;
                    }, internals.every);
                }
                else {
                    internals.last = show;
                }
            }
        });

        return options_external;
    }
});

export function rhythm_filter (params) {
    return new ((new internal ()).options_internal ()) (params);
};