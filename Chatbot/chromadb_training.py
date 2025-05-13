import os
import shutil
import numpy as np

from langchain.schema import Document
from langchain_huggingface import HuggingFaceEmbeddings
from langchain_chroma import Chroma
import database_helper as dbhp



phim_path = "T:/Workspace/chatbot-quan-ly-rap-chieu-phim/Intelligent AI Web Chatbot/Preparation/vectordb/Phim"
lich_chieu_path = "T:/Workspace/chatbot-quan-ly-rap-chieu-phim/Intelligent AI Web Chatbot/Preparation/vectordb/LichChieu"

def main():
    generate_data_store(phim_path)
    print_stored_data(phim_path)  # In ra dữ liệu đã lưu trữ


def generate_data_store(path):
    ten_phim = dbhp.get_ten_phim()
    if ten_phim:
        ten_phim_edited = '/##/'.join(ten_phim)
        chunks = split_text(ten_phim_edited)
        save_to_chroma(chunks, path)
    else:
        print("No data available for processing.")


def split_text(document: str):
    chunks = []
    parts = document.split('/##/')

    for part in parts:
        if part.strip():
            chunks.append(Document(page_content=part.strip(), metadata={}))

    print(f"Split into {len(chunks)} chunks.")
    return chunks


def save_to_chroma(chunks: list[Document], path):
    if os.path.exists(path):
        shutil.rmtree(path)

    embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")
    db = Chroma.from_documents(chunks, embeddings, persist_directory=path)
    print(f"Saved {len(chunks)} chunks to {path}.")



def print_stored_data(path):
    db = Chroma(persist_directory=path)

    try:
        documents_info = db.get()
        print("Raw documents info:", documents_info)  # Debugging line
        documents = documents_info.get('documents', [])

        print("Stored documents:")
        for index, doc in enumerate(documents):
            print(f"Document at index {index}: {type(doc)} - {doc}")  # Change to just print doc
    except Exception as e:
        print("Error retrieving documents:", e)

def search_stored_data(query: str, path):
    threshold = 1
    db = Chroma(persist_directory=path)
    embeddings = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

    try:
        documents_info = db.get()
        documents = documents_info.get('documents', [])

        if not isinstance(documents, list):
            print("Error: Retrieved documents are not in the expected list format.")
            return

        query_embedding = np.array(embeddings.embed_query(query))

        closest_index = None
        closest_distance = float('inf')
        closest_document = None

        for index, doc in enumerate(documents):
            if isinstance(doc, str):
                doc_embedding = np.array(embeddings.embed_query(doc))
            elif isinstance(doc, Document) and hasattr(doc, 'page_content'):
                doc_embedding = np.array(embeddings.embed_query(doc.page_content))
            else:
                print(f"Document at index {index} is not valid: {type(doc)} - {doc}")
                continue

            distance = np.linalg.norm(doc_embedding - query_embedding)

            if distance < closest_distance:
                closest_distance = distance
                closest_index = index
                closest_document = doc
        if closest_distance <= threshold:
            return closest_document
        else:
            return None

    except Exception as e:
        print("Error retrieving documents:", e)




if __name__ == "__main__":
    main()
    while True:
        search_query = input("Enter search query (or type 'exit' to quit): ")
        if search_query.lower() == "exit":
            print("Exiting the search program. Goodbye!")
            break

        result = search_stored_data(search_query, phim_path)
        if result:
            print("Found:", result)
        else:
            print("No results found within the threshold.")