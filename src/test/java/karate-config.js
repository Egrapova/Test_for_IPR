function fn() {
    karate.configure('ssl', { trustAll: true });
    var env = karate.env;
    karate.log('karate.env system property was:', env);

    var config = { // base config JSON
    someUrlBase: 'https://reqres.in/'
    };
    // don't waste time waiting for a connection or if servers don't respond within 5 seconds
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    return config;
}