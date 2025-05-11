import time
from app.logger import logger


def log_dec(func):
    def wrapper(*args, **kwargs):
        func_name = func.__name__
        start_time = time.time()
        try:
            logger.info(f"[START]: {func_name}")
            result = func(*args, **kwargs)
        except Exception as e:
            end_time = time.time()
            dur = end_time - start_time
            hours, remainder = divmod(int(dur), 3600)
            minutes, seconds = divmod(remainder, 60)
            dur = f"{hours:02}:{minutes:02}:{seconds:02}"
            logger.error(f"[ERROR]: {func_name}, duration: {dur}")
            logger.error(f"[ERROR]: {e}")
            raise
        else:
            end_time = time.time()
            dur = end_time - start_time
            hours, remainder = divmod(int(dur), 3600)
            minutes, seconds = divmod(remainder, 60)
            dur = f"{hours:02}:{minutes:02}:{seconds:02}"
            logger.info(f"[END]: {func_name}, duration: {dur}")
            return result
    return wrapper
