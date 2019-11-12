Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCAEF8884
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 07:29:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByX50WXCzF40v
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 17:29:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OvKlxnDR"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ByWZ1zdVzF3x0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 17:29:14 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id z188so5235468pgb.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 22:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U/bWaj0szJR7cn04OcMANcYdDLfd8dXKvtkQWnPu6Xg=;
 b=OvKlxnDR83/iuTJMCCeYcCHFlWwwqHFeMn/Eqk8aTc60JZoQAlcFR3v+/1oJr/pUNi
 IaHvh0unSfRo7FEQgx+lwi64ZI+nos0+2W1tuRSBZQ6AT+vacyNTQoeX+a23+c56oSvH
 SPdgd7v4TLuI0nvJC7Nr+jLfC0hW0WBp3kAFqwPywYj1+3VJuJPkgTLh5QslEL0RY9z2
 1N1pRnX9jNJbLobDWIZjhW+J4dtiPMc95Q7nBL1Ug9Ssr2l7EMpCXH3hxLY7aS0SwF4K
 zaMdPAyUNqNyD8cIcvIZ3/O9MpgeFdYVvbRIlq5JmUM8vx92iQYwCNqYLTAwrQmXMuLQ
 MKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U/bWaj0szJR7cn04OcMANcYdDLfd8dXKvtkQWnPu6Xg=;
 b=bhYJ/NVpJj4BTjkVSmOl7YpoKFrm0SzaDa+/G6CXvg69ZHIE1Fxjhwd3e1/M9TsEVU
 hq6p2DlF+WMKUVmL4PpTzCs+7QAj98dxiL1OUZbU8BsKFI2sVY8gHWA7+vtZgoRlsyUa
 uGIW1Z+qJJcReoiKrM+dvPpgMNfMe+QAC3pjyBUCf0b4glEt1jliYZoDbTMej936fpUC
 2Kg/9/hefC8n2iA8htnwYP27/NTSEi/T02nsSO0iet81hEYNPCtThLW6nSTGolVHGuMj
 d7ughez/XG6Btr8LsN/HIvTu2J+EQKTAqA+U8tmOJ8oOVtAwAcZkoh7PeYPN/ykxTvoM
 oWCA==
X-Gm-Message-State: APjAAAUw1fpgGIZ1ZldGERwOR4pF6JmeSH0X2gUfiLrvJXAfSqV867Xn
 4WKHVRTcMS647yO0P+Z7ub4=
X-Google-Smtp-Source: APXvYqy+fUimLndQRp4lL9ZASeVUtnRJL4udnnXTh/5ojc2uFhtolJG4UhLP3TeB92+3sKdUXv6SKw==
X-Received: by 2002:a17:90a:1a08:: with SMTP id 8mr4339048pjk.12.1573540152191; 
 Mon, 11 Nov 2019 22:29:12 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x20sm18573707pfa.186.2019.11.11.22.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:29:11 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 2/5] ARM: config: aspeed-g5: Add SGPIO and FSI drivers
Date: Tue, 12 Nov 2019 16:58:54 +1030
Message-Id: <20191112062857.32638-3-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112062857.32638-1-joel@jms.id.au>
References: <20191112062857.32638-1-joel@jms.id.au>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

These are recently merged drivers for ASPEED systems.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index b87508c7056c..b0d056d49abe 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -155,6 +155,7 @@ CONFIG_SPI=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_ASPEED=y
+CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_W1=y
 CONFIG_W1_MASTER_GPIO=y
 CONFIG_W1_SLAVE_THERM=y
@@ -237,8 +238,10 @@ CONFIG_FSI=y
 CONFIG_FSI_MASTER_GPIO=y
 CONFIG_FSI_MASTER_HUB=y
 CONFIG_FSI_MASTER_AST_CF=y
+CONFIG_FSI_MASTER_ASPEED=y
 CONFIG_FSI_SCOM=y
 CONFIG_FSI_SBEFIFO=y
+CONFIG_FSI_OCC=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
 CONFIG_TMPFS=y
-- 
2.24.0

