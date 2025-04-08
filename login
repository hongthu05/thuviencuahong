<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hệ thống quản lý thư viện</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        
        .header {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        
        .auth-buttons {
            display: flex;
        }
        
        .auth-buttons a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            padding: 8px 12px;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        
        .auth-buttons a:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }
        
        .nav {
            background-color: #2980b9;
            overflow: hidden;
        }
        
        .nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        
        .nav a:hover {
            background-color: #3498db;
        }
        
        .nav a.active {
            background-color: #1a5276;
        }
        
        .main-content {
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .welcome-banner {
            background: linear-gradient(135deg, #3498db, #2980b9);
            color: white;
            padding: 30px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 30px;
        }
        
        .welcome-banner h2 {
            margin-top: 0;
            font-size: 32px;
        }
        
        .features {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }
        
        .feature-card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            flex: 1;
            min-width: 300px;
        }
        
        .feature-card h3 {
            color: #2980b9;
            margin-top: 0;
        }
        
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }
        
        .modal-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            border-radius: 5px;
            width: 400px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            position: relative;
        }
        
        .close-button {
            position: absolute;
            right: 20px;
            top: 15px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        
        .submit-button {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        
        .submit-button:hover {
            background-color: #3498db;
        }
        
        .form-toggle {
            text-align: center;
            margin-top: 15px;
        }
        
        .form-toggle a {
            color: #2980b9;
            text-decoration: none;
        }
        
        .form-toggle a:hover {
            text-decoration: underline;
        }
        
        .user-info {
            display: none;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Hệ thống quản lý thư viện</h1>
        <div class="auth-buttons">
            <a href="#" id="login-button">Đăng nhập</a>
            <a href="#" id="register-button">Đăng ký</a>
            <div class="user-info">
                <span id="user-display"></span>
                <a href="#" id="logout-button">Đăng xuất</a>
            </div>
        </div>
    </div>
    
    <div class="nav">
        <a href="#" class="active">Trang chủ</a>
        <a href="#">Tìm kiếm sách</a>
        <a href="#">Mượn và trả sách</a>
        <a href="#">Quản lý độc giả</a>
    </div>
    
    <div class="main-content">
        <div class="welcome-banner">
            <h2>Chào mừng đến với hệ thống quản lý thư viện</h2>
            <p>Hệ thống giúp quản lý sách, độc giả và các hoạt động mượn trả một cách hiệu quả.</p>
        </div>
        
        <div class="features">
            <div class="feature-card">
                <h3>Tìm kiếm sách</h3>
                <p>Dễ dàng tìm kiếm sách theo tên, tác giả, thể loại.</p>
            </div>
            
            <div class="feature-card">
                <h3>Mượn và trả sách</h3>
                <p>Quản lý việc mượn và trả sách một cách hiệu quả.</p>
            </div>
            
            <div class="feature-card">
                <h3>Quản lý độc giả</h3>
                <p>Theo dõi thông tin và hoạt động của độc giả.</p>
            </div>
        </div>
    </div>
    
    <!-- Login Modal -->
    <div id="login-modal" class="modal">
        <div class="modal-content">
            <span class="close-button" id="close-login">&times;</span>
            <h2>Đăng nhập</h2>
            <form id="login-form">
                <div class="form-group">
                    <label for="login-username">Tên đăng nhập:</label>
                    <input type="text" id="login-username" required>
                </div>
                <div class="form-group">
                    <label for="login-password">Mật khẩu:</label>
                    <input type="password" id="login-password" required>
                </div>
                <button type="submit" class="submit-button">Đăng nhập</button>
            </form>
            <div class="form-toggle">
                <p>Chưa có tài khoản? <a href="#" id="switch-to-register">Đăng ký ngay</a></p>
            </div>
        </div>
    </div>
    
    <!-- Register Modal -->
    <div id="register-modal" class="modal">
        <div class="modal-content">
            <span class="close-button" id="close-register">&times;</span>
            <h2>Đăng ký</h2>
            <form id="register-form">
                <div class="form-group">
                    <label for="register-fullname">Họ và tên:</label>
                    <input type="text" id="register-fullname" required>
                </div>
                <div class="form-group">
                    <label for="register-username">Tên đăng nhập:</label>
                    <input type="text" id="register-username" required>
                </div>
                <div class="form-group">
                    <label for="register-email">Email:</label>
                    <input type="email" id="register-email" required>
                </div>
                <div class="form-group">
                    <label for="register-password">Mật khẩu:</label>
                    <input type="password" id="register-password" required>
                </div>
                <div class="form-group">
                    <label for="register-confirm-password">Xác nhận mật khẩu:</label>
                    <input type="password" id="register-confirm-password" required>
                </div>
                <button type="submit" class="submit-button">Đăng ký</button>
            </form>
            <div class="form-toggle">
                <p>Đã có tài khoản? <a href="#" id="switch-to-login">Đăng nhập</a></p>
            </div>
        </div>
    </div>
    
    <script>
        // Local storage keys
        const USERS_KEY = 'library_users';
        const CURRENT_USER_KEY = 'library_current_user';
        
        // DOM Elements
        const loginButton = document.getElementById('login-button');
        const registerButton = document.getElementById('register-button');
        const logoutButton = document.getElementById('logout-button');
        const userDisplay = document.getElementById('user-display');
        const authButtons = document.querySelector('.auth-buttons');
        const userInfo = document.querySelector('.user-info');
        
        const loginModal = document.getElementById('login-modal');
        const registerModal = document.getElementById('register-modal');
        const closeLogin = document.getElementById('close-login');
        const closeRegister = document.getElementById('close-register');
        
        const switchToRegister = document.getElementById('switch-to-register');
        const switchToLogin = document.getElementById('switch-to-login');
        
        const loginForm = document.getElementById('login-form');
        const registerForm = document.getElementById('register-form');
        
        // Initialize users array from local storage
        function getUsers() {
            const users = localStorage.getItem(USERS_KEY);
            return users ? JSON.parse(users) : [];
        }
        
        // Save users array to local storage
        function saveUsers(users) {
            localStorage.setItem(USERS_KEY, JSON.stringify(users));
        }
        
        // Check if a user is logged in
        function checkLoggedInStatus() {
            const currentUser = localStorage.getItem(CURRENT_USER_KEY);
            
            if (currentUser) {
                const user = JSON.parse(currentUser);
                userDisplay.textContent = `Xin chào, ${user.fullname}!`;
                loginButton.style.display = 'none';
                registerButton.style.display = 'none';
                userInfo.style.display = 'block';
            } else {
                loginButton.style.display = 'block';
                registerButton.style.display = 'block';
                userInfo.style.display = 'none';
            }
        }
        
        // Event Listeners
        loginButton.addEventListener('click', () => {
            loginModal.style.display = 'block';
        });
        
        registerButton.addEventListener('click', () => {
            registerModal.style.display = 'block';
        });
        
        closeLogin.addEventListener('click', () => {
            loginModal.style.display = 'none';
        });
        
        closeRegister.addEventListener('click', () => {
            registerModal.style.display = 'none';
        });
        
        switchToRegister.addEventListener('click', (e) => {
            e.preventDefault();
            loginModal.style.display = 'none';
            registerModal.style.display = 'block';
        });
        
        switchToLogin.addEventListener('click', (e) => {
            e.preventDefault();
            registerModal.style.display = 'none';
            loginModal.style.display = 'block';
        });
        
        // Close modals when clicking outside
        window.addEventListener('click', (e) => {
            if (e.target === loginModal) {
                loginModal.style.display = 'none';
            }
            if (e.target === registerModal) {
                registerModal.style.display = 'none';
            }
        });
        
        // Handle login form submission
        loginForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const username = document.getElementById('login-username').value;
            const password = document.getElementById('login-password').value;
            
            const users = getUsers();
            const user = users.find(u => u.username === username && u.password === password);
            
            if (user) {
                localStorage.setItem(CURRENT_USER_KEY, JSON.stringify(user));
                loginModal.style.display = 'none';
                loginForm.reset();
                checkLoggedInStatus();
                alert('Đăng nhập thành công!');
            } else {
                alert('Tên đăng nhập hoặc mật khẩu không đúng!');
            }
        });
        
        // Handle register form submission
        registerForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const fullname = document.getElementById('register-fullname').value;
            const username = document.getElementById('register-username').value;
            const email = document.getElementById('register-email').value;
            const password = document.getElementById('register-password').value;
            const confirmPassword = document.getElementById('register-confirm-password').value;
            
            if (password !== confirmPassword) {
                alert('Mật khẩu xác nhận không khớp!');
                return;
            }
            
            const users = getUsers();
            
            // Check if username already exists
            if (users.some(u => u.username === username)) {
                alert('Tên đăng nhập đã tồn tại!');
                return;
            }
            
            // Add new user
            const newUser = {
                id: Date.now().toString(),
                fullname,
                username,
                email,
                password
            };
            
            users.push(newUser);
            saveUsers(users);
            
            localStorage.setItem(CURRENT_USER_KEY, JSON.stringify(newUser));
            registerModal.style.display = 'none';
            registerForm.reset();
            checkLoggedInStatus();
            alert('Đăng ký thành công!');
        });
        
        // Handle logout
        logoutButton.addEventListener('click', (e) => {
            e.preventDefault();
            localStorage.removeItem(CURRENT_USER_KEY);
            checkLoggedInStatus();
            alert('Đăng xuất thành công!');
        });
        
        // Check logged in status on page load
        document.addEventListener('DOMContentLoaded', checkLoggedInStatus);
    </script>
</body>
</html>
