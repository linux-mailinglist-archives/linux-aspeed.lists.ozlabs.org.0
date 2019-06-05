Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C5335C9F
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 14:22:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JnxX2vnBzDqQZ
	for <lists+linux-aspeed@lfdr.de>; Wed,  5 Jun 2019 22:22:56 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="au49flYF"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JnxN51XfzDqdM
 for <linux-aspeed@lists.ozlabs.org>; Wed,  5 Jun 2019 22:22:48 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id a3so4910737pgb.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 05 Jun 2019 05:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3GAMKG2bkSkOspilJvNkC+5w7eNdhVRmLQMCFlqm2lc=;
 b=au49flYFDpWpe1BM6oyUDx/hlReF8ml02Eius+8cHz1UMaWs9aOlK52QXKER3c/ivX
 WDfu4ZjGLO1XaCnfgbn0l6n73icde4Os53KV4ZT4cCOo4BxYua2F5MRWjJApvQqBI7Vy
 tT1byoFOU41Z82RzHu+pSnA0gQKM8IAvGG+mU+4IuVgcfDyGfrrUOSV0ieY59jywqVKi
 rZk5z/u4gxOw6ev5ph26Ev85n5fdBYhW649e+wtwYxBZ6VVYcuIzLdKYC/P1xOn6AFa3
 zPIUM2lj51kO3wQDg6cCfNwoZRmBiCLIS1ofYPaVhZP/lbJ7I12RDY4dOkSlyV8mLYgr
 OFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3GAMKG2bkSkOspilJvNkC+5w7eNdhVRmLQMCFlqm2lc=;
 b=uS7iCEidzZ2QQY65hDsvtOBqusXPN62qYQKaU2PMNwnAH6OzeHIbEMOLztNZM2TqWY
 FGsvr/sWVLTAvM9SJEMvm352VWhv6Z2kTzN9tqprQRbN0ayxwoWaaO1TAjNMSz09UtNc
 KATDwE/y/5AVYF5L33VGEA+yp8iIMFI8JgLmfV2h9WW/WjLD3UQGrDbY4C8YMqo746Jh
 6uvCIB2LBmGCM7sp6sqYYLi9a8uV4hTfOlNtsPNkslhV65rP+DMx0RmqmNxgI3EOJpU+
 6Ojyvm6TnSB5Y38Xy+VzmEGseS3FbliuD4dThBv1APU0SZIGeP5IVNlBS5O2sMimFNnl
 wOoA==
X-Gm-Message-State: APjAAAVY6hG2pyHRDeOz/Rmg8pV0O3YHCg2pydThleQlPUWmpY1D9CX2
 WNZHz9VxftIpTOEJJJswbZY=
X-Google-Smtp-Source: APXvYqxppjG9m8JUHMI008hu8C6MlDpFXdE6HrHO3yMyYnkRlIDngOMKrYTo8DJhUuRFY87+dC/x1w==
X-Received: by 2002:a62:ed0a:: with SMTP id u10mr14088279pfh.243.1559737366426; 
 Wed, 05 Jun 2019 05:22:46 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id q22sm3322094pff.63.2019.06.05.05.22.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 05:22:46 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, mchehab+samsung@kernel.org, jslaby@suse.com,
 joel@jms.id.au, andrew@aj.id.au, benh@kernel.crashing.org,
 robh+dt@kernel.org, mark.rutland@arm.com,
 shivahshankar.shankarnarayanrao@aspeedtech.com,
 sudheer.veliseti@aspeedtech.com
Subject: [patch 4/5] defconfig and MAINTAINERS updated for AST2500 DMA UART
 driver
Date: Wed,  5 Jun 2019 17:53:14 +0530
Message-Id: <1559737395-28542-5-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
References: <1559737395-28542-1-git-send-email-open.sudheer@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sudheer Kumar veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: sudheer Kumar veliseti <sudheer.open@gmail.com>

Signed-off-by: sudheer veliseti <sudheer.open@gmail.com>
---
 MAINTAINERS                          | 13 +++++++++++++
 arch/arm/configs/aspeed_g5_defconfig |  1 +
 2 files changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 997e27ab492f..c9a9790b97f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1347,6 +1347,19 @@ F:	drivers/crypto/axis
 F:	drivers/pinctrl/pinctrl-artpec*
 F:	Documentation/devicetree/bindings/pinctrl/axis,artpec6-pinctrl.txt
 
+ARM/ASPEED DMA UART DRIVER
+M:	sudheer v <sudheer.open@gmail.com>
+M:	ShivahShankar <shivahshankar.shankarnarayanrao@aspeedtech.com>
+R:	Joel Stanley <joel@jms.id.au>
+R:	Andrew Jeffery <andrew@aj.id.au>
+R:	Vinod Koul <vkoul@kernel.org>
+L:	dmaengine@vger.kernel.org
+L:	openbmc@lists.ozlabs.org
+L:	linux-aspeed@lists.ozlabs.org
+S:	Maintained
+F:	drivers/tty/serial/8250/8250_aspeed_uart_dma.c
+F:	Documentation/devicetree/bindings/serial/ast-sdma-uart.txt
+
 ARM/ASPEED I2C DRIVER
 M:	Brendan Higgins <brendanhiggins@google.com>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 1849cbc161b4..25bf26630939 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -144,6 +144,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=6
 CONFIG_SERIAL_8250_RUNTIME_UARTS=6
+CONFIG_AST_SERIAL_DMA_UART=y
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_ASPEED_VUART=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
-- 
2.17.1

