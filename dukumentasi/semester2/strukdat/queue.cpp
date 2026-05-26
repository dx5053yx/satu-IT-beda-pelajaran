#include <iostream>
using namespace std;
#define MAX_Q 5
// Deklarasi Struktur Queue
typedef struct {
  int front;
  int rear;
  int count;
  int data[MAX_Q];
} Queue;

Queue antrian;

void init(Queue *q) {
  q->front = 0;
  q->rear = 0;
  q->count = 0;
}

bool isFull(Queue *q) { return (q->count == MAX_Q); }

bool isEmpty(Queue *q) { return (q->count == 0); }

void enqueue(Queue *q, int value) {
  if (isFull(q)) {
    cout << "Maaf antrian penuh" << endl;
  } else {
    q->data[q->rear] = value;
    // Menggunakan modulus agar index berputar kembali ke 0

    q->rear = (q->rear + 1) % MAX_Q;
    q->count++;
    cout << value << " berhasil dimasukkan ke antrian." << endl;
  }
}

void dequeue(Queue *q) {
  if (isEmpty(q)) {
    cout << "Maaf antrian kosong" << endl;
  } else {
    int value = q->data[q->front];
    q->front = (q->front + 1) % MAX_Q;
    q->count--;
    cout << value << " berhasil dikeluarkan dari antrian." << endl;
  }
}

int main() {
  init(&antrian);
  cout << "Proses Enqueue:" << endl;
  enqueue(&antrian, 10);
  enqueue(&antrian, 20);
  enqueue(&antrian, 30);
  enqueue(&antrian, 40);
  enqueue(&antrian, 50);
  dequeue(&antrian);
  dequeue(&antrian);

  // cout << "Uji coba antrian penuh:" << endl;
  enqueue(&antrian, 70);


  return 0;
}