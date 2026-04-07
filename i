<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Formulário de Comunidade — 42 São Paulo</title>
<style>
  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }
  :root {
    --bg: #ffffff;
    --bg-secondary: #f7f6f3;
    --text-primary: #1a1a1a;
    --text-secondary: #6b6b6b;
    --text-tertiary: #a0a0a0;
    --border: rgba(0,0,0,0.15);
    --border-hover: rgba(0,0,0,0.3);
    --border-focus: rgba(83,74,183,0.5);
    --accent: #534AB7;
    --accent-dark: #3C3489;
    --accent-light: #EEEDFE;
    --radius-md: 8px;
    --radius-lg: 12px;
    --font: system-ui, -apple-system, sans-serif;
  }
  @media (prefers-color-scheme: dark) {
    :root {
      --bg: #1a1a1a;
      --bg-secondary: #242424;
      --text-primary: #f0f0f0;
      --text-secondary: #a0a0a0;
      --text-tertiary: #666;
      --border: rgba(255,255,255,0.15);
      --border-hover: rgba(255,255,255,0.3);
      --border-focus: rgba(174,165,255,0.5);
      --accent: #7F77DD;
      --accent-dark: #AFA9EC;
      --accent-light: #26215C;
    }
  }
  body {
    font-family: var(--font);
    background: var(--bg-secondary);
    color: var(--text-primary);
    min-height: 100vh;
    padding: 2rem 1rem;
  }
  .page-wrap {
    max-width: 600px;
    margin: 0 auto;
  }
  .card {
    background: var(--bg);
    border-radius: var(--radius-lg);
    border: 0.5px solid var(--border);
    padding: 2rem;
  }
  .form-header { margin-bottom: 2rem; }
  .form-header h1 {
    font-size: 20px;
    font-weight: 500;
    color: var(--text-primary);
    margin-bottom: 6px;
  }
  .form-header p { font-size: 13px; color: var(--text-secondary); line-height: 1.5; }
  .badge {
    display: inline-block;
    background: var(--accent-light);
    color: var(--accent);
    font-size: 11px;
    font-weight: 500;
    padding: 3px 10px;
    border-radius: var(--radius-md);
    margin-bottom: 12px;
    letter-spacing: 0.04em;
  }
  .section-label {
    font-size: 10px;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 0.1em;
    color: var(--text-tertiary);
    margin-bottom: 14px;
  }
  .form-section { margin-bottom: 1.75rem; }
  .divider { height: 0.5px; background: var(--border); margin: 1.75rem 0; }
  .field { margin-bottom: 1rem; }
  .field:last-child { margin-bottom: 0; }
  .field label {
    display: block;
    font-size: 13px;
    color: var(--text-secondary);
    margin-bottom: 6px;
  }
  .req { color: #D85A30; margin-left: 2px; }
  input[type="text"], input[type="date"], select, textarea {
    width: 100%;
    font-size: 14px;
    font-family: var(--font);
    color: var(--text-primary);
    background: var(--bg);
    border: 0.5px solid var(--border);
    border-radius: var(--radius-md);
    padding: 9px 12px;
    outline: none;
    transition: border-color 0.15s, box-shadow 0.15s;
    -webkit-appearance: none;
  }
  input[type="text"]:focus, input[type="date"]:focus, select:focus, textarea:focus {
    border-color: var(--accent);
    box-shadow: 0 0 0 3px var(--border-focus);
  }
  textarea { resize: vertical; min-height: 80px; line-height: 1.6; }
  .row { display: grid; grid-template-columns: 1fr 1fr; gap: 12px; }
  @media (max-width: 480px) { .row { grid-template-columns: 1fr; } }
  .pace-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 8px; }
  @media (max-width: 480px) { .pace-grid { grid-template-columns: 1fr; } }
  .pace-card {
    border: 0.5px solid var(--border);
    border-radius: var(--radius-md);
    padding: 10px 12px;
    cursor: pointer;
    transition: all 0.15s;
    user-select: none;
  }
  .pace-card:hover { border-color: var(--border-hover); background: var(--bg-secondary); }
  .pace-card.selected { border-color: var(--accent); background: var(--accent-light); }
  .pace-card.selected .pace-name { color: var(--accent-dark); }
  .pace-name { font-size: 13px; font-weight: 500; color: var(--text-primary); }
  .pace-desc { font-size: 11px; color: var(--text-secondary); margin-top: 2px; }
  .freq-grid { display: flex; gap: 7px; flex-wrap: wrap; }
  .freq-btn {
    border: 0.5px solid var(--border);
    border-radius: var(--radius-md);
    padding: 7px 14px;
    font-size: 13px;
    font-family: var(--font);
    color: var(--text-secondary);
    cursor: pointer;
    background: var(--bg);
    transition: all 0.15s;
  }
  .freq-btn:hover { border-color: var(--border-hover); color: var(--text-primary); }
  .freq-btn.selected { border-color: var(--accent); background: var(--accent-light); color: var(--accent); font-weight: 500; }
  .radio-group { display: flex; flex-direction: column; gap: 8px; }
  .radio-item { display: flex; align-items: center; gap: 9px; cursor: pointer; }
  .radio-item input { accent-color: var(--accent); width: 15px; height: 15px; cursor: pointer; }
  .radio-item span { font-size: 14px; color: var(--text-primary); }
  .conditional { display: none; margin-top: 12px; }
  .conditional.visible { display: block; }
  .char-count { font-size: 11px; color: var(--text-tertiary); text-align: right; margin-top: 4px; }
  .submit-row { display: flex; justify-content: flex-end; margin-top: 2rem; }
  .submit-btn {
    background: var(--accent);
    color: #fff;
    border: none;
    border-radius: var(--radius-md);
    padding: 11px 28px;
    font-size: 14px;
    font-weight: 500;
    font-family: var(--font);
    cursor: pointer;
    transition: background 0.15s, transform 0.1s;
  }
  .submit-btn:hover { background: var(--accent-dark); }
  .submit-btn:active { transform: scale(0.98); }
  .success-msg {
    display: none;
    text-align: center;
    padding: 2rem;
  }
  .success-msg .icon {
    width: 48px; height: 48px;
    background: var(--accent-light);
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
    margin: 0 auto 1rem;
    font-size: 22px;
  }
  .success-msg h3 { font-size: 16px; font-weight: 500; margin-bottom: 6px; }
  .success-msg p { font-size: 13px; color: var(--text-secondary); }
