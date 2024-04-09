import time
from multiprocessing import Process, Queue

def calculate_pi(start, end, result_queue):
    pi = 0
    for i in range(start, end):
        pi += (-1) ** i * (4 / (2 * i + 1))
    result_queue.put(pi)

def main():
    # Initialize variables
    niter = 1000000000
    num_processes = 2  # Adjust the number of processes as needed

    # Timing
    start = time.time()

    # Calculate part of Leibniz sum using multiprocessing
    result_queue = Queue()
    processes = []
    chunk_size = niter // num_processes
    for i in range(num_processes):
        process = Process(target=calculate_pi, args=(i * chunk_size, (i + 1) * chunk_size, result_queue))
        processes.append(process)
        process.start()

    # Wait for all processes to finish
    for process in processes:
        process.join()

    # Combine results
    pi = 0
    while not result_queue.empty():
        pi += result_queue.get()

    # Stop timing
    end = time.time()

    # Print result
    print("pi estimate is {:.10f}, obtained in {:.3f} seconds in Python with multiprocessing".format(pi, end - start))

if __name__ == "__main__":
    main()

