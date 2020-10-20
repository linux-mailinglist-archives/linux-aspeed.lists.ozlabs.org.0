Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B72944EE
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 00:08:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG76Q6F06zDqdf
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Oct 2020 09:07:58 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ERepXBwF; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG75H5y30zDqfD
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Oct 2020 09:06:57 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id t4so96356plq.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Oct 2020 15:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cVxbxuo00dZr6eR4Osdpd7pA7uQ5RC3VinQNVSJSDBU=;
 b=ERepXBwFXbhB76YhVH5xGuKd028JuTI6ynKg8XjzS4fObj0izAJWcCiDPriiC8pXku
 K+DeUlNlvy3F4ROWV/ISgHIAxzZANhPIz7OZIgp5Oq599ZnSI44ONUu2w5W/VeXo35OQ
 uUBuMuDk+99/NP1/cBCCtKIq7MWDHjefGk+tjk+ov6uHWmsvAUAos9GV7lHk8MgiOyGw
 ml4WzcB1v+xNkvHPCTDCmSQHM8o0qIDIR/nHKwzFDQQ4AI95beVsDc9eHwIG5ahaI4sj
 UnAtsOrwO1tfY2GnzLy+aR3XZQWbkK8lfGWS5z1rKc3p9/b0r3tutFYYHaU2PqxU6fHO
 IjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cVxbxuo00dZr6eR4Osdpd7pA7uQ5RC3VinQNVSJSDBU=;
 b=auHuFPZVqtwdnulb8QQrCihom1H+pZO//s/uEbOR5UGtPtkPA0CuLUar2LqmVS2DEs
 TD3MiPVEKgUcunfgGXwx3m/M8/VfGu8CGXRNUJHlYUdTjYB/8LbdklJ7U6eg148KntcK
 +TBcgN6ILPmO7l0TDDT0sgpmfDFXxhZWrgzPQMXbF8y03XCJaQ7jSHopGhFcraX/Cae5
 TJKDEa99zm3KbSTibsN1D6uZlwJrB3DQhSpqufn2gE+FWdYtasEYT3xKV0KmdpguSGyP
 QX6GBOLxQn/N3jZn9REiJjw+UuCY0J2BTewxGPr4VUjNtLv+73ojyZ9Df+sjagC/EIQ7
 SuWA==
X-Gm-Message-State: AOAM530CXY+Omjgztks0Sxc1jPT+FtX+qunrL8YdZFQQHSsZpS5PLRzF
 L0jPXN2URGpMkPTFh/h2bas=
X-Google-Smtp-Source: ABdhPJypfdOKEQQS14sOZlqq2wpr5US5/1nAoMDWDZRTMOy6PhaWvsSSH5MIeLOWLLSSdW6Ieb8tCw==
X-Received: by 2002:a17:90a:4684:: with SMTP id z4mr179932pjf.97.1603231612719; 
 Tue, 20 Oct 2020 15:06:52 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id n16sm39974pfo.150.2020.10.20.15.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 15:06:51 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dylan Hung <dylan_hung@aspeedtech.com>
Subject: [PATCH] net: ftgmac100: Ensure tx descriptor updates are visible
Date: Wed, 21 Oct 2020 08:36:39 +1030
Message-Id: <20201020220639.130696-1-joel@jms.id.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

We must ensure the tx descriptor updates are visible before updating
the tx pointer.

This resolves the tx hangs observed on the 2600 when running iperf:

root@ast2600:~# iperf3 -c 192.168.86.146 -R
Connecting to host 192.168.86.146, port 5201
Reverse mode, remote host 192.168.86.146 is sending
[  5] local 192.168.86.173 port 43886 connected to 192.168.86.146 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec  90.7 MBytes   760 Mbits/sec
[  5]   1.00-2.00   sec  91.7 MBytes   769 Mbits/sec
[  5]   2.00-3.00   sec  91.7 MBytes   770 Mbits/sec
[  5]   3.00-4.00   sec  91.7 MBytes   769 Mbits/sec
[  5]   4.00-5.00   sec  91.8 MBytes   771 Mbits/sec
[  5]   5.00-6.00   sec  91.8 MBytes   771 Mbits/sec
[  5]   6.00-7.00   sec  91.9 MBytes   771 Mbits/sec
[  5]   7.00-8.00   sec  91.4 MBytes   767 Mbits/sec
[  5]   8.00-9.00   sec  91.3 MBytes   766 Mbits/sec
[  5]   9.00-10.00  sec  91.9 MBytes   771 Mbits/sec
[  5]  10.00-11.00  sec  91.8 MBytes   770 Mbits/sec
[  5]  11.00-12.00  sec  91.8 MBytes   770 Mbits/sec
[  5]  12.00-13.00  sec  90.6 MBytes   761 Mbits/sec
[  5]  13.00-14.00  sec  45.2 KBytes   370 Kbits/sec
[  5]  14.00-15.00  sec  0.00 Bytes  0.00 bits/sec
[  5]  15.00-16.00  sec  0.00 Bytes  0.00 bits/sec
[  5]  16.00-17.00  sec  0.00 Bytes  0.00 bits/sec
[  5]  17.00-18.00  sec  0.00 Bytes  0.00 bits/sec
[   67.031671] ------------[ cut here ]------------
[   67.036870] WARNING: CPU: 1 PID: 0 at net/sched/sch_generic.c:442 dev_watchdog+0x2dc/0x300
[   67.046123] NETDEV WATCHDOG: eth2 (ftgmac100): transmit queue 0 timed out

Fixes: 52c0cae87465 ("ftgmac100: Remove tx descriptor accessors")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 331d4bdd4a67..15cdfeb135b0 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -653,6 +653,11 @@ static bool ftgmac100_tx_complete_packet(struct ftgmac100 *priv)
 	ftgmac100_free_tx_packet(priv, pointer, skb, txdes, ctl_stat);
 	txdes->txdes0 = cpu_to_le32(ctl_stat & priv->txdes0_edotr_mask);
 
+	/* Ensure the descriptor config is visible before setting the tx
+	 * pointer.
+	 */
+	smp_wmb();
+
 	priv->tx_clean_pointer = ftgmac100_next_tx_pointer(priv, pointer);
 
 	return true;
@@ -806,6 +811,11 @@ static netdev_tx_t ftgmac100_hard_start_xmit(struct sk_buff *skb,
 	dma_wmb();
 	first->txdes0 = cpu_to_le32(f_ctl_stat);
 
+	/* Ensure the descriptor config is visible before setting the tx
+	 * pointer.
+	 */
+	smp_wmb();
+
 	/* Update next TX pointer */
 	priv->tx_pointer = pointer;
 
-- 
2.28.0