</style>
</head>
<body>
<div class="page-wrap">
  <div class="card">
    <div class="form-header">
      <div class="badge">42 São Paulo</div>
      <h1>Formulário de comunidade</h1>
      <p>Preencha com atenção. Os dados ajudam a entender a saúde da comunidade e orientar ações de retenção.</p>
    </div>

    <div id="form-body">
      <div class="form-section">
        <div class="section-label">Identificação</div>
        <div class="row">
          <div class="field">
            <label>Login <span class="req">*</span></label>
            <input type="text" id="login" placeholder="seu_login" autocomplete="off" />
          </div>
          <div class="field">
            <label>Nome <span class="req">*</span></label>
            <input type="text" id="nome" placeholder="Nome completo" />
          </div>
        </div>
        <div class="field">
          <label>Quando entrou na 42 <span class="req">*</span></label>
          <input type="date" id="entrada" />
        </div>
      </div>

      <div class="divider"></div>

      <div class="form-section">
        <div class="section-label">Engajamento</div>
        <div class="field">
          <label>Pace atual <span class="req">*</span></label>
          <div class="pace-grid">
            <div class="pace-card" data-val="iniciante" onclick="selectPace(this)">
              <div class="pace-name">Iniciante</div>
              <div class="pace-desc">Piscine / início do cursus</div>
            </div>
            <div class="pace-card" data-val="intermediario" onclick="selectPace(this)">
              <div class="pace-name">Intermediário</div>
              <div class="pace-desc">Cursus em andamento</div>
            </div>
            <div class="pace-card" data-val="avancado" onclick="selectPace(this)">
              <div class="pace-name">Avançado</div>
              <div class="pace-desc">Projetos finais do cursus</div>
            </div>
          </div>
          <input type="hidden" id="pace-val" />
        </div>

        <div class="field">
          <label>Quantas vezes vem por semana <span class="req">*</span></label>
          <div class="freq-grid">
            <button class="freq-btn" data-val="raramente" onclick="selectFreq(this)">Raramente</button>
            <button class="freq-btn" data-val="1" onclick="selectFreq(this)">1×</button>
            <button class="freq-btn" data-val="2" onclick="selectFreq(this)">2×</button>
            <button class="freq-btn" data-val="3" onclick="selectFreq(this)">3×</button>
            <button class="freq-btn" data-val="4" onclick="selectFreq(this)">4×</button>
            <button class="freq-btn" data-val="5" onclick="selectFreq(this)">5×</button>
            <button class="freq-btn" data-val="6+" onclick="selectFreq(this)">6+ dias</button>
          </div>
          <input type="hidden" id="freq-val" />
        </div>

        <div class="field">
          <label>Você se considera uma pessoa ativa e assídua na 42? <span class="req">*</span></label>
          <div class="radio-group">
            <label class="radio-item">
              <input type="radio" name="assiduo" value="sim" onchange="toggleMotivo(this)" />
              <span>Sim</span>
            </label>
            <label class="radio-item">
              <input type="radio" name="assiduo" value="nao" onchange="toggleMotivo(this)" />
              <span>Não</span>
            </label>
            <label class="radio-item">
              <input type="radio" name="assiduo" value="parcialmente" onchange="toggleMotivo(this)" />
              <span>Parcialmente</span>
            </label>
          </div>
          <div class="conditional" id="motivo-block">
            <div class="field" style="margin-bottom:0; margin-top:4px;">
              <label>Se não, por quê?</label>
              <textarea id="motivo" placeholder="Descreva os fatores que afetam sua presença..." oninput="count(this,'motivo-count',300)"></textarea>
              <div class="char-count"><span id="motivo-count">0</span>/300</div>
            </div>
          </div>
        </div>
      </div>

      <div class="divider"></div>

      <div class="form-section">
        <div class="section-label">Percepção e sugestões</div>
        <div class="field">
          <label>O que você sugere para mudanças?</label>
          <textarea id="sugestoes" placeholder="Seja específico — estrutura, cultura, projetos, eventos..." oninput="count(this,'sug-count',500)"></textarea>
          <div class="char-count"><span id="sug-count">0</span>/500</div>
        </div>
        <div class="field">
          <label>Qual o maior problema atual de permanência da comunidade?</label>
          <textarea id="problema" placeholder="Aponte o principal obstáculo para retenção de cadetes..." oninput="count(this,'prob-count',500)"></textarea>
          <div class="char-count"><span id="prob-count">0</span>/500</div>
        </div>
      </div>

      <div class="submit-row">
        <button class="submit-btn" onclick="handleSubmit()">Enviar resposta</button>
      </div>
    </div>

    <div class="success-msg" id="success-msg">
      <div class="icon">✓</div>
      <h3>Resposta registrada</h3>
      <p>Obrigado pela contribuição. Seus dados ajudam a fortalecer a comunidade da 42 SP.</p>
    </div>
  </div>
