from robot.api.deco import keyword


@keyword('Some ${arg1} keyword ${arg2}')
def plot(arg1, arg2):
    """
    Some intro to the keyword

    Tags: tag1, tag2
    """
    pass
