from fastapi import FastAPI; app = FastAPI(); @app.get('/'); def root(): return {'message': 'Port 8101 is working'}