</div>

<script>
function selectPace(el) {
  document.querySelectorAll('.pace-card').forEach(c => c.classList.remove('selected'));
  el.classList.add('selected');
  document.getElementById('pace-val').value = el.dataset.val;
}
function selectFreq(el) {
  document.querySelectorAll('.freq-btn').forEach(b => b.classList.remove('selected'));
  el.classList.add('selected');
  document.getElementById('freq-val').value = el.dataset.val;
}
function toggleMotivo(radio) {
  document.getElementById('motivo-block').classList.toggle('visible', radio.value !== 'sim');
}
function count(el, countId, max) {
  const len = el.value.length;
  document.getElementById(countId).textContent = len;
  if (len > max) el.value = el.value.slice(0, max);
}
const SHEET_URL = "https://script.google.com/macros/s/AKfycbxs3OMc4pn5BJnCQUQ0UuW-Yli6rvSp5-DzEEtlpPeU5xJmwIo8WyjnsEbsgtR8SeLD/exec";

function handleSubmit() {
  const login = document.getElementById('login').value.trim();
  const nome = document.getElementById('nome').value.trim();
  const entrada = document.getElementById('entrada').value;
  const pace = document.getElementById('pace-val').value;
  const freq = document.getElementById('freq-val').value;
  const assiduo = document.querySelector('input[name="assiduo"]:checked');
  if (!login || !nome || !entrada || !pace || !freq || !assiduo) {
    alert('Preencha todos os campos obrigatórios (*).');
    return;
  }

  const btn = document.querySelector('.submit-btn');
  btn.textContent = 'Enviando...';
  btn.disabled = true;

  const payload = {
    login,
    nome,
    entrada,
    pace,
    frequencia: freq,
    assiduo: assiduo.value,
    motivo: document.getElementById('motivo').value.trim(),
    sugestoes: document.getElementById('sugestoes').value.trim(),
    problema: document.getElementById('problema').value.trim()
  };

  fetch(SHEET_URL, {
    method: 'POST',
    mode: 'no-cors',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(payload)
  })
  .then(() => {
    document.getElementById('form-body').style.display = 'none';
    document.getElementById('success-msg').style.display = 'block';
  })
  .catch(() => {
    alert('Erro ao enviar. Verifique sua conexão e tente novamente.');
    btn.textContent = 'Enviar resposta';
    btn.disabled = false;
  });
}
</script>
</body>
</html>
