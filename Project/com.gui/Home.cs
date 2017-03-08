﻿using Project.com.gui;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Project
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
            userToolStripMenuItem.Enabled = adminToolStripMenuItem.Enabled = logoutToolStripMenuItem.Enabled = false;
        }

        public bool EnableUserMenu
        {
            set { userToolStripMenuItem.Enabled = value; }
        }

        public bool EnableLoginMenu
        {
            set { loginToolStripMenuItem.Enabled = value; }
        }

        public bool EnableLogoutMenu
        {
            set { logoutToolStripMenuItem.Enabled = value; }
        }

        public bool EnableAdminMenu
        {
            set { adminToolStripMenuItem.Enabled = value; }
        }

        private void loginToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Login l = new Login();
            l.MdiParent = this;
            l.StartPosition = FormStartPosition.CenterScreen;
            l.Show();
        }
        
        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void logoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.EnableLoginMenu = true;
            this.EnableAdminMenu = false;
            this.EnableUserMenu = false;
            this.EnableLogoutMenu = false;
        }

        private void addNewBookingToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void addNewAgentToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
    }
}