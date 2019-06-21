Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9F94E6F9
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 13:16:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Vbjd2z5SzDqdh
	for <lists+linux-aspeed@lfdr.de>; Fri, 21 Jun 2019 21:16:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pj7cZGNx"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VbjL43DPzDqdx
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 21:16:22 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id y72so3214815pgd.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 21 Jun 2019 04:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ks+wgx/4HM/gUpKQKhvFzIwQsEuEY3r2Qt0MyQ+nHZs=;
 b=pj7cZGNxXfRtnwmfrCkITH3hZW2lPhrJn3adSPIX70yPFItqoE8Cwe9r5T6J0cKGZr
 LqMLpLf7NxOPGAP6hq+JEBXwrlMEZoa4x6p4YSAP2Yc8v1fEZz4mCwpHLeb8MH1vZ76p
 9NtyN+fI5VqPSWS/T/5XOZe1QAsp+F4eM77QffnQXR8Us6hMLCLyadn3lI123FOm818m
 RYprRcx7brgcSI4vK1K5PUEX4YDL2Cfwn0rJhsrUxqO+6Fno2m5Tfmd430PUvQ9eZb1E
 3jpsx1cshwZq3yMh4O88D2J9HEhVCkA4AWyv1jVY4HMMqFJXXZsn8Gu3xYWLX3Qx91Rc
 4zSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ks+wgx/4HM/gUpKQKhvFzIwQsEuEY3r2Qt0MyQ+nHZs=;
 b=drq9RrWMSEqpZHK2e6eUBeDsIZmqbZZ3LLeKHwtO3eGMchFjEiVk+ZKb12veeA1guJ
 BJ8spT/yscBUGetlqA0Z9C2kW2fSET0ij2yhN2he2cFSGdIaHUSrVaOQkifrIIdfB6c+
 o7+r/tCZnope9uuh96QiHU8c54hgdLlRMAwC/VE/2XQd9lEaC04GvJQAvbclyYOoNPMc
 7ijd79VsEndfGbd6C3gfgd3SRK7TswZvLsQQOSphP8Tw3Oq3i7fzeBYJLk2ulQp8LSU9
 XO9c6Vok6H8ptErU25h8GIKFQU1CP2RmGXdZMlbLJUfqu59XfVb9IgK5nFX3xh5P1JRS
 mSEQ==
X-Gm-Message-State: APjAAAWYrtNf3RO4VlT3MS5Fod02Qf/Ggx33hXy6kzs3OQIZmIEQ+Ekt
 78vWiIH6LEJIToIjUnE4sks=
X-Google-Smtp-Source: APXvYqzCufeGfxRq1tfK229KQkh0+mNnU9qPRl2p/RMjJ2iDTt35Mcn/vG1OOl9rh/Tn+liYek6hFQ==
X-Received: by 2002:a63:7749:: with SMTP id s70mr5409461pgc.242.1561115780790; 
 Fri, 21 Jun 2019 04:16:20 -0700 (PDT)
Received: from Pilot130.192.168.0.22 (211-20-114-70.HINET-IP.hinet.net.
 [211.20.114.70])
 by smtp.googlemail.com with ESMTPSA id w4sm2405737pfw.97.2019.06.21.04.16.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 21 Jun 2019 04:16:20 -0700 (PDT)
From: "sudheer.v" <open.sudheer@gmail.com>
To: gregkh@linuxfoundation.org, jslaby@suse.com, joel@jms.id.au,
 andrew@aj.id.au, benh@kernel.crashing.org, robh+dt@kernel.org,
 mark.rutland@arm.com, shivahshankar.shankarnarayanrao@aspeedtech.com,
 shivahshankar@gmail.com, sudheer.veliseti@aspeedtech.com
Subject: [patch 4/5] defconfig and MAINTAINERS updated for AST2500 DMA UART
 driver
Date: Fri, 21 Jun 2019 16:47:34 +0530
Message-Id: <1561115855-4186-5-git-send-email-open.sudheer@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
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
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: sudheer veliseti <sudheer.open@gmail.com>

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

