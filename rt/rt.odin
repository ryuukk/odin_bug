package rt


time_ticks :: proc() -> i64 {
    when ODIN_OS == .Linux {
        now:unix.timespec
        unix.clock_gettime(unix.CLOCK_MONOTONIC, &now)
        ticks:i64
        ticks += now.tv_sec
        ticks *= 1_000_000_000
        ticks += now.tv_nsec
        return ticks
    }
}