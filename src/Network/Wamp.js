'use strict';

var autobahn = require('autobahn');

function WampError(e) {
    this.name = 'WampError';
    this.message = e.error || 'Default Message';
    this.error = e.error;
    this.args = e.args;
    this.kwargs = e.kwargs;
    this.stack = (new Error()).stack;
}
WampError.prototype = Object.create(Error.prototype);
WampError.prototype.constructor = WampError;

var tojse = function(e) {
    return new WampError(e);
};

exports.connection = function(opt) { return function() {
    return new autobahn.Connection(opt);
};};

exports.onOpen = function(onopen) { return function(conn) { return function() {
    conn.onopen = function(sess) {
        onopen(sess)();
    };
};};};

exports.open = function(c) { return function() {
    c.open();
};};

exports.closeImpl = function(isJust) { return function(fromMaybe) { return function(rsn) { return function(msg) { return function(c) { return function() {
    c.close(
        isJust(rsn) ? fromMaybe(rsn) : null,
        isJust(msg) ? fromMaybe(msg) : null);
};};};};};};

exports.sessionId = function(sess) {
    return sess.id
};

exports.realm = function(sess) {
    return sess.realm;
};

exports.setPrefix = function(shortcut) { return function(prefix) { return function(sess) { return function() {
    sess.prefix(shortcut, prefix);
};};};};

exports.clearPrefix = function(shortcut) { return function(sess) { return function() {
    sess.prefix(shortcut, null);
};};};

exports.log = function(msg) { return function(sess) { return function() {
    return sess.log(msg);
};};};

exports.unsubscribeImpl =
       function(toAff) {
return function(sub) {
return function(sess) {
    return toAff(sess.unsubscribe(sub).catch(tojse));
};};};

exports.pub0 =
       function(topic) {
return function(sess) {
return function() {
    sess.publish(topic, []);
};};};

exports.pub1 =
       function(topic) {
return function(a1) {
return function(sess) {
return function() {
    sess.publish(topic, [a1]);
};};};};

exports.pub2 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2]);
};};};};};

exports.pub3 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(a3) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2, a3]);
};};};};};};

exports.pub4 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(a3) {
return function(a4) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2, a3, a4]);
};};};};};};};

exports.pub5 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(a3) {
return function(a4) {
return function(a5) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2, a3, a4, a5]);
};};};};};};};};

exports.pub6 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(a3) {
return function(a4) {
return function(a5) {
return function(a6) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2, a3, a4, a5, a6]);
};};};};};};};};};

exports.pub7 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(a3) {
return function(a4) {
return function(a5) {
return function(a6) {
return function(a7) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2, a3, a4, a5, a6, a7]);
};};};};};};};};};};

exports.pub8 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(a3) {
return function(a4) {
return function(a5) {
return function(a6) {
return function(a7) {
return function(a8) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2, a3, a4, a5, a6, a7, a8]);
};};};};};};};};};};};

exports.pub9 =
       function(topic) {
return function(a1) {
return function(a2) {
return function(a3) {
return function(a4) {
return function(a5) {
return function(a6) {
return function(a7) {
return function(a8) {
return function(a9) {
return function(sess) {
return function() {
    sess.publish(topic, [a1, a2, a3, a4, a5, a6, a7, a8, a9]);
};};};};};};};};};};};};

exports.psub0 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub1 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub2 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub3 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])(args[2])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub4 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])(args[2])(args[3])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub5 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])(args[2])(args[3])(args[4])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub6 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])(args[2])(args[3])(args[4])(args[5])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub7 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])(args[2])(args[3])(args[4])(args[5])(args[6])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub8 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])(args[2])(args[3])(args[4])(args[5])(args[6])(args[7])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.psub9 =
       function(toAff) {
return function(topic) {
return function(eff) {
return function(sess) {
    var h = function(args, wkargs, det) {
        eff(args[0])(args[1])(args[2])(args[3])(args[4])(args[5])(args[6])(args[7])(args[8])();
    };
    return toAff(sess.subscribe(topic, h).catch(tojse));
};};};};

exports.pcall0 =
    function(toAff) {
    return function(name) {
    return function(sess) {
        return toAff(sess.call(name, []).catch(tojse));
    };};};

exports.pcall1 =
    function(toAff) {
    return function(name) {
    return function(a1) {
    return function(sess) {
        return toAff(sess.call(name, [a1]).catch(tojse));
    };};};};

exports.pcall2 =
    function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2]).catch(tojse));
    };};};};};

exports.pcall3 = function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(a3) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2, a3]).catch(tojse));
    };};};};};};

exports.pcall4 = function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(a3) {
    return function(a4) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2, a3, a4]).catch(tojse));
    };};};};};};};

exports.pcall5 = function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(a3) {
    return function(a4) {
    return function(a5) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2, a3, a4, a5]).catch(tojse));
    };};};};};};};};

exports.pcall6 = function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(a3) {
    return function(a4) {
    return function(a5) {
    return function(a6) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2, a3, a4, a5, a6]).catch(tojse));
    };};};};};};};};};

exports.pcall7 = function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(a3) {
    return function(a4) {
    return function(a5) {
    return function(a6) {
    return function(a7) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2, a3, a4, a5, a6, a7]).catch(tojse));
    };};};};};};};};};};

exports.pcall8 = function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(a3) {
    return function(a4) {
    return function(a5) {
    return function(a6) {
    return function(a7) {
    return function(a8) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2, a3, a4, a5, a6, a7, a8]).catch(tojse));
    };};};};};};};};};};};

exports.pcall9 = function(toAff) {
    return function(name) {
    return function(a1) {
    return function(a2) {
    return function(a3) {
    return function(a4) {
    return function(a5) {
    return function(a6) {
    return function(a7) {
    return function(a8) {
    return function(a9) {
    return function(sess) {
        return toAff(sess.call(name, [a1, a2, a3, a4, a5, a6, a7, a8, a9]).catch(tojse));
    };};};};};};};};};};};};
