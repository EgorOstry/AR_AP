import time
import traceback
from app.logger import logger
from contextlib import contextmanager


@contextmanager
def time_logger(description="unknown"):
    start_time = time.time()
    logger.info(f"[START]: {description}")
    try:
        yield
    except Exception as e:
        end_time = time.time()
        dur = end_time - start_time
        hours, remainder = divmod(int(dur), 3600)
        minutes, seconds = divmod(remainder, 60)
        dur = f"{hours:02}:{minutes:02}:{seconds:02}"
        logger.error(f"[ERROR]: {description}, duration: {dur}")
        traceback.print_exc()
        logger.error(f"[ERROR]: {e}")
        raise
    else:
        end_time = time.time()
        dur = end_time - start_time
        hours, remainder = divmod(int(dur), 3600)
        minutes, seconds = divmod(remainder, 60)
        dur = f"{hours:02}:{minutes:02}:{seconds:02}"
        logger.info(f"[END]: {description}, duration: {dur}")